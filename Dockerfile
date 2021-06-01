FROM sonarqube:8.9.0-community 
USER root
RUN apt-get useradd && useradd -u 2001 sonar
#apt-get update && apt-get install -y maven && apt-get install nano
