# Projektron Install in Docker container

## Introduction
The setup is structured in such a way that the database and Projektron BCS each run in their own container.

## Preparatory work
1. Create the folder bcs,  bcs_install and bcs_backup on your maschine
2. Download all files from the install directory of this github repository to the new bcs_install folder
3. Download from the Projektron website the install jar file (e.g projektron-bcs-23.4.12-installer.jar) and move it to the bcs_install folder
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
```
```bash
java -jar projektron-bcs-23.4.12-installer.jar -options install_parameter.txt
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
Then wait until tomcat has been completely started. The start process can take up to 5 minutes if your machine if your machine only fullfill the minimum requirements. The tomcat server has started successfully if the machine is listening on port 8005. This can be checked with the following command:
*Note: As of version 2.0 of the Projektron Core Container, Tomcat is also started automatically when the container is started so that this step is no longer necessary when the container is restarted and if the current Docker Compose File is used.*

```bash
netstat -tuln
```

2. (Optional) Start Projektron BCS
Note: This step is not necessary. With Projektron version 23.4.12 it is even displayed that Projektron has not been started. Nevertheless, the application was started. 
```bash
/opt/projektron/bcs/bin/ProjektronBCS.sh start
```

