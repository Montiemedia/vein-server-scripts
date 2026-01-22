# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog and this project follows Semantic Versioning.

## [Unreleased]

### Added
- 

### Changed
- 

### Fixed
- 

## [1.0.1] - 2026-01-22

### Added
- Regression test for the pre-commit secret scan.

### Changed
- Clarified lib.sh header documentation.

### Fixed
- Corrected Markdown code fences in INSTALL.md.
- Updated secret scan ignore patterns to match the helper script filename.

## [1.0.0] - 2026-01-20

### Added
- Public initial release of VEIN Server Scripts
- Core Bash scripts for VEIN administration:
  - start.sh – Start VEIN server
  - stop.sh – Stop VEIN server
  - restart.sh – Restart VEIN server
  - update.sh – Update server scripts
  - backup.sh – Create backup
  - restore.sh – Restore backup
  - status.sh – Check server status
  - uptime.sh – Show server uptime
  - logs.sh – View server logs
  - menu.sh – Interactive script menu
- Git helper scripts:
  - git_push.sh – Git commit & push
  - git_pull.sh – Git pull
  - git_status.sh – Git repository status
  - git_precommit_secrets_check.sh – Pre-commit secret scan
- Installation guides included:
  - INSTALL.md – English installation instructions
  - INSTALL.de.md – German installation instructions
- Community & contribution files:
  - CONTRIBUTING.md
  - CODE_OF_CONDUCT.md
  - SECURITY.md
  - Issue templates
  - Pull request template
