# hysds-packer-templates
Packer templates for HySDS.

## Requisites
- Install packer: https://packer.io/

### AWS
1. Install the AWS CLI (https://aws.amazon.com/cli/) and configure your AWS credentials:
   ```
   aws configure
   ```
1. Using your AWS account, retrive the following information:
   - CentOS7 source AMI (you may pick AMI ID for your region at https://wiki.centos.org/Cloud/AWS but they may be outdated)
   - Subnet ID (to use for building the images)
1. Run the build script:
   ```
   ./build_aws.sh <AMI ID> <subnet ID>
   ```
