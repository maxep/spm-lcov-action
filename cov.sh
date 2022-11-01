#!/bin/sh -l

PATH=$PATH
BIN_PATH="$(swift build --show-bin-path)"
XCTEST_PATH="$(find ${BIN_PATH} -name '*.xctest')"
COV_BIN=$XCTEST_PATH
CMD="llvm-cov"
if ! command -v "$CMD" &> /dev/null
then
    CMD="xcrun llvm-cov"
fi

INSTR_PROFILE=.build/debug/codecov/default.profdata
IGNORE_FILENAME_REGEX=".build|Tests"

FORMAT="lcov"
OUTPUT_FILE=.build/debug/codecov/lcov.info

while :; do
    case $1 in
        -f|--format) FORMAT=$2
        shift
        ;;
        -o|--output) OUTPUT_FILE=$2
        shift
        ;;
        *) break
    esac
    shift
done

if [[ "$OSTYPE" == "darwin"* ]]; then
    f="$(basename $XCTEST_PATH .xctest)"
    COV_BIN="${COV_BIN}/Contents/MacOS/$f"
    PATH="/usr/local/opt/llvm/bin:$PATH"​
fi

mkdir -p "$(dirname "$OUTPUT_FILE")"

$CMD report \
    "${COV_BIN}" \
    -instr-profile=$INSTR_PROFILE \
    -ignore-filename-regex=$IGNORE_FILENAME_REGEX \
    -use-color

$CMD export \
    "${COV_BIN}" \
    -instr-profile=$INSTR_PROFILE \
    -ignore-filename-regex=$IGNORE_FILENAME_REGEX \
    -format=$FORMAT > $OUTPUT_FILE