module "colossus_vpc" {

  source = "../modules/vpc"
  cidr_block = "10.1.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "colossus_vpc"
  }
}

module "colossus_igw" {
  source = "../modules/igw"
  vpc_id = module.colossus_vpc.id
  tags = {
    Name = "colossus_igw"
  }
}

module "collossus_public_subnet" {
  source = "../modules/subnet"
  vpc_id     = module.colossus_vpc.id
  cidr_block = "10.1.5.0/24"
  tags = {
    Name = "colossus_public_subnet"
  }
}

module "collossus_private_subnet" {
  source = "../modules/subnet"
  vpc_id     = module.colossus_vpc.id
  cidr_block = "10.1.6.0/24"
  tags = {
    Name = "collossus_private_subnet"
  }
}


module "colossus_pub_rt" {
  source = "../modules/routetable"
  vpc_id = module.colossus_vpc.id
  tags = {
    Name = "colossus_mainroute"
  }
}

module "colossus_priv_rt" {
  source = "../modules/routetable"
  vpc_id = module.colossus_vpc.id
  tags = {
    Name = "colossus_privateroute"
  }
}

module "pub_igw_associate" {

  source = "../modules/route_gateway_id"

  route_table_id = module.colossus_pub_rt.id
  gateway_id    =  module.colossus_igw.id
  destination_cidr_block = "0.0.0.0/0"
}



module "colossus_rta_cidr" {

  source = "../modules/routetable_associations"
  subnet_id      = module.collossus_public_subnet.id
  route_table_id = module.colossus_pub_rt.id
}

module "colossus_sec_group" {
  source = "../modules/Sg"
  name        = "colossus_sg"
  description = "security group for colossus"
  http_ingress_description = "Allowing http port"
  http_cidr_block = ["0.0.0.0/0"]
  ssh_ingress_description = "Allowing ssh port"
  ssh_cidr_block = ["0.0.0.0/0"]
  vpc_id      = module.colossus_vpc.id
  tags = {
    Name = "colossus_securitygrp"
  }

}

module "colossus_ec2_public_instance" {
  source = "../modules/Ec2"
  ami = "ami-039a49e70ea773ffc"
  instance_type = "t2.micro"
  security_groups = [module.colossus_sec_group.id]
  subnet_id = module.collossus_public_subnet.id
  key_name = "ansible-jenk.pem"
  associate_public_ip_address  = true
  tags = {
    Name = "colossus_public_instance"
  }
}


module "colossus_ec2_private_instance" {
  source = "../modules/Ec2"
  ami = "ami-039a49e70ea773ffc"
  instance_type = "t2.micro"
  security_groups = [module.colossus_sec_group.id]
  subnet_id = module.collossus_private_subnet.id
  associate_public_ip_address  = true
  key_name = "ansible-jenk.pem"
  tags = {
    Name = "collossus_private_instance"
  }
}

module "colossus_launchconfiguration" {
  source = "../modules/Launchconfiguration"
  name = "colossus_launchconf"
  image_id = "ami-039a49e70ea773ffc"
  instance_type = "t2.micro"
  key_name = "ansible-jenk.pem"
  security_groups = [module.colossus_sec_group.id]
}

module "colossus_autoscalinggroup" {
  source = "../modules/ASG"
  name = "colossus_autoscaling"
  launch_configuration = module.colossus_launchconfiguration.name
  min_size = 2
  max_size = 3
  vpc_zone_identifier = [module.collossus_public_subnet.id]


}
