# Dart & Flutter Standards

## 1. Package Management (`pubspec.yaml`)
- **Approval Required**: NEVER add a new package or dependency to the project without explicit, specific approval from the user.
- **First-Party First**: Always check if there is a first-party package that can accomplish a task. If so, propose the adoption and proceed with the inclusion in the project only if the user approves it.
- **Pubspec Integrity**: When approved to use a package, you MUST ensure it is properly added to `pubspec.yaml`. 
- **Warnings**: Do not ignore `depend_on_referenced_packages` warnings. Fix them by properly declaring the dependency.

## File Handling and Generation

- **Lock Files**: Never access `*.lock` files (e.g., `pubspec.lock`) unless explicitly prompted by the user.
- **Generated Files**: Always ensure that generated files (e.g., `*.g.dart`, `*.freezed.dart`, `*.freezed.g.dart`) are added to `.gitignore` and `.dockerignore`.

## 2. Linters and Analysis (`analysis_options.yaml`)
- **Discuss First**: Whenever you encounter a linter warning, discuss it with the user to determine the appropriate fix if the solution is not immediately obvious.
- **No Stealth Ignores**: ONLY add an "exception" or "ignore" rule to `analysis_options.yaml` upon explicit instructions from the user to do so.

## 3. Testing & Analysis
- **Meaningful Tests**: Always add meaningful tests for an app feature *after* it has been completed and explicitly approved. Do not preemptively write tests for features still actively being discussed or designed.
- **Pre-Push Verification**: ALWAYS run `melos test` (or the equivalent test suite) and verify that all tests pass before making a git push.
- **Analyzer Check**: ALWAYS run `dart analyze .` in the workspace and ensure there are NO warnings before pushing. All warnings must be actively addressed along with passing code updates. After creating or updating a Pull Request, you MUST check the status of the PR's CI pipeline to ensure it passes.