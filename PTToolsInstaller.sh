#!/bin/bash

sudo apt update
sudo apt install -y python3-pip
sudo apt install unzip

# Install DNSRecon
sudo apt install dnsrecon

# Install Sublist3r
pip3 install Sublist3r

# Install Subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Assetfinder
go install -v github.com/tomnomnom/assetfinder@latest

# Install Findomain
FINDOMAIN_VERSION="9.0.4" # Replace with the latest version
wget "https://github.com/Findomain/Findomain/releases/download/${FINDOMAIN_VERSION}/findomain-linux.zip"
unzip "findomain-linux.zip" -d findomain
chmod +x findomain/findomain
sudo mv findomain/findomain /usr/local/bin/
sudo chown ubuntu:ubuntu /usr/local/bin/findomain
rm -r findomain "findomain-linux.zip"

# Install Amass
go install -v github.com/owasp-amass/amass/v4/...@master

# Install Dnsx
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

# Install Httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# Install Nuclei
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

# Install Katana
go install github.com/projectdiscovery/katana/cmd/katana@latest

# Install Gau
go install github.com/lc/gau/v2/cmd/gau@latest

# Verifying installations
echo "Verifying installations..."
go version
sublist3r -h
subfinder -h
assetfinder -h
findomain --version
amass -version
echo "Installation of tools complete."
