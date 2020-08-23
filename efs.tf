resource "aws_efs_file_system" "vault" {
  performance_mode = "generalPurpose"
	throughput_mode = "bursting"
	tags = {
    Name = "Vault Store"
  }
}

resource "aws_efs_access_point" "vault" {
  file_system_id = aws_efs_file_system.vault.id
}
