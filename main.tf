data "aws_caller_identity" "current" {}

resource "aws_ecr_repository" "ecr_reg" {
  name                 = var.registryname
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_replication_configuration" "example" {
  replication_configuration {
    rule {
      destination {
        region      = var.replica_region
        registry_id = data.aws_caller_identity.current.account_id
      }
    }
  }
}

resource "aws_ecr_lifecycle_policy" "regpolicy" {
  repository = aws_ecr_repository.ecr_reg.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 60 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 60
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}