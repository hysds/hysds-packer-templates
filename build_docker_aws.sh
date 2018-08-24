#!/bin/bash
PACKER_LOG=1
DATE=$(date '+%Y%m%d')

source_ami=$1
subnet_id=$2
comp="docker_base"

packer build -var "access_key=$(grep aws_access_key_id $HOME/.aws/credentials | head -1 | awk '{print $3}')" \
             -var "secret_key=$(grep aws_secret_access_key $HOME/.aws/credentials | head -1 | awk '{print $3}')" \
             -var "region=$(grep aws_secret_access_key $HOME/.aws/config | head -1 | awk '{print $3}')" \
             -var "ami_name=centos-7-x86_64-${comp}-${DATE}" \
             -var "source_ami=${source_ami}" \
             -var "volume_size=20" \
             -var "subnet_id=${subnet_id}" \
             -var "hysds_component=${comp}" \
             docker_aws.json
