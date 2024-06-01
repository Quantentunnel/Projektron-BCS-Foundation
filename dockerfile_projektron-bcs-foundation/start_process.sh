#!/bin/bash

# Starte den ursprünglichen Prozess im Hintergrund
if [ -z "$(ls -A /opt/projektron/bcs)" ] && [ -z "$(ls -A /opt/projektron/bcs/tomcat)" ]; then
	echo "Directories are empty, running background process."
	tail -f /dev/null &
else
	echo "Directories are not empty, starting the startup script."
	/opt/projektron/bcs/tomcat/bin/startup.sh &
	sleep 600
	echo "Starting Projectron.sh after 10 minutes."
	/opt/projektron/bcs/bin/Projectron.sh start
fi
