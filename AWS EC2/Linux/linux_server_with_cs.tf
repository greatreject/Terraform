# EC2 Instance
resource "aws_instance" "linux_deploy" {
  iam_instance_profile = var.instanceprofile_name
  instance_type        = var.instance_type  # Set your desired instance type
  subnet_id            = var.subnet_id
  key_name             = var.key_pair
  ami                  = "ami-0cfd0973db26b893b"  # Update with the desired AMI ID
  
  user_data = <<-EOF
  #!/bin/bash
  sudo mkdir /mount
  sudo mkdir ~/.aws
  cat <<'EOFAWS' >> ~/.aws/config
  [profile s3-bucket-role-cs]
  role_arn = arn:aws:iam::877968844667:role/s3-bucket-role-CS
  credential_source = Ec2InstanceMetadata
  EOFAWS
  sudo aws s3 cp s3://crowdstrikeinstalls/falcon-sensor-7.03.0-15805.amzn2023.x86_64.rpm /mount --profile s3-bucket-role-cs
  sudo yum -y install ./mount/falcon-sensor-7.03.0-15805.amzn2023.x86_64.rpm
  sudo /opt/CrowdStrike/falconctl -s --cid=C78902F9C85144558CFCCBC3A21AF3C9-75 --tags=LocalIT
  sudo service falcon-sensor start
  sudo systemctl start falcon-sensor
  EOF

  tags = {
    Name             = var.tag_name
    "Windows Server Name" = var.windows_name
    Backup           = var.backup
    Patched          = var.patched
    Owner            = var.owner
    Function         = var.function
    OS               = var.os
    "OS Version"     = var.os_version


  }
  }