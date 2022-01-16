module "aplicação_dev" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["primeira", "segunda"])

  name = "aplicacao-${each.key}"

  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"

  tags = {
    env = "dev"
    type = "aplicacao"
  }
}

module "banco_dev" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["primeira", "segunda"])

  name = "banco-${each.key}"

  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"

  tags = {
    env = "dev"
    type = "banco"
  }
}

output "aplicação_dev" {
  value = {
    "public_dns" = [ for p in module.aplicação_dev : p.public_dns ]
    "public_ip"  = [ for p in module.aplicação_dev : p.public_ip ]
    "private_ip" = [ for p in module.aplicação_dev : p.private_ip ]
  }
}

output "banco_dev" {
  value = {
    "public_dns" = [ for p in module.banco_dev : p.public_dns ]
    "public_ip"  = [ for p in module.banco_dev : p.public_ip ]
    "private_ip" = [ for p in module.banco_dev : p.private_ip ]
  }
}
