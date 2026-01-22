# Installation Guide – VEIN Server Scripts

This document describes how to install and use the VEIN Server Scripts
on a Linux system running a VEIN dedicated server.

The scripts are designed for **system administrators** and assume
basic familiarity with Linux, Bash and Git.

---

## Requirements

- Linux system (server or VM)
- Bash (>= 4.x recommended)
- Git
- VEIN dedicated server already installed
- Sufficient permissions to manage the VEIN server directories

Optional but recommended:
- A dedicated system user for the VEIN server (e.g. `vein`)
- Cockpit or another admin interface (optional)

---

## Directory Layout (recommended)

The scripts are intended to live alongside the VEIN installation.

Example layout:

```

/opt/games/vein/
├── scripts/        # this repository
├── game/           # VEIN game files
├── data/           # VEIN runtime / save data
├── backups/        # backup archives (created by backup.sh)

```

Adjust paths inside the scripts if your setup differs.

---

## Installation

### 1. Clone the repository

```bash
cd /opt/games/vein
git clone https://github.com/Montiemedia/vein-server-scripts.git scripts
```

Alternatively, clone to a different location and adapt paths accordingly.

---

### 2. Set executable permissions

```bash
cd /opt/games/vein/scripts
chmod +x *.sh
```

---

### 3. Review configuration and paths

Before first use, **inspect the scripts** and verify:

* base paths to VEIN installation
* backup directory locations
* user and permission assumptions

Important files to review:

* `lib.sh`
* `setup.sh`
* `backup_core.sh`

No configuration files or secrets are included in this repository.

---

### 4. Initial setup (optional but recommended)

```bash
./setup.sh
```

This may create or validate required directories and permissions,
depending on your environment.

---

## Usage

### Interactive menu (recommended entry point)

```bash
./menu.sh
```

The menu provides access to most common operations:

* start / stop / restart
* update
* backup / restore
* status and logs

---

### Direct script usage

All scripts can also be executed directly, for example:

```bash
./start.sh
./stop.sh
./backup.sh
./status.sh
```

Most scripts are designed to be **non-interactive** and suitable for
automation or panel integration.

---

## Git helper scripts (optional)

The repository includes helper scripts for maintaining the scripts
themselves:

* `git_push.sh` – commit and push changes
* `git_pull.sh` – pull updates
* `git_status.sh` – show repository status
* `git_precommit_secrets_check.sh` – scan for secrets before commit

These are **not required** for operating the VEIN server.

---

## Security Notice

This repository intentionally contains **no secrets**.

Do **not** store:

* passwords
* tokens
* API keys
* private keys

inside this repository.

All environment-specific values must be provided externally.

---

## Disclaimer

These scripts are provided **as-is**.
They reflect a real-world production setup but may not match your environment.

Always review scripts before execution.
Use at your own risk.

