# DevOps Commands & Automation Scripts Repository

This repository contains essential DevOps commands, automation scripts, and configuration files for quick reference and streamlined setup of common tools and platforms. It is organized by technology and use-case, making it easy to find commands or scripts for AWS, Azure, Docker, Jenkins, Linux, and more.

---

## Directory Structure & File Descriptions

### `.Commands/`
**A collection of shell scripts with command references and aliases for various DevOps tools.**
- **aws_commands.sh**  
  AWS CLI command cheat sheet for EC2, S3, IAM, CloudWatch, RDS, Lambda, ECS/EKS, KMS, CloudFormation, Route 53, SNS/SQS, Elastic Beanstalk, and useful AWS CLI aliases.
- **azure_command.sh**  
  Azure CLI command and alias cheat sheet for VMs, networking, IAM, storage, monitoring, databases, containers, AKS, Key Vault, and deployments.
- **docker_commands.sh**  
  Docker command references for creating networks, volumes, running MySQL containers, and building/running Docker images.
- **docker-compose_commands.sh**  
  Common Docker Compose commands for validating, building, running, and stopping containers, plus MySQL container access.
- **git_commands.sh**  
  Essential Git commands for configuration, repository management, branching, merging, and cleaning up.
- **jenkins_commands.sh**  
  Default Jenkins home and workspace directory paths.
- **Linux_commands.sh**  
  Comprehensive Linux command reference covering shell basics, file permissions, piping, redirection, search/sort utilities, and user/group management.
- **terraform_commands.sh**  
  Terraform command references for planning, graphing, and applying infrastructure changes, including visualization with Graphviz.

### `AWS/`
- **AWS_INSTANCE_CONNECT.sh**  
  Bash script to interactively connect to AWS EC2 instances via SSH, including instance state management (start/stop), key handling, and dynamic prompts.

### `Jenkins/`
- **CICD_PIPELINE.groovey**  
  Jenkins pipeline script for CI/CD: cloning a GitHub repo, building with Docker Compose, deploying containers, and running tests.
- **Createfile.groovy**  
  Jenkins pipeline script to create a file (`jenkins_output.txt`) in the workspace with a sample message.

### `Linux/`
- **installation.sh**  
  Interactive Bash script to automate installation and configuration of Git, MySQL, Docker, Jenkins, AWS CLI, and Terraform on Ubuntu. Includes SSH key setup and MySQL user/database creation.
- **NPT&DNS-server-setup-LINUX.sh**  
  Step-by-step guide for setting up NTP (time sync) and DNS (Bind9) servers on Linux, including master/child configuration and network settings.

---

## Usage

- Browse the `.Commands/` directory for quick command references and aliases.
- Use the scripts in `Linux/` and `AWS/` for automated setup and cloud instance management.
- Jenkins pipeline scripts in `Jenkins/` can be used as templates for CI/CD automation.

---

**Note:**  
Some scripts require `sudo` privileges and/or pre-installed dependencies (e.g., Docker, AWS CLI, Terraform, Jenkins). Review each script before running in your environment.

---
