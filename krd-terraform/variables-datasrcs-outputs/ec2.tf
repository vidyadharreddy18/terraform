resource "aws_instance" "my-ec2" {
  ami           = data.aws_ami.amz-linux.id
  instance_type = var.aws_instancetype
  user_data     = file("${path.module}/app-install.sh")
  key_name      = var.aws_keypair
  vpc_security_group_ids = [
    aws_security_group.vpc_ssh.id,
    aws_security_group.vpc_web.id
  ]
  tags = {
    "Name" = "my-ec2"
  }
}