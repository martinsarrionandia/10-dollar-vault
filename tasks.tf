resource "aws_ecs_task_definition" "vault" {
  family                = "vault"
  network_mode          = "awsvpc"
  cpu                   = "256"
	memory                = "512"
	#task_role_arn = "FARTS"
	#execution_role_arn = "FARTS"
	container_definitions = data.template_file.vault_task_def.rendered

  volume {
    name = "vault-storage"

    efs_volume_configuration {
      file_system_id          = aws_efs_file_system.vault.id
      root_directory          = "/vault/data"
      transit_encryption      = "ENABLED"
      transit_encryption_port = 2999
      authorization_config {
        access_point_id = aws_efs_access_point.vault.id
				#iam             = "ENABLED"
      }
    }
  }
}

data "template_file" "vault_task_def" {
  template = file("task-definitions/vault.json.tpl")

  vars = {
    kms_key    = aws_kms_key.vault.id
    vault_url  = var.vault_url
    aws_region = var.aws_region
  }
}

output "foad"{
  value = data.template_file.vault_task_def.rendered
}
