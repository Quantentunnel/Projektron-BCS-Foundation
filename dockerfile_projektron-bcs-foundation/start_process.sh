#!/bin/bash

LOCK_FILE="/tmp/start_processes.lock"

# Prüfen, ob das Skript schon einmal ausgeführt wurde
if [ -f "$LOCK_FILE" ]; then
    echo "Script has already been executed. Skipping."
    exit 0
fi

# Lock-Datei erstellen
touch "$LOCK_FILE"

# Starte den ursprünglichen Prozess im Hintergrund
if [ -z "$(ls -A /opt/projektron/bcs)" ] || [ -z "$(ls -A /opt/projektron/bcs/tomcat)" ]; then
    echo "Directories are empty, running background process."
    tail -f /dev/null
else
    echo "Directories are not empty, starting the startup script."
    # Starte den ursprünglichen Prozess
    /opt/projektron/bcs/tomcat/bin/startup.sh
    tail -f /dev/null
fi