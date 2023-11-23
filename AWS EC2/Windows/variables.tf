variable "instanceprofile_name" {}

variable "subnet_id" {}

variable "key_pair" {}

variable ami {}

variable "instance_type" {
    type = string
}

variable "tag_name" {
    type = string
}

variable "windows_name" {
    type = string
}

variable "backup" {
    type = bool
}

variable "patched" {
    type = bool
}

variable "owner" {
    type = string
}

variable "function" {
    type = string
}

variable "os" {
    type = string
}

variable "os_version" {
    type = string
}



