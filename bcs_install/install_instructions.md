# Projektron Install in Docker container

## Introduction
The setup is structured in such a way that the database and Projektron BCS each run in their own container.

## Preparatory work
1. Create the folder bcs and bcs_install on your maschine
2. Download all files from the install directory of the github repository to the new bcs_install folder
3. Download from the Projektron website the install jar file (e.g projektron-bcs-23.4.11-installer.jar) and move it to the bcs_install folder
4. Move your valid licence file to the bcs_install folder. The license file has the file extension .lic.
5. Add the missing data to the file install_parameter.txt. All parameters must be assigned.

## Starting Docker containers
1. Open a terminal and navigate to bcs_install directory
2. Start all container with docker compose:
```bash
docker compose up -d
```

## Perform installation in the Docker Container
1. Enter the bcs container:
```bash
docker exec -it bcs_core bash
```

2. Enter install directory and start the installation
```bash
cd bcs_install
java -jar projektron-bcs-23.4.11-installer.jar -options install_parameter.txt
```

3. Use predefined projektron.conf
```bash
cp /opt/projektron/bcs_install/projektron.conf /opt/projektron/bcs/conf_local
```

4. Create the basic database structure
```bash
/opt/projektron/bcs/install/CreateDB.sh
```

## Start Projektron BCS
1. Start tomcat
```bash
/opt/projektron/bcs/tomcat/bin/startup.sh
```
2. Start Projektron BCS
```bash
/opt/projektron/bcs/bin/ProjektronBCS.sh start
```
The start process can take up to 2 minutes.
