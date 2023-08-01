data  "aws_ec2_spot_price" "example" {
  instance_type = "t2.medium"
  availability_zone = "us-east-1a"
}

output "price" {
  value = data.aws_ec2_spot_price.example.spot_price
}

