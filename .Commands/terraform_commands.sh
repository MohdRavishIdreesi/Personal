#to create a graph of the terraform resources
sudo apt install graphviz -y
terraform graph | dot -Tpng > graph.png

# to create a plan file
terraform init
terraform plan
terraform apply