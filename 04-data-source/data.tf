data  "aws_ec2_spot_price" "example" {
  instance_type = "t3.medium"
  availability_zone = "us-east-1a"

  filter  {
    name  = "product-description"
    values  = ["Linux/Unix"]
  }
}

output  "price" {
  value = data.aws_ec2_spot_price.example.spot_price
}

data  "aws_security_group"  "selected"  {
  name  = "allow-all"
}
output  "sgid"  {
  value = data.aws_security_group.selected.id
}

data  "aws_ami" "example" {
  owners  = ["amazon"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

provider  "aws" {
  region = "us-east-1"
}