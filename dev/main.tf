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
