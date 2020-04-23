# SPM lcov action

Swift Package Manager Code Coverage Report.

## Inputs

### `output-file`

**Optional** Specify a file path to write coverage reports into. By default, the coverage will be reported to `.build/debug/codecov/lcov.info`. If the directory does not exist, it is created.

### `file-format`

**Optional** Use the specified output format. The supported formats are: “text” (JSON), “lcov” (Default).

## Example usage

uses: maxep/spm-lcov-action@0.2.0