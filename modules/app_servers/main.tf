
# deploying 3 ec2s in first subnet for now
module "ec2_instance" {

  count = length(var.instance_names)

  source = "terraform-aws-modules/ec2-instance/aws"

  name = var.instance_names[count.index]

  ami                    = var.amis[count.index]
  instance_type          = var.type
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids = var.sg_ids
  subnet_id              = var.subnet_ids[0]

  # custom private ip to make it more dynamic and avoid using public dns
  private_ip = "10.0.1.1${count.index + 1}"

  associate_public_ip_address = true
}
