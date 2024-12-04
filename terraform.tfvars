region = "eu-west-2"
vpc_id = "vpc-0d608e98ddd6dd867"
subnet_ids = ["subnet-123456", "subnet-123457"]
ami_id = "ami-0bd893b2b3e39f071"
key_name = "ssh-key"
instance_type = "t3a.small"

mandatory_tags = {
    Terraform = "true"
    Automation = "PLACEHOLDER"
    mnd-applicationid = "app-01234"
    mnd-applicationname = "Engineering"
    mnd-owner = "mail[at]domain.com"
    mnd-supportgroup = "Engineering"
    mnd-projectcode = "12345-123"
    mnd-costcenter = "CCXXXXX"
    mnd-envtype = "dev"
    mnd-envsubtype = "test"
    mnd-dataclassification = "corporate"
    mnd-baseimagename = "AWS_RH8.10_CIS"
    mnd-lifecycle = "pre-live"
}

asg_instance_tags = {
  Role = "WebServer"
  App  = "MyApp"
  Type = "Backend"
}
