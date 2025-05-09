#!/bin/bash

set -e  # Exit script immediately on error
trap 'echo "Error occurred at line $LINENO"; exit 1' ERR

# ====== Default Configuration ======
DEFAULT_INSTANCE_ID="give your"
DEFAULT_KEY_PATH=$HOME
DEFAULT_LINUX_USER=ubuntu
DEFAULT_REGION=ap-south-1
DEFAULT_KEY_NAME=UNIX.pem
DEFAULT_CHOICE=y

function InstanceState_FN {
  State=$(aws ec2 describe-instances \
    --instance-ids "$INSTANCE_ID" \
    --region "$REGION" \
    --query 'Reservations[0].Instances[0].State.Name' \
    --output text)
  echo $State
}

function PUBLIC_IP_FN {
  IP=$(aws ec2 describe-instances \
    --instance-ids "$INSTANCE_ID" \
    --region "$REGION" \
    --query 'Reservations[0].Instances[0].PublicIpAddress' \
    --output text)
  echo $IP
}

function Start_Instance {
  aws ec2 start-instances --instance-ids $INSTANCE_ID --region $REGION > /dev/null 2>&1
  InstanceState=$(InstanceState_FN)
  echo -n "Starting: ["
  while [[ "$InstanceState" = "running" || "$InstanceState" = "stopping" ]]; do
    echo instance $INSTANCE_ID is $InstanceState
    InstanceState=$(InstanceState_FN)
  done
  echo "] Stopped!"          # Finish the bar and print 'Done!'
  echo This instance $INSTANCE_ID is now $InstanceState
  for i in {1..100}; do
      sleep 0.2
      echo -ne "Booting OS: $i%\r"
  done
  echo -e "\nCompleted!"


}

function Stop_Instance {
  aws ec2 stop-instances --instance-ids $INSTANCE_ID --region $REGION > /dev/null 2>&1
  InstanceState=$(InstanceState_FN)
  echo -n "Stopping: ["
  while [[ "$InstanceState" = "running" || "$InstanceState" = "stopping" ]]; do
    echo -n "#"         # Add a '#' without moving to next line
    InstanceState=$(InstanceState_FN)
  done
  echo "] Stopped!"          # Finish the bar and print 'Done!'
  echo This instance $INSTANCE_ID is now $InstanceState
}

function SSH_Connect {
  echo "Connecting to selected running instance: $INSTANCE_ID"
  
  PUBLIC_IP=$(PUBLIC_IP_FN)
  
  ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i "$KEY_PATH/$KEY_NAME.pem" "$LINUX_USER@$PUBLIC_IP"

  read -p "Do you want to stop the Instance [$INSTANCE_ID] : [$DEFAULT_CHOICE]: " CHOICE
  CHOICE=${CHOICE:-$DEFAULT_CHOICE}

  if [ "$CHOICE" = "y" ]; then
    Stop_Instance
  else
    echo Exiting the script AWS instance $INSTANCE_ID is still running.
    exit 0
  fi
}

function RunningInstance_FN {
  aws ec2 describe-instances \
  --query 'Reservations[*].Instances[*].{
      InstanceId: InstanceId,
      InstanceName: Tags[?Key==`Name`]|[0].Value,
      StateName: State.Name,
      InstanceType: InstanceType,
      PublicIpAddress: PublicIpAddress,
      PrivateIpAddress: PrivateIpAddress,
      KeyName: KeyName,
      LaunchTime: LaunchTime
  }' \
  --output table
}

echo # these are the running instances

RunningInstance_FN

echo

# ====== Reading variables ======
read -p "Select INSTANCE_ID: [$DEFAULT_INSTANCE_ID]: " INSTANCE_ID
INSTANCE_ID=${INSTANCE_ID:-$DEFAULT_INSTANCE_ID}
read -p "Select KEY_PATH: [$DEFAULT_KEY_PATH]: " KEY_PATH
KEY_PATH=${KEY_PATH:-$DEFAULT_KEY_PATH}
read -p "Select LINUX_USER: [$DEFAULT_LINUX_USER]: " LINUX_USER
LINUX_USER=${LINUX_USER:-$DEFAULT_LINUX_USER}
read -p "Select REGION: [$DEFAULT_REGION]: " REGION
REGION=${REGION:-$DEFAULT_REGION}

DEFAULT_KEY_NAME=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --region "$REGION" \
  --query 'Reservations[0].Instances[0].KeyName' \
  --output text)

read -p "Select KEY_NAME: [$DEFAULT_KEY_NAME.pem]: " KEY_NAME
KEY_NAME=${KEY_NAME:-$DEFAULT_KEY_NAME}

# ====== Check arguments ======
if [[ -z "$INSTANCE_ID" || -z "$KEY_PATH" ]]; then
  echo "Usage: $0 <instance-id> <path-to-key.pem> [username] [region]"
  exit 1
fi

echo "Checking the status of the instance..."

InstanceState=$(InstanceState_FN)

if [ "$InstanceState" = "running" ]; then

  SSH_Connect

else

  echo "$INSTANCE_ID is stopped"
  read -p "Do you want to start the Instance {$INSTANCE_ID} : [$DEFAULT_CHOICE]: " CHOICE
  CHOICE=${CHOICE:-$DEFAULT_CHOICE}

  if [ "$CHOICE" = "y" ]; then
    Start_Instance
    SSH_Connect
  else
    echo Exiting the script AWS instance is still stopped
    exit 0
  fi

fi
