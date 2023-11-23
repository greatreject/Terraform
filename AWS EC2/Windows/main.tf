provider "aws" {

region                                                       = "eu-west-2"

#your region where your VPC will be created

shared_credentials_files = ["c:\\users\\ud1209\\.aws\\credentials"]

#location of your credentials file hosting the Secret Key and Secret Access Key (and sometimes Session Token)

profile                 = "default"

#name of the profile in your credential file

}