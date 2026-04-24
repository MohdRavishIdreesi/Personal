#!/bin/bash

# ============================================================
# DevOps Full Setup Script
# Installs:
#   Git
#   GitHub SSH Key Setup
#   Terraform
#   Docker
#   Docker Compose
#   Java 21
#   Jenkins
#
# Waits until GitHub SSH key is added manually
# Then continues automatically
#
# At end prints:
#   Jenkins Password
#   Jenkins Login URL
#   All Installed Versions
# ============================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}========== SYSTEM UPDATE ==========${NC}"
sudo apt update && sudo apt upgrade -y

# ============================================================
# GIT INSTALLATION
# ============================================================
echo -e "${GREEN}========== INSTALLING GIT ==========${NC}"
sudo apt install git -y

git config --global user.name "MohdRavishIdreesi"
git config --global user.email "mohd.ravish.idreesi@gmail.com"

echo -e "${GREEN}Git Installed:${NC}"
git --version

echo -e "${GREEN}Git Config:${NC}"
git config --list

# ============================================================
# SSH KEY SETUP
# ============================================================
echo -e "${GREEN}========== GITHUB SSH KEY SETUP ==========${NC}"

if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "mohd.ravish.idreesi@gmail.com" -N "" -f ~/.ssh/id_ed25519
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo ""
echo -e "${YELLOW}========== COPY THIS SSH KEY TO GITHUB ==========${NC}"
cat ~/.ssh/id_ed25519.pub
echo ""
echo "Go to GitHub:"
echo "Settings -> SSH and GPG Keys -> New SSH Key"
echo ""

read -p "Press ENTER after adding SSH key to GitHub..."

echo -e "${GREEN}Testing GitHub SSH Connection...${NC}"
ssh -T git@github.com || true

# ============================================================
# TERRAFORM INSTALLATION
# ============================================================
echo -e "${GREEN}========== INSTALLING TERRAFORM ==========${NC}"

wget -O- https://apt.releases.hashicorp.com/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com \
$(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install terraform -y

# ============================================================
# DOCKER INSTALLATION
# ============================================================
echo -e "${GREEN}========== INSTALLING DOCKER ==========${NC}"

sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker $USER

# ============================================================
# DOCKER COMPOSE INSTALLATION
# ============================================================
echo -e "${GREEN}========== INSTALLING DOCKER COMPOSE ==========${NC}"

sudo apt install docker-compose-plugin
sleep 10

# ============================================================
# JAVA + JENKINS INSTALLATION
# ============================================================
echo -e "${GREEN}========== INSTALLING JAVA & JENKINS ==========${NC}"

sudo apt install fontconfig openjdk-21-jre -y

sudo mkdir -p /etc/apt/keyrings

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | \
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins -y

sudo systemctl enable jenkins
sudo systemctl start jenkins

sleep 10

# ============================================================
# FINAL OUTPUT
# ============================================================
echo ""
echo -e "${GREEN}========== INSTALLATION COMPLETE ==========${NC}"

echo ""
echo -e "${GREEN}Installed Versions:${NC}"

echo "Git:"
git --version

echo ""
echo "Terraform:"
terraform -version | head -n 1

echo ""
echo "Docker:"
docker --version

echo ""
echo "Docker Compose:"
docker compose version

echo ""
echo "Java:"
java -version 2>&1 | head -n 1

echo ""
echo "Jenkins:"
jenkins --version || dpkg -l | grep jenkins

echo ""
echo -e "${GREEN}========== JENKINS LOGIN DETAILS ==========${NC}"

IP=$(hostname -I | awk '{print $1}')

echo "Login URL:"
echo "http://$IP:8080"

echo ""
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo ""
echo -e "${YELLOW}IMPORTANT:${NC}"
echo "Logout/Login again OR run:"
echo "newgrp docker"
echo "To use Docker without sudo."
