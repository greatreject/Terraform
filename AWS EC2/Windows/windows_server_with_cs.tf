# EC2 Instance
resource "aws_instance" "my_ec2_instance_ssm" {
  iam_instance_profile = var.instanceprofile_name
  instance_type        = var.instance_type  # Set your desired instance type
  subnet_id            = var.subnet_id
  key_name             = var.key_pair
  ami                  = var.ami  # Update with the desired AMI ID
  
  user_data = <<-EOF
  <powershell>
  # Download and install AWS CLI silently
  $awsCliInstaller = "AWSCLIV2.msi"
  Invoke-WebRequest -Uri "https://awscli.amazonaws.com/$($awsCliInstaller)" -OutFile $awsCliInstaller
  Start-Process -Wait -FilePath msiexec -ArgumentList '/i', $awsCliInstaller, '/quiet', '/norestart'
  $env:Path += ";C:\Program Files\Amazon\AWSCLIV2\"
  # PowerShell script content here
  # IAM role details
  $roleArn = "arn:aws:iam::877968844667:role/s3-bucket-role-CS"
  # Assume the role using AWS CLI
  $assumeRoleCommand = "aws sts assume-role --role-arn $roleArn --role-session-name AssumedRoleSession --output json"
  $assumeRoleOutput = Invoke-Expression -Command $assumeRoleCommand | ConvertFrom-Json
  # Extract temporary credentials
  $accessKeyId = $assumeRoleOutput.Credentials.AccessKeyId
  $secretAccessKey = $assumeRoleOutput.Credentials.SecretAccessKey
  $sessionToken = $assumeRoleOutput.Credentials.SessionToken
  # Set AWS credentials with the assumed role
  aws configure set aws_access_key_id $accessKeyId
  aws configure set aws_secret_access_key $secretAccessKey
  aws configure set aws_session_token $sessionToken
  # S3 bucket details
  $bucketName = "crowdstrikeinstalls"
  $key = "WindowsSensor.LionLanner.exe" # Specify the source object (file) key in the bucket
  # Local file path
  mkdir c:\temp
  $localFilePath = "C:\temp"
  # Download the file from S3 bucket
  aws s3 cp s3://$bucketName/$key $localFilePath
  # Execute the application installer (replace with the actual installer command)
  Start-Process -Wait -FilePath "$localFilePath\WindowsSensor.LionLanner.exe" "/install /quiet /norestart CID=C78902F9C85144558CFCCBC3A21AF3C9-75 --tags=LocalIT"
  </powershell>
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