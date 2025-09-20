locals {

  allowed_ports = [22, 80, 443, 8080, 3306, 6379, 25, 6443, 465, 3000]
  env = "dev"
  ami_id = "ami-02d26659fd82cf299"
  vpc_cidr = "10.0.0.0/16"
  public_subnet= "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  disk_size = 29
  instance_type = "t2.large"
  public_key = "terraform-key.pub"

}

 # private_subnet = "10.0.1.0/24"