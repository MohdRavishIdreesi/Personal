# =======================
# ✅ Aliases
# =======================

alias show_AZ_VM_Instance="az vm list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, Size:hardwareProfile.vmSize, OS:storageProfile.osDisk.osType, ProvisioningState:provisioningState}' --output table"
alias show_AZ_VM_Size="az vm list-sizes --location eastus --query '[].{Name:name, NumberOfCores:numberOfCores, MemoryInMB:memoryInMb, MaxDataDiskCount:maxDataDiskCount}' --output table"
alias show_AZ_VM_Disk="az disk list --query '[].{Name:name, SizeGB:diskSizeGb, Sku:sku.name, ProvisioningState:provisioningState, ManagedBy:managedBy}' --output table"
alias show_AZ_SSH_Key="az sshkey list --query '[].{Name:name, Location:location, ResourceGroup:resourceGroup, PublicKey:publicKey}' --output table"
alias show_AZ_Network_SecurityGroup="az network nsg list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location}' --output table"
alias show_AZ_Subnet="az network vnet subnet list --vnet-name myVNet --resource-group myGroup --query '[].{Name:name, AddressPrefix:addressPrefix, ProvisioningState:provisioningState}' --output table"
alias show_AZ_VNet="az network vnet list --query '[].{Name:name, AddressSpace:addressSpace.addressPrefixes[0], Location:location, ResourceGroup:resourceGroup}' --output table"
alias show_AZ_PublicIP="az network public-ip list --query '[].{Name:name, IPAddress:ipAddress, ResourceGroup:resourceGroup, AllocationMethod:publicIpAllocationMethod, ProvisioningState:provisioningState}' --output table"
alias show_AZ_NetworkInterface="az network nic list --query '[].{Name:name, ResourceGroup:resourceGroup, PrivateIP:ipConfigurations[0].privateIpAddress, Subnet:ipConfigurations[0].subnet.id}' --output table"
alias show_AZ_Regions="az account list-locations --query '[].{Name:name, DisplayName:displayName, RegionalDisplayName:regionalDisplayName}' --output table"
alias show_AZ_AD_User="az ad user list --query '[].{UserPrincipalName:userPrincipalName, DisplayName:displayName, AccountEnabled:accountEnabled}' --output table"
alias show_AZ_Storage_Account="az storage account list --query '[].{Name:name, Location:location, ResourceGroup:resourceGroup, Sku:sku.name}' --output table"
alias show_AZ_Storage_Container="az storage container list --account-name mystorageaccount --query '[].{Name:name, PublicAccess:properties.publicAccess}' --output table"
alias show_AZ_Monitor_Metrics="az monitor metrics list-definitions --resource <resource-id> --query 'value[].{Name:name.value, Namespace:namespace}' --output table"
alias show_AZ_Monitor_Alerts="az monitor alert list --query '[].{Name:name, Enabled:enabled, Description:description, Condition:condition}' --output table"
alias show_AZ_SQL_Server="az sql server list --query '[].{Name:name, Location:location, AdminLogin:administratorLogin, Version:version}' --output table"
alias show_AZ_SQL_DB="az sql db list --resource-group myGroup --server myserver --query '[].{Name:name, Edition:edition, Status:status, Size:requestedServiceObjectiveName}' --output table"
alias show_AZ_FunctionApp="az functionapp list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, State:state}' --output table"
alias show_AZ_Container_Instances="az container list --query '[].{Name:name, Location:location, Status:provisioningState, Image:containers[0].image}' --output table"
alias show_AZ_AKS="az aks list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, NodeCount:agentPoolProfiles[0].count}' --output table"
alias show_AZ_KeyVault="az keyvault list --query '[].{Name:name, Location:location, Sku:properties.sku.name}' --output table"
alias show_AZ_KeyVault_Keys="az keyvault key list --vault-name myVault --query '[].{Name:name, KeyType:keyType}' --output table"
alias show_AZ_Deployments="az deployment group list --resource-group myGroup --query '[].{Name:name, Timestamp:timestamp, State:properties.provisioningState}' --output table"


# =======================
# ✅ Compute (VM Equivalent)
# =======================
az vm list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, Size:hardwareProfile.vmSize, OS:storageProfile.osDisk.osType, ProvisioningState:provisioningState}' --output table
az vm list-sizes --location eastus --query '[].{Name:name, NumberOfCores:numberOfCores, MemoryInMB:memoryInMb, MaxDataDiskCount:maxDataDiskCount}' --output table
az disk list --query '[].{Name:name, SizeGB:diskSizeGb, Sku:sku.name, ProvisioningState:provisioningState, ManagedBy:managedBy}' --output table
az sshkey list --query '[].{Name:name, Location:location, ResourceGroup:resourceGroup, PublicKey:publicKey}' --output table

# =======================
# 🔐 Networking
# =======================
az network nsg list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location}' --output table
az network vnet subnet list --vnet-name myVNet --resource-group myGroup --query '[].{Name:name, AddressPrefix:addressPrefix, ProvisioningState:provisioningState}' --output table
az network vnet list --query '[].{Name:name, AddressSpace:addressSpace.addressPrefixes[0], Location:location, ResourceGroup:resourceGroup}' --output table
az network public-ip list --query '[].{Name:name, IPAddress:ipAddress, ResourceGroup:resourceGroup, AllocationMethod:publicIpAllocationMethod, ProvisioningState:provisioningState}' --output table
az network nic list --query '[].{Name:name, ResourceGroup:resourceGroup, PrivateIP:ipConfigurations[0].privateIpAddress, Subnet:ipConfigurations[0].subnet.id}' --output table
az account list-locations --query '[].{Name:name, DisplayName:displayName, RegionalDisplayName:regionalDisplayName}' --output table

# =======================
# 👤 IAM
# =======================
az ad user list --query '[].{UserPrincipalName:userPrincipalName, DisplayName:displayName, AccountEnabled:accountEnabled}' --output table

# =======================
# ☁️ Storage
# =======================
az storage account list --query '[].{Name:name, Location:location, ResourceGroup:resourceGroup, Sku:sku.name}' --output table
az storage container list --account-name mystorageaccount --query '[].{Name:name, PublicAccess:properties.publicAccess}' --output table

# =======================
# 📊 Monitoring
# =======================
az monitor metrics list-definitions --resource <resource-id> --query 'value[].{Name:name.value, Namespace:namespace}' --output table
az monitor alert list --query '[].{Name:name, Enabled:enabled, Description:description, Condition:condition}' --output table

# =======================
# 🛢️ Database
# =======================
az sql server list --query '[].{Name:name, Location:location, AdminLogin:administratorLogin, Version:version}' --output table
az sql db list --resource-group myGroup --server myserver --query '[].{Name:name, Edition:edition, Status:status, Size:requestedServiceObjectiveName}' --output table

# =======================
# ⚙️ Lambda, ECS, EKS
# =======================
az functionapp list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, State:state}' --output table
az container list --query '[].{Name:name, Location:location, Status:provisioningState, Image:containers[0].image}' --output table
az aks list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, NodeCount:agentPoolProfiles[0].count}' --output table

# =======================
# 🔐 Key Management
# =======================
az keyvault list --query '[].{Name:name, Location:location, Sku:properties.sku.name}' --output table
az keyvault key list --vault-name myVault --query '[].{Name:name, KeyType:keyType}' --output table

# =======================
# ☁️ Deployments
# =======================
az deployment group list --resource-group myGroup --query '[].{Name:name, Timestamp:timestamp, State:properties.provisioningState}' --output table
