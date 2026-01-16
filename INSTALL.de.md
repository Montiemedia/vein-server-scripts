# Installationsanleitung – VEIN Server Skripte

Dieses Dokument beschreibt die Installation und Nutzung der **VEIN Server Skripte**
auf einem Linux-System mit installiertem VEIN Dedicated Server.

Die Skripte richten sich an **Systemadministratoren** und setzen grundlegende
Kenntnisse in Linux, Bash und Git voraus.

---

## Voraussetzungen

- Linux-System (Server oder VM)
- Bash (empfohlen: >= 4.x)
- Git
- Installierter VEIN Dedicated Server
- Ausreichende Berechtigungen zur Verwaltung der VEIN-Verzeichnisse

Optional, aber empfohlen:
- Eigener Systembenutzer für den VEIN Server (z. B. `vein`)
- Cockpit oder eine andere Admin-Oberfläche (optional)

---

## Empfohlene Verzeichnisstruktur

Die Skripte sind dafür gedacht, **neben der VEIN-Installation** zu liegen.

Beispiel:

```

/opt/games/vein/
├── scripts/        # dieses Repository
├── game/           # VEIN Spieldateien
├── data/           # VEIN Laufzeit- und Save-Daten
├── backups/        # Backup-Archive (werden von backup.sh erstellt)

````

Wenn deine Struktur abweicht, müssen die Pfade in den Skripten angepasst werden.

---

## Installation

### 1. Repository klonen

```bash
cd /opt/games/vein
git clone https://github.com/Montiemedia/vein-server-scripts.git scripts
````

Alternativ kann das Repository auch an einem anderen Ort geklont werden.
In diesem Fall müssen die Pfade in den Skripten angepasst werden.

---

### 2. Ausführungsrechte setzen

```bash
cd /opt/games/vein/scripts
chmod +x *.sh
```

---

### 3. Konfiguration und Pfade prüfen (wichtig)

Vor der ersten Nutzung sollten die Skripte **durchgesehen** werden, insbesondere:

* Basis-Pfade zur VEIN-Installation
* Backup-Zielverzeichnisse
* Benutzer- und Rechteannahmen

Besonders relevante Dateien:

* `lib.sh`
* `setup.sh`
* `backup_core.sh`

Dieses Repository enthält **keine Konfigurationsdateien oder Zugangsdaten**.

---

### 4. Initiales Setup (optional, empfohlen)

```bash
./setup.sh
```

Je nach Implementierung erstellt oder prüft dieses Skript notwendige
Verzeichnisse und Berechtigungen.

---

## Nutzung

### Interaktives Menü (empfohlener Einstieg)

```bash
./menu.sh
```

Das Menü bietet Zugriff auf die wichtigsten Funktionen:

* Starten / Stoppen / Neustarten des Servers
* Updates
* Backup und Restore
* Status- und Log-Anzeigen

---

### Direkte Nutzung einzelner Skripte

Alle Skripte können auch direkt ausgeführt werden, z. B.:

```bash
./start.sh
./stop.sh
./backup.sh
./status.sh
```

Die meisten Skripte sind **nicht-interaktiv** ausgelegt und können
für Automatisierung oder Panel-Anbindungen genutzt werden.

---

## Git-Hilfsskripte (optional)

Zusätzlich sind Hilfsskripte zur Pflege dieses Repositories enthalten:

* `git_push.sh` – Änderungen committen und pushen
* `git_pull.sh` – Updates vom Repository holen
* `git_status.sh` – Repository-Status anzeigen
* `git_precommit_secrets_check.sh` – Prüfung auf Secrets vor Commits

Diese Skripte sind **nicht erforderlich** für den Betrieb des VEIN Servers.

---

## Sicherheitshinweis

Dieses Repository enthält **bewusst keine Zugangsdaten oder Secrets**.

Nicht im Repository ablegen:

* Passwörter
* Tokens
* API-Keys
* Private Schlüssel

Alle umgebungsspezifischen Werte müssen extern bereitgestellt werden.

---

## Haftungsausschluss

Die Skripte werden **ohne Gewähr** bereitgestellt.

Sie basieren auf einem realen Produktiv-Setup, können jedoch von deiner
Umgebung abweichen.

Vor der Nutzung sollten alle Skripte geprüft werden.
Die Verwendung erfolgt auf eigene Verantwortung.


