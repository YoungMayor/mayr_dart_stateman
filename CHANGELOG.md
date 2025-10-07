# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2025-10-07

### Added
- Comprehensive test coverage with 33+ test cases
- Detailed documentation and comments throughout the codebase
- GitHub Actions workflow for automated publishing to pub.dev
- Enhanced code documentation with detailed method and class descriptions
- Type safety tests for various payload types

### Changed
- Applied software engineering principles (KISS, DRY, SRP, SOC)
- Improved code quality by removing unnecessary `this.` qualifiers
- Enhanced inline documentation for better developer experience
- Formatted entire codebase with `dart format`
- Refactored code to follow Dart best practices

### Fixed
- All linting issues resolved
- Code analysis warnings eliminated

---

## 0.1.0

- Initial release 🎉
- Introduced `MayrStateman` class with flexible and easy-to-use state management along with `MayrStatus`.
- Supported states: `empty`, `error`, `idle`, `loading`, `success`, `updating`.
- Added support for:
  - Setting and getting status easily
  - Managing payloads of any type
  - Handling messages associated with the state
  - Emoji getter for state visualisation
- Exported everything under a simple and clean API.
