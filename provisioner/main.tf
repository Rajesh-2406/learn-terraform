resource  "aws_instance" "web" {
  ami                    = data.aws_ami.example.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-00a06bc0fff373ab1"]

  tags = {
    name = "HelloWorld"
  }

  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }
    inline = [
      "sudo labauto ansible",
      "ansible-pull -i localhost, -u  https://github.com/Rajesh-2406/roboshop-ansible main.yml -e role_name=frontend"
    ]
  }
}

data  "aws_ami" "example" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"

}