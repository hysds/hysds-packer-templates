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
     - The following AWS command will give you the latest CentOS7 AMI (according to https://stackoverflow.com/questions/40835953/how-to-find-ami-id-of-centos-7-image-in-aws-marketplace)
     ```
     aws ec2 describe-images \
       --owners 'aws-marketplace' \
       --filters 'Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce' \
       --query 'sort_by(Images, &CreationDate)[-1].[ImageId]' \
       --output 'text'
     ```
   - Subnet ID (to use for building the images)
1. Run the build script:
   ```
   ./build_aws.sh <AMI ID> <subnet ID>
   ```
