# VEIN Server Scripts

![Shell](https://img.shields.io/badge/language-shell-000000)
![License](https://img.shields.io/badge/license-MIT-000000)
![Release](https://img.shields.io/github/v/release/Montiemedia/vein-server-scripts)
![Issues](https://img.shields.io/github/issues/Montiemedia/vein-server-scripts)
![Stars](https://img.shields.io/github/stars/Montiemedia/vein-server-scripts)

Leichtgewichtige Bash-Tools zur Verwaltung eines VEIN Dedicated Servers  
(Start, Stopp, Update, Backup, Restore, Status).

---

## Dokumentation

- 📄 [README (Englisch)](README.md)  
- 🇩🇪 [README (Deutsch)](README.de.md)  
- ⚙️ [Installationsanleitung (EN)](INSTALL.md)  
- ⚙️ [Installationsanleitung (DE)](INSTALL.de.md)  
- 🔐 [Sicherheitsrichtlinie](SECURITY.md)  
- 🤝 [Beitragsrichtlinien](CONTRIBUTING.md)  
- 📜 [Lizenz](LICENSE)  
- 📝 [Changelog](CHANGELOG.md)  
- 🚀 [Releases](https://github.com/Montiemedia/vein-server-scripts/releases)

---

## Funktionen

- Server starten, stoppen und neu starten  
- Update-Hilfen  
- Backup und Wiederherstellung  
- Status, Logs und Uptime  
- Interaktives Menü  
- Git-Hilfsskripte (Push, Pull, Status, Pre-Commit-Secret-Check)  

---

## Schnellstart

```bash
git clone https://github.com/Montiemedia/vein-server-scripts.git
cd vein-server-scripts
chmod +x *.sh
./menu.sh
```

## Skript-Übersicht
| Skript                           | Zweck                        |
| -------------------------------- | ---------------------------- |
| `menu.sh`                        | Interaktives Menü            |
| `start.sh`                       | VEIN-Server starten          |
| `stop.sh`                        | VEIN-Server stoppen          |
| `restart.sh`                     | VEIN-Server neu starten      |
| `update.sh`                      | Server-Skripte aktualisieren |
| `backup.sh`                      | Backup erstellen             |
| `restore.sh`                     | Backup wiederherstellen      |
| `status.sh`                      | Serverstatus prüfen          |
| `uptime.sh`                      | Serverlaufzeit anzeigen      |
| `logs.sh`                        | Server-Logs anzeigen         |
| `git_push.sh`                    | Git Commit & Push            |
| `git_pull.sh`                    | Git Pull                     |
| `git_status.sh`                  | Git-Repository-Status        |
| `git_precommit_secrets_check.sh` | Pre-Commit-Secret-Scan       |

---

## Installation

- Englisch: [INSTALL.md](INSTALL.md)  
- Deutsch: [INSTALL.de.md](INSTALL.de.md)

---

## Konfiguration

Dieses Repository enthält bewusst **keine Zugangsdaten oder Geheimnisse**.  
Alle Konfigurationswerte, Zugangsdaten, Tokens oder umgebungsspezifischen Einstellungen müssen extern bereitgestellt werden.

Nutzung auf eigene Verantwortung.  
Passe Pfade und Berechtigungen an deine Umgebung an.

---

## Sicherheit

Siehe [SECURITY.md](SECURITY.md)

---

## Mitwirken

Siehe [CONTRIBUTING.md](CONTRIBUTING.md)

---

## Lizenz

MIT-Lizenz  
Siehe [LICENSE](LICENSE)


