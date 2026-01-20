# VEIN Server Scripts

![Shell](https://img.shields.io/badge/language-shell-000000)
![License](https://img.shields.io/badge/license-MIT-000000)
![Release](https://img.shields.io/github/v/release/Montiemedia/vein-server-scripts)
![Issues](https://img.shields.io/github/issues/Montiemedia/vein-server-scripts)
![Stars](https://img.shields.io/github/stars/Montiemedia/vein-server-scripts)

Lightweight Bash tooling for administering a VEIN dedicated server  
(start, stop, update, backup, restore, status).

## Documentation

- 📄 [README (English)](README.md)  
- 🇩🇪 [README (Deutsch)](README.de.md)  
- ⚙️ [Installation Guide (EN)](INSTALL.md)  
- ⚙️ [Installationsanleitung (DE)](INSTALL.de.md)  
- 🔐 [Security Policy](SECURITY.md)  
- 🤝 [Contributing Guidelines](CONTRIBUTING.md)  
- 📜 [License](LICENSE)  
- 📝 [Changelog](CHANGELOG.md)  
- 🚀 [Releases](https://github.com/Montiemedia/vein-server-scripts/releases)

---

## Features

- Start, stop, restart server  
- Update helpers  
- Backup and restore  
- Status, logs and uptime  
- Interactive menu  
- Git helper scripts (push, pull, status, pre-commit secret check)  

---

## Quickstart

```bash
git clone https://github.com/Montiemedia/vein-server-scripts.git
cd vein-server-scripts
chmod +x *.sh
./menu.sh
```

## Script Overview

| Script                           | Purpose                |
| -------------------------------- | ---------------------- |
| `menu.sh`                        | Interactive menu       |
| `start.sh`                       | Start VEIN server      |
| `stop.sh`                        | Stop VEIN server       |
| `restart.sh`                     | Restart VEIN server    |
| `update.sh`                      | Update server scripts  |
| `backup.sh`                      | Create backup          |
| `restore.sh`                     | Restore backup         |
| `status.sh`                      | Check server status    |
| `uptime.sh`                      | Show server uptime     |
| `logs.sh`                        | View server logs       |
| `git_push.sh`                    | Git commit and push    |
| `git_pull.sh`                    | Git pull               |
| `git_status.sh`                  | Git repository status  |
| `git_precommit_secrets_check.sh` | Pre-commit secret scan |


---

## Installation

- English: [INSTALL.md](INSTALL.md)  
- German: [INSTALL.de.md](INSTALL.de.md)

---

## Configuration

This repository intentionally contains no secrets.  
All configuration values, credentials, tokens or environment-specific settings must be provided externally.

Use at your own risk.  
Adapt paths and permissions to your environment.

---

## Security

See [SECURITY.md](SECURITY.md)

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

---

## License

MIT License  
See [LICENSE](LICENSE)

