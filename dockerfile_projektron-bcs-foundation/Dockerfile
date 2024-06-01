# Basis Ubuntu Image
FROM ubuntu:24.04

# Label
LABEL version="2.0"
LABEL description="Image for Projection BCS Foundation"


# Start as root to update the system and install the packages
USER root

# Update system and install necessary packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y gettext net-tools openjdk-11-jre netcat-traditional


# Set environment variable
RUN echo 'JAVA_HOME="/usr/bin/java"' >> /etc/environment

# Create the projektron folder
RUN mkdir  /opt/projektron

# Set the working directory
WORKDIR /opt/projektron

# Copy start script
COPY ./start_process.sh /opt/projektron/start_processes.sh
RUN chmod +x /opt/projektron/start_processes.sh

# Copy motd file into the container
COPY motd /etc/motd

# Ensure the motd file is used
RUN echo 'cat /etc/motd' >> ~/.bashrc

# Start background process or startup script based on directory contents
CMD ["/opt/projektron/start_processes.sh"]