provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "example" {
  count         = 2 #
  ami           = "ami-00ca32bbc84273381" 
  instance_type = "t2.micro"   
  key_name      = "Ansible-master-mayuri"

  tags = {
    Name = "GitHubActionsInstance-${count.index + 1}" 
  }
}
