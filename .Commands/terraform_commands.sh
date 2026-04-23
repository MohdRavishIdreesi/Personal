=========================================
TERRAFORM INSTALLATION ON UBUNTU - ALL COMMANDS
=========================================

1. Update System
-----------------------------------------
sudo apt update
sudo apt upgrade -y

2. Install Terraform
-----------------------------------------
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

3. Check Terraform Version
-----------------------------------------
terraform -version

4. Remove Terraform (Optional)
-----------------------------------------
sudo apt remove terraform -y

=========================================
END
=========================================

#to create a graph of the terraform resources
sudo apt install graphviz -y
terraform graph | dot -Tpng > graph.png

# to create a plan file
terraform init
terraform plan
terraform apply