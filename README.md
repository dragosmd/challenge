# Terraform AWS 3-Tier Architecture

## Coding Challenge

This repository contains a Terraform configuration for deploying a 3-tier architecture in AWS, including CloudFront distribution, Load Balancer, Auto Scaling Groups, EC2 instances, and S3 backend configuration for managing Terraform state. The configuration also uses security groups for instance access control.

## Directory Structure


- **README.md** # Documentation for the Terraform configuration and deployment 
- **cloudfront.tf** # CloudFront Distribution configuration 
- **lb.tf** # Load Balancer (ALB/NLB) configuration 
- **main.tf** # Main configuration that includes Auto Scaling, Launch Templates, and other resources 
- **output.tf** # Outputs of the deployed infrastructure 
- **providers.tf_old** # AWS provider configuration and S3 Bucket Configuration 
- **saml2aws** # Tool for assuming AWS roles via SAML 
- **sg.tf** # Security Groups configuration for controlling network access 
- **terraform.tfvars** # Values for variables used in the Terraform configuration 
- **variables.tf** # Variable declarations and default values
## Overview

This project configures and provisions a 3-tier architecture in AWS using Terraform. It includes the following components:

- **CloudFront**: A content delivery network (CDN) for distributing application content.
- **Load Balancer (ALB/NLB)**: Distributes incoming traffic across EC2 instances in an Auto Scaling Group (ASG).
- **Auto Scaling Group (ASG)**: Automatically adjusts the number of EC2 instances based on demand.
- **Security Groups**: Provides network access control and secures the EC2 instances.
- **S3 Backend**: Manages the Terraform state remotely, with DynamoDB for state locking.

## main.tf

`main.tf` contains two elements that can be kept or removed, based on your preferences:

1. **Cloud-Init Configuration**: Defines the `cloud-init` configuration using the `template_cloudinit_config` function. This section configures the EC2 instances with any initialization scripts.
   
2. **Dynamically Searching for AMI**: Dynamically searches for the latest Red Hat AMI based on tags using the `aws_ami` data source under the `aws_redhat_cis_8` function. Alternatively, this can be removed and the `ami_id` can be provided manually in the `terraform.tfvars` file.

