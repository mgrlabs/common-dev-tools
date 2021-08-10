FROM ubuntu:latest

RUN apt-get update && \
    apt install -y \
        sudo \
        curl \
        software-properties-common

# Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Terraform & Packer
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
        sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
            sudo apt install \
                terraform \
                packer

# Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl