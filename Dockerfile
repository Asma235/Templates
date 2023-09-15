# Use the official Ubuntu base image
FROM ubuntu:20.04

# Update and install necessary dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip

# Download and install Terraform
RUN curl -fsSL https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip -d /usr/local/bin/ && \
    rm terraform.zip

# Verify Terraform installation
RUN terraform --version

# Define a default working directory
#WORKDIR /app

# Set an entrypoint (optional)
#ENTRYPOINT ["/usr/local/bin/terraform"]
