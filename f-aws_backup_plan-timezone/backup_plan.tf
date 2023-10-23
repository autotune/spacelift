resource "aws_kms_key" "example" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}

resource "aws_backup_vault" "test" {
  name        = "example_backup_vault"
  kms_key_arn = aws_kms_key.example.arn
}

resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = aws_backup_vault.test.name
    schedule          = "cron(0 12 * * ? *)"
    schedule_timezone = "US/Eastern" 

    lifecycle {
      delete_after = 14
    }
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
}
