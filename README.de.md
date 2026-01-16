# VEIN Server Skripte

Dieses Repository enthält eine Sammlung von Bash-Skripten zur Administration
eines **VEIN Dedicated Servers** unter Linux.

Die Skripte sind für den praktischen Serverbetrieb gedacht und decken typische
Wartungs- und Verwaltungsaufgaben ab.

## Funktionen
- Starten, Stoppen und Neustarten des VEIN Servers
- Update- und Setup-Hilfsskripte
- Backup- und Restore-Funktionen
- Status-, Log- und Uptime-Abfragen
- Git-Hilfsskripte für Versionierung und Pflege

## Skripte

| Skript | Zweck |
|------|------|
| start.sh | Startet den VEIN Server |
| stop.sh | Stoppt den VEIN Server |
| restart.sh | Startet den Server neu |
| update.sh | Aktualisiert den Server |
| setup.sh | Initiales Setup / Vorbereitung |
| backup.sh | Erstellt ein Backup |
| restore.sh | Stellt ein Backup wieder her |
| status.sh | Zeigt Serverstatus |
| logs.sh | Zeigt Log-Ausgaben |
| uptime.sh | Zeigt Laufzeit |
| menu.sh | Interaktives Administrationsmenü |
| git_push.sh | Git Commit & Push |
| git_pull.sh | Git Pull |
| git_status.sh | Git Repository Status |
| precommit_secrets_check.sh | Prüfung auf Secrets vor Commits |

## Nutzung
```bash
cd scripts
./menu.sh

## Sicherheitshinweis

Dieses Repository enthält bewusst keine Zugangsdaten oder Secrets.

Alle Konfigurationswerte, Zugangsdaten, Tokens oder umgebungsspezifischen
Parameter müssen extern bereitgestellt werden und sind nicht Teil dieses
Repos.

Die Nutzung erfolgt auf eigene Verantwortung.
Pfadnamen, Benutzerrechte und Umgebung müssen an das jeweilige System angepasst werden.
