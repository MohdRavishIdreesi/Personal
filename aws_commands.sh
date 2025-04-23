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

alias show_AWS_EC2_Instance="aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, State.Name, InstanceType, PublicIpAddress, PrivateIpAddress, KeyName, LaunchTime]' --output table"
alias show_AWS_EC2_InstanceType="aws ec2 describe-instance-types --query 'InstanceTypes[*].[InstanceType, VCpuInfo.DefaultVCpus, MemoryInfo.SizeInMiB, InstanceStorageSupported]' --output table"
alias show_AWS_EC2_Volume="aws ec2 describe-volumes --query 'Volumes[*].[VolumeId, Size, VolumeType, State, AvailabilityZone, CreateTime, Encrypted]' --output table"
alias show_AWS_EC2_Key="aws ec2 describe-key-pairs --query 'KeyPairs[*].[KeyName, KeyPairId, KeyType, CreateTime]' --output table"
alias show_AWS_EC2_SecurityGroup="aws ec2 describe-security-groups --query 'SecurityGroups[*].[GroupId, GroupName, Description, VpcId]' --output table"
alias show_AWS_EC2_Image="aws ec2 describe-images --owners self --query 'Images[*].[ImageId, Name, Description, CreationDate, Architecture]' --output table"
alias show_AWS_EC2_Subnet="aws ec2 describe-subnets --query 'Subnets[*].[SubnetId, VpcId, AvailabilityZone, CidrBlock, State, MapPublicIpOnLaunch]' --output table"
alias show_AWS_EC2_Vpc="aws ec2 describe-vpcs --query 'Vpcs[*].[VpcId, CidrBlock, IsDefault, State, DhcpOptionsId]' --output table"
alias show_AWS_EC2_ElasticIP="aws ec2 describe-addresses --query 'Addresses[*].[PublicIp, AllocationId, InstanceId, PrivateIpAddress, Domain]' --output table"
alias show_AWS_EC2_NetworkInterface="aws ec2 describe-network-interfaces --query 'NetworkInterfaces[*].[NetworkInterfaceId, Status, PrivateIpAddress, SubnetId, VpcId, Attachment.InstanceId]' --output table"
alias show_AWS_EC2_Region="aws ec2 describe-regions --query 'Regions[*].[RegionName, Endpoint, OptInStatus]' --output table"
alias show_AWS_EC2_AvalZone="aws ec2 describe-availability-zones --query 'AvailabilityZones[*].[ZoneName, State, RegionName, ZoneId]' --output table"

alias show_AWS_IAM_User="aws iam list-users --query 'Users[*].[UserName,CreateDate]' --output table"

alias show_AWS_S3="aws s3 ls"
alias show_AWS_S3_Bucket="aws s3api list-buckets --query 'Buckets[*].[Name, CreationDate]' --output table"

alias show_AWS_CloudWatch_Metric="aws cloudwatch list-metrics --query 'Metrics[*].[Namespace, MetricName, Dimensions]' --output table"
alias show_AWS_CloudWatch_Alarm="aws cloudwatch describe-alarms --query 'MetricAlarms[*].[AlarmName, StateValue, MetricName, Namespace, Threshold, EvaluationPeriods]' --output table"

alias show_AWS_Rds_Instance="aws rds describe-db-instances --query 'DBInstances[*].[DBInstanceIdentifier, DBInstanceClass, Engine, DBInstanceStatus, Endpoint.Address]' --output table"
alias show_AWS_Rds_Snapshot="aws rds describe-db-snapshots --query 'DBSnapshots[*].[DBSnapshotIdentifier, DBInstanceIdentifier, SnapshotType, Status, SnapshotCreateTime]' --output table"
alias show_AWS_Rds_Cluster="aws rds describe-db-clusters --query 'DBClusters[*].[DBClusterIdentifier, Engine, Status, Endpoint, ClusterCreateTime]' --output table"

alias show_AWS_Lamda="aws lambda list-functions --query 'Functions[*].[FunctionName, Runtime, LastModified, MemorySize, Timeout]' --output table"

alias show_AWS_ECS="aws ecs list-clusters --query 'clusterArns' --output table"
alias show_AWS_EKS="aws eks list-clusters --query 'clusters' --output table"

alias show_AWS_KMS_Key="aws kms list-keys --query 'Keys[*].[KeyId]' --output table"
alias show_AWS_KMS_Alias="aws kms list-aliases --query 'Aliases[*].[AliasName, TargetKeyId]' --output table"

alias show_AWS_Cloudformation="aws cloudformation list-stacks --query 'StackSummaries[*].[StackName, StackStatus, CreationTime]' --output table"
alias show_AWS_Cloudformation_Stack="aws cloudformation describe-stacks --query 'Stacks[*].[StackName, StackStatus, CreationTime, Description]' --output table"

alias show_AWS_Route53_Zone="aws route53 list-hosted-zones --query 'HostedZones[*].[Id, Name, CallerReference, ResourceRecordSetCount]' --output table"

alias show_AWS_SNS_Topic="aws sns list-topics --query 'Topics[*].TopicArn' --output table"
alias show_AWS_SNS_Subscription="aws sns list-subscriptions --query 'Subscriptions[*].[SubscriptionArn, TopicArn, Protocol, Endpoint]' --output table"
alias show_AWS_SQS_Queue="aws sqs list-queues --query 'QueueUrls' --output table"

alias show_AWS_ElasticBeanTalk_ENV="aws elasticbeanstalk describe-environments --query 'Environments[*].[EnvironmentName, EnvironmentId, ApplicationName, Status, Health, VersionLabel]' --output table"
alias show_AWS_ElasticBeanTalk_APP="aws elasticbeanstalk describe-applications --query 'Applications[*].[ApplicationName, Description, DateCreated]' --output table"

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



# aws ec2 run-instances \
#   --image-id ami-0abcdef1234567890 \
#   --count 1 \
#   --instance-type t2.micro \
#   --key-name your-key-pair-name \
#   --security-group-ids sg-0123456789abcdef0 \
#   --subnet-id subnet-0123456789abcdef0 \
#   --region ap-south-1


