variable "region-name" {
	  default = "us-east-1"
	}
variable "vpc-name" {
  default = "Abdulwahab-vpc"
}
variable "vpc-cidr-block" {
  default = "10.0.0.0/16"
}
variable "Public_subnet1" {
  default = "10.0.1.0/24" 
}
variable "Public_subnet2" {
  default = "10.0.2.0/24"
}
variable "private_subnet1" {
  default = "10.0.3.0/24"
}
variable "private_subnet2" {
  default =  "10.0.4.0/24"
}
variable "private_subnet3" {
  default =  "10.0.5.0/24"
}
variable "private_subnet4" {
  default = "10.0.6.0/24"
}
variable "ami_id" {
  default = "ami-00a929b66ed6e0de6"
}
variable "instance_type" {
  default = "t2.micro"
} 
variable "cpu_threshold" {
  default = 70.0
}