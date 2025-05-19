sudo apt update
sudo apt install graphviz -y

terraform plan -out=tfplan
terraform graph | dot -Tpng > graph.png
terraform show -json tfplan | terraform graph | dot -Tpng > plan.png

terraform init
terraform plan
terraform apply