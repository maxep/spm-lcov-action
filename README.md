# SPM lcov action

Swift Package Manager Code Coverage Report.

## Summary Report

The action will report a test coverage summary in your job logs:

```
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
URLConvertible.swift               24                 6    75.00%          16                 4    75.00%          61                 4    93.44%
URLMatchResult.swift               17                 6    64.71%           7                 1    85.71%          26                 3    88.46%
URLMatcher.swift                   25                 4    84.00%           8                 1    87.50%          45                 3    93.33%
URLPatternComponent.swift           9                 0   100.00%           3                 0   100.00%          24                 0   100.00%
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TOTAL                              75                16    78.67%          34                 6    82.35%         156                10    93.59%
```

## LCOV Report

The action will also create a coverage file that can be digested by other actions, such as [romeovs/lcov-reporter-action](https://github.com/romeovs/lcov-reporter-action) that can comment PRs with the coverage report.

## Inputs

#### `output-file` (optional)

Specify a file path of the coverage report. By default, the coverage will be reported to `.build/debug/codecov/lcov.info`. If the directory does not exist, it will be created.

#### `file-format` (optional)

Use the specified output format. The supported formats are: “text” (JSON), “lcov” (Default).

## Example usage
```yml
- name: Run tests
      run: swift test --enable-code-coverage

- name: Test coverage
  uses: maxep/spm-lcov-action@0.3.0
  with:
      output-file: ./coverage/lcov.info
```
