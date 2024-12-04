Terraform AWS 3-Tier Architecture

Coding Challenge

This repository contains a Terraform configuration for deploying a 3-tier architecture in AWS, including CloudFront distribution, Load Balancer, Auto Scaling Groups, EC2 instances, and S3 backend configuration for managing Terraform state. The configuration also uses security groups for instance access control.

Directory Structure

.
├── cloudfront.tf          # CloudFront Distribution configuration
├── lb.tf                  # Load Balancer (ALB/NLB) configuration
├── main.tf                # Main configuration that includes Auto Scaling, Launch Templates, and other resources
├── output.tf              # Outputs of the deployed infrastructure
├── providers.tf_old       # AWS provider configuration and S3 Bucket Configuration 
├── saml2aws               # Tool for assuming AWS roles via SAML
├── sg.tf                  # Security Groups configuration for controlling network access
├── terraform.tfvars       # Values for variables used in the Terraform configuration
├── variables.tf           # Variable declarations and default values

Overview

This project configures and provisions a 3-tier architecture in AWS using Terraform. It includes the following components:
    CloudFront: A content delivery network (CDN) for distributing application content.
    Load Balancer (ALB/NLB): Distributes incoming traffic across EC2 instances in an Auto Scaling Group (ASG).
    Auto Scaling Group (ASG): Automatically adjusts the number of EC2 instances based on the demand.
    Security Groups: Provides network access control and secures the EC2 instances.
    S3 Backend: Manages the Terraform state remotely, with DynamoDB for state locking.

main.tf contains 2 elements that can be kept or removed:

- Define the cloud-init configuration using template_cloudinit_config
- Dinamically searching for backend ami based on tags under "aws_ami" "aws_redhat_cis_8" function. This can be also removed and revert to var.ami_id
