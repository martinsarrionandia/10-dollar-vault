# $10 Vault

This is a hashicorp vault setup that runs on Fargate, is backed by EFS and is unsealed using KMS.

"Did you just order a $10 Vault?"

"Mmmm Hmmm"

"Goddamm that's a pretty freakin good vault. I don't know if it's worth 10 dollars but it's prerty freakin good". (Edited for ITV1)

Mostly cut and paste from https://github.com/hashicorp/vault-guides, combined with random articles on server fault and fed into an AI system that simulates an infinite number of monkeys.

The idea is to run a vault server as cheaply as possibly with the ability to implement near instant on-demand functionailty, only paying for vault when you need it. Switch it on and off at the start of your deployment etc etc.

If you forget to turn it off it should only cost $10 a month!

...Does not contain Bourbon.


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

# Output provides the vault address
$ terraform apply
```
