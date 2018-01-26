FROM jenkins/jenkins:2.103-slim

# Install docker
USER root

RUN apt-get update \
    && apt-get -y install \
        gnupg \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
        vim \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
           "deb [arch=amd64] https://download.docker.com/linux/debian \
           $(lsb_release -cs) \
           stable" \
    && apt-get update \
    && apt-get -y install docker-ce

# change back to parent image user
USER jenkins
