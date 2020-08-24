[
  {
    "name": "vault",
    "image": "vault",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8300,
        "hostPort": 8300
      }
    ],
    "environment": [
      {
        "name": "VAULT_LOCAL_CONFIG",
        "value:": { "storage": { "file": { "path": "/vault/data" } }, "seal": { "aws-kms": { "region": "${aws_region}", "kms_key_id": "${kms_key}" } } }
      }
    ]
  }
]
