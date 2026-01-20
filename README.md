👉 Deutsche Version: [README.de.md](README.de.md)

# VEIN Server Scripts
![Shell](https://img.shields.io/badge/language-shell-000000)
![License](https://img.shields.io/badge/license-MIT-000000)
![Issues](https://img.shields.io/github/issues/Montiemedia/vein-server-scripts)
![Stars](https://img.shields.io/github/stars/Montiemedia/vein-server-scripts)

Lightweight Bash tooling for administering a VEIN dedicated server.

## Features
- Start / stop / restart server
- Update and setup helpers
- Backup and restore
- Status, logs and uptime
- Git helper scripts (push, pull, status, secret check)

## Scripts

| Script | Purpose |
|------|------|
| start.sh | Start VEIN server |
| stop.sh | Stop VEIN server |
| update.sh | Update server |
| backup.sh | Create backup |
| restore.sh | Restore backup |
| menu.sh | Interactive menu |
| git_push.sh | Git commit & push |
| git_pull.sh | Git pull |
| git_status.sh | Git repository status |
| git_precommit_secrets_check.sh | Secret scan before commit |

## Usage
```bash
cd scripts
./menu.sh

## Security Notice

This repository intentionally contains **no secrets**.
All configuration values, credentials, tokens or environment-specific settings
must be provided externally and are not part of this codebase.

Use at your own risk. Adapt paths and permissions to your environment.

This repository reflects a real-world production setup and is intentionally kept simple.
