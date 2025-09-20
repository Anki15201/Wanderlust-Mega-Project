module "my-infra" {
  source = "./module"
  ami_id = local.ami_id
  public_key = local.public_key
  env = local.env
  instance_type = local.instance_type
  availability_zone = local.availability_zone
  disk_size = local.disk_size
  allowed_ports = local.allowed_ports
  vpc_cidr = local.vpc_cidr
  public_subnet = local.public_subnet

}

#  private_subnet = local.private_subnet