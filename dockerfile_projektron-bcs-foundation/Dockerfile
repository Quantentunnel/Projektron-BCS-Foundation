# Basis Ubuntu Image
FROM ubuntu:24.04

# Label
LABEL version="1.0"
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

# Start background process
CMD ["tail", "-f", "/dev/null"]
