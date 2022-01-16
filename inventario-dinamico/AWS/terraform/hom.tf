module "aplicação_hom" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["primeira", "segunda"])

  name = "aplicacao-${each.key}"

  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"

  tags = {
    env = "hom"
    type = "aplicacao"
  }
}

module "banco_hom" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["primeira", "segunda"])

  name = "banco-${each.key}"

  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"

  tags = {
    env = "hom"
    type = "banco"
  }
}

output "aplicação_hom" {
  value = {
    "public_dns" = [ for p in module.aplicação_hom : p.public_dns ]
    "public_ip"  = [ for p in module.aplicação_hom : p.public_ip ]
    "private_ip" = [ for p in module.aplicação_hom : p.private_ip ]
  }
}

output "banco_hom" {
  value = {
    "public_dns" = [ for p in module.banco_hom : p.public_dns ]
    "public_ip"  = [ for p in module.banco_hom : p.public_ip ]
    "private_ip" = [ for p in module.banco_hom : p.private_ip ]
  }
}
