variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_zone" {
  default = "eu-west-1a"
}

variable "vault_url" {
  default = "https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of the VPC"
  default     = "192.168.1.0/24"
}
