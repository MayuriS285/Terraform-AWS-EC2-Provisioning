provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-00ca32bbc84273381" 
  instance_type = "t2.micro"   
  key_name      = "Ansible-master-mayuri"

  tags = {
    Name = "GitHubActionsInstance-${count.index + 1}" 
  }
}
output "instance_ids" {
  value = aws_instance.example.*.id
  description = "The IDs of the created EC2 instances"
}

output "public_ips" {
  value = aws_instance.example.*.public_ip
  description = "The public IPs of the created EC2 instances"
}
