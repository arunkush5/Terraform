provider "aws" {
	region 	= "ap-south-1"
	profile	= "TfUser"
}

//Create key_pairs

resource "aws_key_pair" "nike" {
	key_name  	=  "nike-key"	
	public_key	=  "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAuhhZj3culsV6LkJmzzNQ/GHaLBP2KzaNMFtxFcv2JlHkF5GzuMBzDkY2xnek0DAc5JTZ34tOo8QMpZU3f1rV41z1cXx4YfhhcG3S7jSRMnsdNsmQdJvapYIzQQZ/zHkL6bwF5C2oN2kbysmvrVRmDxYK52QeOH5pToV33ydogT1NO0X/yoElPP6Uj4wCNsqiL9Zh6OLTtQVqJJa2cNrMBJ5D2lH+6HCQ16U7X9xLWHkT15BhKLbCoPUpBZvG3pt0+Urmq84CSqftgen/mYYQWwPXCzWaH8m4sJ+QJNdfwTd1IGk2aIct0tsnQQLd+cAy5UNJL3vA1hpptJj0S0IjAw== rsa-key-20200613"
}

///add inbound rule which allow SSH & HTTP port only
resource "aws_security_group" "sg_task01" {
	name	=  "sg_task01"
	vpc_id	=  "vpc-bfedf0d7"


	ingress{
	  from_port	=  22
	  to_port	=  22
	  description 	=  "SSH"
	  protocol	=  "tcp"
	  cidr_blocks	=  ["0.0.0.0/0"]
	}
	ingress{
	  from_port	=  0
	  to_port	=  80
	  description 	=  "HTTP"
	  protocol	=  "tcp"
	  cidr_blocks	=  ["0.0.0.0/0"]
	}
	
	tags = {
	  Name = "sg_task01"
	}
}
