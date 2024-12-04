variable "region" {
  default = "eu-west-2"
}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "instance_type" {
  default = "t3a.small"
}
variable "ami_id" {
  description = "AMI or RH CIS immage"
}
variable "key_name" {
  description = "ssh key"
}
variable "mandatory_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
variable "asg_instance_tags" {
  description = "Tags for Auto Scaling Group"
  type        = map(string)
  default     = {}
}