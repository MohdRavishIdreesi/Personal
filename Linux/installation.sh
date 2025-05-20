#!/bin/bash

set -e  # Exit on any error

# -----------------------------------
# Git Functions
# -----------------------------------

install_git() {
    echo "Updating packages..."
    sudo apt-get update
    echo "Installing Git..."
    sudo apt-get install -y git
    echo "Git installed."
}

configure_git() {
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    echo "Git configured with Username: $git_username, Email: $git_email"
}

setup_ssh_key() {
    read -p "Enter a name for the SSH key file (default: id_ed25519): " key_name
    key_name=${key_name:-id_ed25519}
    ssh-keygen -t ed25519 -C "$git_email" -f "$HOME/.ssh/$key_name" -N ""
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/$key_name"
    echo "SSH key added to agent. Copy this to GitHub:"
    cat "$HOME/.ssh/$key_name.pub"
    echo "Visit: https://github.com/settings/keys"
}

# -----------------------------------
# MySQL Functions
# -----------------------------------

install_mysql() {
    sudo apt-get update
    sudo apt-get install -y mysql-server
    echo "MySQL installed."
}

secure_mysql() {
    echo "Starting MySQL secure installation..."
    sudo mysql_secure_installation
}

create_mysql_user_db() {
    read -p "Enter MySQL root password (press Enter if not set): " rootpass
    read -p "Enter new MySQL username: " mysql_user
    read -p "Enter password for $mysql_user: " mysql_pass
    read -p "Enter name for new database: " mysql_db

    SQL_COMMANDS=$(cat <<EOF
CREATE DATABASE IF NOT EXISTS \`$mysql_db\`;
CREATE USER IF NOT EXISTS '$mysql_user'@'localhost' IDENTIFIED BY '$mysql_pass';
GRANT ALL PRIVILEGES ON \`$mysql_db\`.* TO '$mysql_user'@'localhost';
FLUSH PRIVILEGES;
EOF
    )

    echo "Creating user and database..."
    if [ -z "$rootpass" ]; then
        echo "$SQL_COMMANDS" | sudo mysql -u root
    else
        echo "$SQL_COMMANDS" | mysql -u root -p"$rootpass"
    fi
    echo "User and database created."
}

# -----------------------------------
# Docker Functions
# -----------------------------------

update_system() {
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg lsb-release
}

add_docker_repo() {
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
        https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
}

install_docker_engine() {
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo "Docker installed."
}

add_user_to_docker_group() {
    sudo usermod -aG docker $USER
    newgrp docker
}

install_docker_compose() {
    DOCKER_COMPOSE_VERSION="2.24.1"
    sudo curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
        -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed."
}

verify_docker_install() {
    docker --version
    docker-compose --version
}

docker_installation() {
    update_system
    add_docker_repo
    install_docker_engine
    add_user_to_docker_group
    install_docker_compose
    verify_docker_install
}

# -----------------------------------
# Jenkins Functions
# -----------------------------------

install_jenkins_deps() {
    sudo apt-get update
    sudo apt-get install -y fontconfig openjdk-17-jdk curl gnupg2
}

add_jenkins_repo() {
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | \
        sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
}

install_jenkins() {
    sudo apt-get update
    sudo apt-get install -y jenkins
    echo "Jenkins installed."
}

start_jenkins_service() {
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    sudo systemctl status jenkins --no-pager
}

show_initial_admin_password() {
    echo "Initial Jenkins admin password:"
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
    echo -e "\nAccess Jenkins at: http://localhost:8080"
}

jenkins_installation() {
    install_jenkins_deps
    add_jenkins_repo
    install_jenkins
    start_jenkins_service
    show_initial_admin_password
}

# -----------------------------------
# AWS CLI Functions
# -----------------------------------

install_aws_cli() {
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf aws awscliv2.zip
}

verify_aws_cli() {
    aws --version
}

configure_aws_cli() {
    read -p "Enter AWS Access Key ID: " aws_access_key
    read -p "Enter AWS Secret Access Key: " aws_secret_key
    read -p "Enter Default Region (e.g. us-east-1): " aws_region
    read -p "Enter Default Output Format (json/text/table): " aws_output
    aws configure set aws_access_key_id "$aws_access_key"
    aws configure set aws_secret_access_key "$aws_secret_key"
    aws configure set region "$aws_region"
    aws configure set output "$aws_output"
    echo "AWS CLI configured."
}

aws_installation() {
    install_aws_cli
    verify_aws_cli
    configure_aws_cli
}

# -----------------------------------
# Terraform Functions
# -----------------------------------

install_terraform_deps() {
    sudo apt-get update
    sudo apt-get install -y gnupg software-properties-common curl
}

add_hashicorp_repo() {
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
}

install_terraform() {
    sudo apt-get update
    sudo apt-get install -y terraform
}

verify_terraform() {
    terraform -version
}

terraform_installation() {
    install_terraform_deps
    add_hashicorp_repo
    install_terraform
    verify_terraform
}

# -----------------------------------
# Main Execution
# -----------------------------------

# Ask user for confirmation
ask_to_proceed() {
    read -p "Do you want to install GIT? (yes/no): " choice
    [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]
}

if ask_to_proceed "install Git"; then
    install_git
fi

ask_to_proceed() {
    read -p "Do you want to configure GIT? (yes/no): " choice
    [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]
}

if ask_to_proceed "configure Git"; then
    setup_ssh_key
fi


ask_to_proceed() {
    read -p "Do you want to install MYSQL? (yes/no): " choice
    [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]
}
if ask_to_proceed "install and configure MySQL"; then
    install_mysql
    secure_mysql
    create_mysql_user_db
fi

ask_to_proceed() {
    read -p "Do you want to install Docker and Docker Compose? (yes/no): " choice
    [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]
}
if ask_to_proceed "install Docker and Docker Compose"; then
    docker_installation
fi

ask_to_proceed() {
    read -p "Do you want to install Jenkins? (yes/no): " choice
    [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]
}
if ask_to_proceed "install Jenkins"; then
    jenkins_installation
fi

ask_to_proceed() {
    read -p "Do you want to install AWS CLI? (yes/no): " choice
    [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]
}
if ask_to_proceed "install and configure AWS CLI"; then
    aws_installation
fi

ask_to_proceed() {
    read -p "Do you want to install Terraform? (yes/no): " choice
    [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]
}
if ask_to_proceed "install Terraform"; then
    terraform_installation
fi

echo "✅ All selected installations and configurations are complete."
