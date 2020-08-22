# $10 Vault

This is a hasicorp vault setup that runs on Fargate, is backed by EFS and is unsealed using KMS.

"Did you just order a $10 Vault?"

"Mmmm Hmmm"

Other crap cut and paste from hasicorp...

---

## Demo Steps

### Setup

1. Set this location as your working directory
1. Set your AWS credentials as environment variables: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
1. Set Vault Enterprise URL in a file named `terraform.tfvars` (see `terraform.tfvars.example`)

### Commands Cheat Sheet

```bash
# Pull necessary plugins
$ terraform init

$ terraform plan

# Output provides the SSH instruction
$ terraform apply

# SSH into the EC2 machine
$ ssh ubuntu@<IP_ADDRESS> -i private.key

#----------------------------------
# Once inside the EC2 instance...
$ export VAULT_ADDR=http://127.0.0.1:8200

$ vault status

# Initialize Vault
$ vault operator init -key-shares=1 -key-threshold=1

# Restart the Vault server
$ sudo systemctl restart vault

# Check to verify that the Vault is auto-unsealed
$ vault status

$ vault login <INITIAL_ROOT_TOKEN>

# Explorer the Vault configuration file
$ cat /etc/vault.d/vault.hcl

$ exit
#----------------------------------

# Clean up...
$ terraform destroy -force
$ rm -rf .terraform terraform.tfstate* private.key
```
