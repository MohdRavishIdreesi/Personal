################################################################################################
#to configure aws cli in ubuntu 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
################################################################################################

#EC2 (Instances, Volumes, etc.)
aws ec2 describe-instances
aws ec2 describe-instance-types
aws ec2 describe-volumes
aws ec2 describe-key-pairs
aws ec2 describe-security-groups
aws ec2 describe-images
aws ec2 describe-subnets
aws ec2 describe-vpcs
aws ec2 describe-addresses         # Elastic IPs
aws ec2 describe-network-interfaces
aws ec2 describe-regions
aws ec2 describe-availability-zones

#S3 (Buckets & Objects)
aws s3 ls                          # List all buckets
aws s3 ls s3://your-bucket-name   # List contents of a bucket
aws s3api list-buckets
aws s3api list-objects --bucket your-bucket-name

#IAM (Users, Roles, Policies)
aws iam list-users
aws iam list-roles
aws iam list-groups
aws iam list-policies
aws iam get-user
aws iam list-attached-user-policies --user-name your-user

# CloudWatch
aws cloudwatch list-metrics
aws cloudwatch describe-alarms

# RDS (Relational Database Service)
aws rds describe-db-instances
aws rds describe-db-snapshots
aws rds describe-db-clusters

# Lambda
aws lambda list-functions
aws lambda get-function --function-name your-function-name

# ECS & EKS
aws ecs list-clusters
aws ecs list-tasks --cluster your-cluster-name
aws eks list-clusters

# KMS (Key Management Service)
aws kms list-keys
aws kms list-aliases
aws kms describe-key --key-id your-key-id

# CloudFormation
aws cloudformation list-stacks
aws cloudformation describe-stacks

# Route 53
aws route53 list-hosted-zones
aws route53 list-resource-record-sets --hosted-zone-id your-zone-id

# SNS & SQS
aws sns list-topics
aws sns list-subscriptions
aws sqs list-queues

# Elastic Beanstalk
aws elasticbeanstalk describe-environments
aws elasticbeanstalk describe-applications


################################################################################################

#ALIAS

alias show_AWS_EC2_Instance="aws ec2 describe-instances --query 'Reservations[*].Instances[*].{InstanceId:InstanceId, StateName:State.Name, InstanceType:InstanceType, PublicIpAddress:PublicIpAddress, PrivateIpAddress:PrivateIpAddress, KeyName:KeyName, LaunchTime:LaunchTime}' --output table"
alias show_AWS_EC2_InstanceType="aws ec2 describe-instance-types --query 'InstanceTypes[*].{InstanceType:InstanceType, VCpus:VCpuInfo.DefaultVCpus, MemoryInMiB:MemoryInfo.SizeInMiB, InstanceStorageSupported:InstanceStorageSupported}' --output table"
alias show_AWS_EC2_Volume="aws ec2 describe-volumes --query 'Volumes[*].{VolumeId:VolumeId, Size:Size, VolumeType:VolumeType, State:State, AvailabilityZone:AvailabilityZone, CreateTime:CreateTime, Encrypted:Encrypted}' --output table"
alias show_AWS_EC2_Key="aws ec2 describe-key-pairs --query 'KeyPairs[*].{KeyName:KeyName, KeyPairId:KeyPairId, KeyType:KeyType, CreateTime:CreateTime}' --output table"
alias show_AWS_EC2_SecurityGroup="aws ec2 describe-security-groups --query 'SecurityGroups[*].{GroupId:GroupId, GroupName:GroupName, Description:Description, VpcId:VpcId}' --output table"
alias show_AWS_EC2_Image="aws ec2 describe-images --owners self --query 'Images[*].{ImageId:ImageId, Name:Name, Description:Description, CreationDate:CreationDate, Architecture:Architecture}' --output table"
alias show_AWS_EC2_Subnet="aws ec2 describe-subnets --query 'Subnets[*].{SubnetId:SubnetId, VpcId:VpcId, AvailabilityZone:AvailabilityZone, CidrBlock:CidrBlock, State:State, MapPublicIpOnLaunch:MapPublicIpOnLaunch}' --output table"
alias show_AWS_EC2_Vpc="aws ec2 describe-vpcs --query 'Vpcs[*].{VpcId:VpcId, CidrBlock:CidrBlock, IsDefault:IsDefault, State:State, DhcpOptionsId:DhcpOptionsId}' --output table"
alias show_AWS_EC2_ElasticIP="aws ec2 describe-addresses --query 'Addresses[*].{PublicIp:PublicIp, AllocationId:AllocationId, InstanceId:InstanceId, PrivateIpAddress:PrivateIpAddress, Domain:Domain}' --output table"
alias show_AWS_EC2_NetworkInterface="aws ec2 describe-network-interfaces --query 'NetworkInterfaces[*].{NetworkInterfaceId:NetworkInterfaceId, Status:Status, PrivateIpAddress:PrivateIpAddress, SubnetId:SubnetId, VpcId:VpcId, AttachedInstanceId:Attachment.InstanceId}' --output table"
alias show_AWS_EC2_Region="aws ec2 describe-regions --query 'Regions[*].{RegionName:RegionName, Endpoint:Endpoint, OptInStatus:OptInStatus}' --output table"
alias show_AWS_EC2_AvalZone="aws ec2 describe-availability-zones --query 'AvailabilityZones[*].{ZoneName:ZoneName, State:State, RegionName:RegionName, ZoneId:ZoneId}' --output table"

alias show_AWS_IAM_User="aws iam list-users --query 'Users[*].{UserName:UserName, CreateDate:CreateDate}' --output table"

alias show_AWS_S3="aws s3 ls"
alias show_AWS_S3_Bucket="aws s3api list-buckets --query 'Buckets[*].{Name:Name, CreationDate:CreationDate}' --output table"

alias show_AWS_CloudWatch_Metric="aws cloudwatch list-metrics --query 'Metrics[*].{Namespace:Namespace, MetricName:MetricName, Dimensions:Dimensions}' --output table"
alias show_AWS_CloudWatch_Alarm="aws cloudwatch describe-alarms --query 'MetricAlarms[*].{AlarmName:AlarmName, StateValue:StateValue, MetricName:MetricName, Namespace:Namespace, Threshold:Threshold, EvaluationPeriods:EvaluationPeriods}' --output table"
alias show_AWS_Rds_Instance="aws rds describe-db-instances --query 'DBInstances[*].{DBInstanceIdentifier:DBInstanceIdentifier, DBInstanceClass:DBInstanceClass, Engine:Engine, DBInstanceStatus:DBInstanceStatus, EndpointAddress:Endpoint.Address}' --output table"
alias show_AWS_Rds_Snapshot="aws rds describe-db-snapshots --query 'DBSnapshots[*].{DBSnapshotIdentifier:DBSnapshotIdentifier, DBInstanceIdentifier:DBInstanceIdentifier, SnapshotType:SnapshotType, Status:Status, SnapshotCreateTime:SnapshotCreateTime}' --output table"
alias show_AWS_Rds_Cluster="aws rds describe-db-clusters --query 'DBClusters[*].{DBClusterIdentifier:DBClusterIdentifier, Engine:Engine, Status:Status, Endpoint:Endpoint, ClusterCreateTime:ClusterCreateTime}' --output table"
alias show_AWS_Lamda="aws lambda list-functions --query 'Functions[*].{FunctionName:FunctionName, Runtime:Runtime, LastModified:LastModified, MemorySize:MemorySize, Timeout:Timeout}' --output table"
alias show_AWS_ECS="aws ecs list-clusters --query 'clusterArns[*]' --output table"
alias show_AWS_EKS="aws eks list-clusters --query 'clusters[*]' --output table"

alias show_AWS_KMS_Key="aws kms list-keys --query 'Keys[*].{KeyId:KeyId}' --output table"
alias show_AWS_KMS_Alias="aws kms list-aliases --query 'Aliases[*].{AliasName:AliasName, TargetKeyId:TargetKeyId]' --output table"

alias show_AWS_Cloudformation="aws cloudformation list-stacks --query 'StackSummaries[*].[StackName, StackStatus, CreationTime]' --output table"
alias show_AWS_Cloudformation_Stack="aws cloudformation describe-stacks --query 'Stacks[*].[StackName, StackStatus, CreationTime, Description]' --output table"
alias show_AWS_Route53_Zone="aws route53 list-hosted-zones --query 'HostedZones[*].[Id, Name, CallerReference, ResourceRecordSetCount]' --output table"
alias show_AWS_SNS_Topic="aws sns list-topics --query 'Topics[*].TopicArn' --output table"
alias show_AWS_SNS_Subscription="aws sns list-subscriptions --query 'Subscriptions[*].[SubscriptionArn, TopicArn, Protocol, Endpoint]' --output table"
alias show_AWS_SQS_Queue="aws sqs list-queues --query 'QueueUrls' --output table"
alias show_AWS_ElasticBeanTalk_ENV="aws elasticbeanstalk describe-environments --query 'Environments[*].[EnvironmentName, EnvironmentId, ApplicationName, Status, Health, VersionLabel]' --output table"
alias show_AWS_ElasticBeanTalk_APP="aws elasticbeanstalk describe-applications --query 'Applications[*].[ApplicationName, Description, DateCreated]' --output table"

alias show_AWS_Cloudformation="aws cloudformation list-stacks --query 'StackSummaries[*].{StackName:StackName, StackStatus:StackStatus, CreationTime:CreationTime}' --output table"
alias show_AWS_Cloudformation_Stack="aws cloudformation describe-stacks --query 'Stacks[*].{StackName:StackName, StackStatus:StackStatus, CreationTime:CreationTime, Description:Description}' --output table"
alias show_AWS_Route53_Zone="aws route53 list-hosted-zones --query 'HostedZones[*].{Id:Id, Name:Name, CallerReference:CallerReference, ResourceRecordSetCount:ResourceRecordSetCount}' --output table"
alias show_AWS_SNS_Topic="aws sns list-topics --query 'Topics[*].{TopicArn:TopicArn}' --output table"
alias show_AWS_SNS_Subscription="aws sns list-subscriptions --query 'Subscriptions[*].{SubscriptionArn:SubscriptionArn, TopicArn:TopicArn, Protocol:Protocol, Endpoint:Endpoint}' --output table"
alias show_AWS_SQS_Queue="aws sqs list-queues --query 'QueueUrls[*]' --output table"
alias show_AWS_ElasticBeanTalk_ENV="aws elasticbeanstalk describe-environments --query 'Environments[*].{EnvironmentName:EnvironmentName, EnvironmentId:EnvironmentId, ApplicationName:ApplicationName, Status:Status, Health:Health, VersionLabel:VersionLabel}' --output table"
alias show_AWS_ElasticBeanTalk_APP="aws elasticbeanstalk describe-applications --query 'Applications[*].{ApplicationName:ApplicationName, Description:Description, DateCreated:DateCreated}' --output table"

################################################################################################
################################# AWS COMMANDS CHIT SHEET ######################################
################################################################################################

#EC2 (Instances, Volumes, etc.)

# 1. EC2 Instances
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, State.Name, InstanceType, PublicIpAddress, PrivateIpAddress, KeyName, LaunchTime]' --output table

# 2. Instance Types
aws ec2 describe-instance-types --query 'InstanceTypes[*].[InstanceType, VCpuInfo.DefaultVCpus, MemoryInfo.SizeInMiB, InstanceStorageSupported]' --output table

# 3. Volumes
aws ec2 describe-volumes --query 'Volumes[*].[VolumeId, Size, VolumeType, State, AvailabilityZone, CreateTime, Encrypted]' --output table

# 4. Key Pairs
aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName, KeyPairId, KeyType, CreateTime]' --output table

# 5. Security Groups
aws ec2 describe-security-groups --query 'SecurityGroups[*].[GroupId, GroupName, Description, VpcId]' --output table

# 6. AMIs (Images)
aws ec2 describe-images --owners self --query 'Images[*].[ImageId, Name, Description, CreationDate, Architecture]' --output table

# 7. Subnets
aws ec2 describe-subnets --query 'Subnets[*].[SubnetId, VpcId, AvailabilityZone, CidrBlock, State, MapPublicIpOnLaunch]' --output table

# 8. VPCs
aws ec2 describe-vpcs --query 'Vpcs[*].[VpcId, CidrBlock, IsDefault, State, DhcpOptionsId]' --output table

# 9. Elastic IPs
aws ec2 describe-addresses --query 'Addresses[*].[PublicIp, AllocationId, InstanceId, PrivateIpAddress, Domain]' --output table

# 10. Network Interfaces
aws ec2 describe-network-interfaces --query 'NetworkInterfaces[*].[NetworkInterfaceId, Status, PrivateIpAddress, SubnetId, VpcId, Attachment.InstanceId]' --output table

# 11. Regions
aws ec2 describe-regions --query 'Regions[*].[RegionName, Endpoint, OptInStatus]' --output table

# 12. Availability Zones
aws ec2 describe-availability-zones --query 'AvailabilityZones[*].[ZoneName, State, RegionName, ZoneId]' --output table

################################################################################################
#S3 (Buckets & Objects)

# 13. List all S3 Buckets (Simple View)
aws s3 ls

# 14. List all S3 Buckets (Detailed View)
aws s3api list-buckets --query 'Buckets[*].[Name, CreationDate]' --output table

# 15. List Objects in a Specific Bucket
aws s3api list-objects --bucket your-bucket-name --query 'Contents[*].[Key, LastModified, Size, StorageClass]' --output table

# 16. (Optional) List Object Versions (if versioning is enabled)
aws s3api list-object-versions --bucket your-bucket-name --query 'Versions[*].[Key, VersionId, LastModified, IsLatest, Size, StorageClass]' --output table

# 17. Get Bucket Location
aws s3api get-bucket-location --bucket your-bucket-name

# 18. Get Bucket Policy (if any)
aws s3api get-bucket-policy --bucket your-bucket-name

################################################################################################
#IAM (Users, Roles, Policies)

# 19. List IAM Users
aws iam list-users --query 'Users[*].[UserName, UserId, Arn, CreateDate]' --output table

# 20. List IAM Roles
aws iam list-roles --query 'Roles[*].[RoleName, RoleId, Arn, CreateDate]' --output table

# 21. List IAM Groups
aws iam list-groups --query 'Groups[*].[GroupName, GroupId, Arn, CreateDate]' --output table

# 22. List IAM Policies
aws iam list-policies --query 'Policies[*].[PolicyName, PolicyId, Arn, AttachmentCount, CreateDate]' --output table

# 23. Get Specific User
aws iam get-user --query 'User.[UserName, UserId, Arn, CreateDate]' --output table

# 24. List Policies Attached to a User
aws iam list-attached-user-policies --user-name your-user --query 'AttachedPolicies[*].[PolicyName, PolicyArn]' --output table

################################################################################################
# CloudWatch

# 25. List Metrics
aws cloudwatch list-metrics --query 'Metrics[*].[Namespace, MetricName, Dimensions]' --output table

# 26. Describe Alarms
aws cloudwatch describe-alarms --query 'MetricAlarms[*].[AlarmName, StateValue, MetricName, Namespace, Threshold, EvaluationPeriods]' --output table

################################################################################################
# RDS (Relational Database Service)

# 27. List DB Instances
aws rds describe-db-instances --query 'DBInstances[*].[DBInstanceIdentifier, DBInstanceClass, Engine, DBInstanceStatus, Endpoint.Address]' --output table

# 28. List DB Snapshots
aws rds describe-db-snapshots --query 'DBSnapshots[*].[DBSnapshotIdentifier, DBInstanceIdentifier, SnapshotType, Status, SnapshotCreateTime]' --output table

# 29. List DB Clusters
aws rds describe-db-clusters --query 'DBClusters[*].[DBClusterIdentifier, Engine, Status, Endpoint, ClusterCreateTime]' --output table

################################################################################################
# Lambda

# 30. List Lambda Functions
aws lambda list-functions --query 'Functions[*].[FunctionName, Runtime, LastModified, MemorySize, Timeout]' --output table

# 31. Get a Specific Lambda Function
aws lambda get-function --function-name your-function-name --query 'Configuration.[FunctionName, Runtime, Handler, LastModified, MemorySize]' --output table

################################################################################################
# ECS & EKS

# 32. List ECS Clusters
aws ecs list-clusters --query 'clusterArns' --output table

# 33. List ECS Tasks
aws ecs list-tasks --cluster your-cluster-name --query 'taskArns' --output table

# 34. List EKS Clusters
aws eks list-clusters --query 'clusters' --output table

################################################################################################
# KMS (Key Management Service)

# 35. List Keys
aws kms list-keys --query 'Keys[*].[KeyId]' --output table

# 36. List Aliases
aws kms list-aliases --query 'Aliases[*].[AliasName, TargetKeyId]' --output table

# 37. Describe a Key
aws kms describe-key --key-id your-key-id --query 'KeyMetadata.[KeyId, Arn, Description, Enabled, KeyState, CreationDate]' --output table

################################################################################################
# CloudFormation

# 38. List Stacks
aws cloudformation list-stacks --query 'StackSummaries[*].[StackName, StackStatus, CreationTime]' --output table

# 39. Describe Stacks
aws cloudformation describe-stacks --query 'Stacks[*].[StackName, StackStatus, CreationTime, Description]' --output table

################################################################################################
# Route 53

# 40. List Hosted Zones
aws route53 list-hosted-zones --query 'HostedZones[*].[Id, Name, CallerReference, ResourceRecordSetCount]' --output table

# 41. List Records in a Zone
aws route53 list-resource-record-sets --hosted-zone-id your-zone-id --query 'ResourceRecordSets[*].[Name, Type, TTL, ResourceRecords]' --output table

################################################################################################
# SNS & SQS

# 42. List SNS Topics
aws sns list-topics --query 'Topics[*].TopicArn' --output table

# 43. List SNS Subscriptions
aws sns list-subscriptions --query 'Subscriptions[*].[SubscriptionArn, TopicArn, Protocol, Endpoint]' --output table

# 44. List SQS Queues
aws sqs list-queues --query 'QueueUrls' --output table

################################################################################################
# Elastic Beanstalk

# 45. Describe Environments
aws elasticbeanstalk describe-environments --query 'Environments[*].[EnvironmentName, EnvironmentId, ApplicationName, Status, Health, VersionLabel]' --output table

# 46. Describe Applications
aws elasticbeanstalk describe-applications --query 'Applications[*].[ApplicationName, Description, DateCreated]' --output table

################################################################################################



# =========================
# AWS EC2 CLI ALL-IN-ONE SINGLE LINE COMMANDS
# =========================

# CREATE KEYPAIR
aws ec2 create-key-pair --key-name my-key --query 'KeyMaterial' --output text > my-key.pem

# CREATE SECURITY GROUP
aws ec2 create-security-group --group-name my-sg --description "My SG" --vpc-id vpc-xxxxxxxx

# ADD INGRESS SSH
aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 22 --cidr YOUR_IP/32

# ADD INGRESS HTTP
aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 80 --cidr 0.0.0.0/0

# ADD INGRESS HTTPS
aws ec2 authorize-security-group-ingress --group-name my-sg --protocol tcp --port 443 --cidr 0.0.0.0/0

# ADD EGRESS ALL
aws ec2 authorize-security-group-egress --group-id sg-xxxxxxxx --protocol -1 --cidr 0.0.0.0/0

# CREATE INSTANCE
aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name my-key --security-groups my-sg --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=UbuntuServer}]'

# CREATE VOLUME
aws ec2 create-volume --availability-zone ap-south-1a --size 20 --volume-type gp3

# MODIFY VOLUME SIZE
aws ec2 modify-volume --volume-id vol-xxxxxxxx --size 30

ssh ubuntu@server
lsblk
sudo apt update
sudo apt upgrade -y
sudo resize2fs /dev/xvda
sudo growpart /dev/xvda 
df -h

# STOP INSTANCE
aws ec2 stop-instances --instance-ids i-xxxxxxxx

# CHANGE INSTANCE TYPE (CPU/RAM)
aws ec2 modify-instance-attribute --instance-id i-xxxxxxxx --instance-type "{\"Value\":\"t3.large\"}"

# START INSTANCE
aws ec2 start-instances --instance-ids i-xxxxxxxx

# STOP INSTANCE
aws ec2 stop-instances --instance-ids i-xxxxxxxx

# REBOOT INSTANCE
aws ec2 reboot-instances --instance-ids i-xxxxxxxx

# RENAME SECURITY GROUP TAG
aws ec2 create-tags --resources sg-xxxxxxxx --tags Key=Name,Value=new-sg-name

# DESCRIBE VOLUMES
aws ec2 describe-volumes --query 'Volumes[*].[VolumeId,Size,State,VolumeType]' --output table

# DESCRIBE SECURITY GROUPS
aws ec2 describe-security-groups --query 'SecurityGroups[*].[GroupId,GroupName]' --output table

# DESCRIBE KEYPAIRS
aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName,KeyPairId]' --output table

# DESCRIBE INSTANCES
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]' --output table

# DELETE VOLUME
aws ec2 delete-volume --volume-id vol-xxxxxxxx

# REVOKE INGRESS RULE
aws ec2 revoke-security-group-ingress --group-id sg-xxxxxxxx --protocol tcp --port 22 --cidr YOUR_IP/32

# REVOKE EGRESS RULE
aws ec2 revoke-security-group-egress --group-id sg-xxxxxxxx --protocol -1 --cidr 0.0.0.0/0

# DELETE SECURITY GROUP
aws ec2 delete-security-group --group-id sg-xxxxxxxx

# DELETE KEYPAIR
aws ec2 delete-key-pair --key-name my-key

# TERMINATE INSTANCE
aws ec2 terminate-instances --instance-ids i-xxxxxxxx



# ==================================
# EXTRA AWS EC2 CLI COMMANDS
# ==================================

# CONFIGURE AWS CLI
aws configure

# CHECK CURRENT REGION
aws configure get region

# FIND OFFICIAL UBUNTU AMI (22.04)
aws ssm get-parameter --name /aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id --query "Parameter.Value" --output text

# FIND OFFICIAL UBUNTU AMI (24.04)
aws ssm get-parameter --name /aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id --query "Parameter.Value" --output text

# DESCRIBE SPECIFIC IMAGE
aws ec2 describe-images --image-ids ami-xxxxxxxx --query 'Images[*].[ImageId,Name]' --output table

# CHECK DEFAULT VOLUME SIZE OF AMI
aws ec2 describe-images --image-ids ami-xxxxxxxx --query 'Images[*].BlockDeviceMappings[*].Ebs.VolumeSize' --output table

# CHECK INSTANCE STATE + PUBLIC IP + KEYNAME
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress,KeyName]' --output table

# CHECK TERMINATED INSTANCES
aws ec2 describe-instances --filters "Name=instance-state-name,Values=terminated" --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' --output table

# CHECK ATTACHED VOLUMES OF INSTANCE
aws ec2 describe-instances --instance-ids i-xxxxxxxx --query 'Reservations[*].Instances[*].BlockDeviceMappings[*].[DeviceName,Ebs.VolumeId]' --output table

# CHECK DELETE ON TERMINATION
aws ec2 describe-instances --instance-ids i-xxxxxxxx --query 'Reservations[*].Instances[*].BlockDeviceMappings[*].[DeviceName,Ebs.VolumeId,Ebs.DeleteOnTermination]' --output table

# KEEP ROOT VOLUME AFTER TERMINATION
aws ec2 modify-instance-attribute --instance-id i-xxxxxxxx --block-device-mappings '[{"DeviceName":"/dev/sda1","Ebs":{"DeleteOnTermination":false}}]'

# ATTACH EXISTING VOLUME
aws ec2 attach-volume --volume-id vol-xxxxxxxx --instance-id i-xxxxxxxx --device /dev/sdf

# DETACH VOLUME
aws ec2 detach-volume --volume-id vol-xxxxxxxx

# CHECK VOLUME MODIFICATION STATUS
aws ec2 describe-volumes-modifications --volume-ids vol-xxxxxxxx

# FILTER ONLY UNUSED VOLUMES
aws ec2 describe-volumes --filters "Name=status,Values=available" --query 'Volumes[*].[VolumeId,Size,AvailabilityZone]' --output table

# DESCRIBE SG RULES FULL
aws ec2 describe-security-groups --group-ids sg-xxxxxxxx






# ==========================================
# TOP AWS CLI COMMANDS FOR DEVOPS ENGINEERS
# EC2 + EBS + SG + IAM + S3 + VPC + ASG + ELB
# ==========================================

# ---------- AWS CLI ----------
aws configure
aws configure get region
aws sts get-caller-identity

# ---------- EC2 ----------
aws ec2 describe-instances
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]' --output table
aws ec2 run-instances --image-id ami-xxxxxxxx --instance-type t2.micro --key-name my-key --security-groups my-sg
aws ec2 stop-instances --instance-ids i-xxxxxxxx
aws ec2 start-instances --instance-ids i-xxxxxxxx
aws ec2 reboot-instances --instance-ids i-xxxxxxxx
aws ec2 terminate-instances --instance-ids i-xxxxxxxx
aws ec2 modify-instance-attribute --instance-id i-xxxxxxxx --instance-type "{\"Value\":\"t3.large\"}"
aws ec2 create-tags --resources i-xxxxxxxx --tags Key=Name,Value=webserver

# ---------- KEY PAIRS ----------
aws ec2 create-key-pair --key-name my-key
aws ec2 describe-key-pairs
aws ec2 delete-key-pair --key-name my-key

# ---------- SECURITY GROUP ----------
aws ec2 create-security-group --group-name my-sg --description "My SG" --vpc-id vpc-xxxxxxxx
aws ec2 describe-security-groups
aws ec2 authorize-security-group-ingress --group-id sg-xxxxxxxx --protocol tcp --port 22 --cidr YOUR_IP/32
aws ec2 authorize-security-group-ingress --group-id sg-xxxxxxxx --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id sg-xxxxxxxx --protocol tcp --port 443 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-egress --group-id sg-xxxxxxxx --protocol -1 --cidr 0.0.0.0/0
aws ec2 revoke-security-group-ingress --group-id sg-xxxxxxxx --protocol tcp --port 22 --cidr YOUR_IP/32
aws ec2 revoke-security-group-egress --group-id sg-xxxxxxxx --protocol -1 --cidr 0.0.0.0/0
aws ec2 delete-security-group --group-id sg-xxxxxxxx

# ---------- EBS VOLUMES ----------
aws ec2 create-volume --availability-zone ap-south-1a --size 20 --volume-type gp3
aws ec2 describe-volumes
aws ec2 attach-volume --volume-id vol-xxxxxxxx --instance-id i-xxxxxxxx --device /dev/sdf
aws ec2 detach-volume --volume-id vol-xxxxxxxx
aws ec2 modify-volume --volume-id vol-xxxxxxxx --size 30
aws ec2 describe-volumes-modifications --volume-ids vol-xxxxxxxx
aws ec2 delete-volume --volume-id vol-xxxxxxxx
aws ec2 create-snapshot --volume-id vol-xxxxxxxx --description "backup"
aws ec2 describe-snapshots --owner-ids self

# ---------- AMI ----------
aws ec2 describe-images --owners self
aws ec2 create-image --instance-id i-xxxxxxxx --name my-ami --no-reboot
aws ec2 deregister-image --image-id ami-xxxxxxxx

# ---------- VPC ----------
aws ec2 describe-vpcs
aws ec2 create-vpc --cidr-block 10.0.0.0/16
aws ec2 describe-subnets
aws ec2 create-subnet --vpc-id vpc-xxxxxxxx --cidr-block 10.0.1.0/24 --availability-zone ap-south-1a
aws ec2 describe-route-tables
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --internet-gateway-id igw-xxxxxxxx --vpc-id vpc-xxxxxxxx

# ---------- ELASTIC IP ----------
aws ec2 allocate-address --domain vpc
aws ec2 associate-address --instance-id i-xxxxxxxx --allocation-id eipalloc-xxxxxxxx
aws ec2 release-address --allocation-id eipalloc-xxxxxxxx

# ---------- LOAD BALANCER ----------
aws elbv2 describe-load-balancers
aws elbv2 describe-target-groups
aws elbv2 register-targets --target-group-arn arn:aws:... --targets Id=i-xxxxxxxx
aws elbv2 deregister-targets --target-group-arn arn:aws:... --targets Id=i-xxxxxxxx

# ---------- AUTO SCALING ----------
aws autoscaling describe-auto-scaling-groups
aws autoscaling set-desired-capacity --auto-scaling-group-name my-asg --desired-capacity 2
aws autoscaling update-auto-scaling-group --auto-scaling-group-name my-asg --min-size 1 --max-size 3

# ---------- IAM ----------
aws iam list-users
aws iam create-user --user-name devops-user
aws iam create-access-key --user-name devops-user
aws iam list-roles
aws iam list-policies

# ---------- S3 ----------
aws s3 ls
aws s3 mb s3://my-bucket-name
aws s3 cp file.txt s3://my-bucket-name/
aws s3 sync ./data s3://my-bucket-name/
aws s3 rb s3://my-bucket-name --force

# ---------- CLOUDWATCH ----------
aws cloudwatch list-metrics
aws cloudwatch get-metric-statistics --namespace AWS/EC2 --metric-name CPUUtilization --dimensions Name=InstanceId,Value=i-xxxxxxxx --start-time 2026-04-28T00:00:00Z --end-time 2026-04-29T00:00:00Z --period 300 --statistics Average

# ---------- SYSTEM MANAGER ----------
aws ssm describe-instance-information
aws ssm start-session --target i-xxxxxxxx

# ---------- UBUNTU AMI QUICK FIND ----------
aws ssm get-parameter --name /aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id --query "Parameter.Value" --output text
