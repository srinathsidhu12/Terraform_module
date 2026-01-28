module "vpc" {
  source  = "./modules/vpc_module"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment = var.environment
}

module "sg" {
  source  = "./modules/sg_module"
  vpc_id  = module.vpc.vpc_id   #Root module cannot directly access resources inside child modules.So we must use outputs from the module instead(here vpc_id is output variable defined in vpc module output.tf).
}

module "ec2" {
  source  = "./modules/ec2_module"
  ami = var.ami
  instance_type = var.instance_type
  instance_tag = var.instance_tag
  subnet_id = module.vpc.private_subnet_id
}


#Child module variables.tf → makes the module reusable. It defines what inputs the module needs without knowing the actual values and never change the module code for different environments.

#Root variables.tf → defines the actual values for your environment (dev, test, prod) and passes them into the modules.