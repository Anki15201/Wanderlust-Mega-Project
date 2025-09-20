output "ec2_public_ip" {
  value = module.my-infra.instance_public_ip
}

output "ec2_private_ip" {
  value = module.my-infra.instance_private_ip
}

output "ec2_public_dns" {
  value = module.my-infra.instance_dns
}