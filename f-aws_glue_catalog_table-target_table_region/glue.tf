data "aws_partition" "current" {}

resource "aws_iam_role" "test" {
  name = "glue_allow"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "glue.${data.aws_partition.current.dns_suffix}"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_glue_catalog_database" "test" {
  name = "sadabate"
}

resource "aws_glue_catalog_database" "test2" {
  name = "sadabate2"
}

resource "aws_glue_catalog_table" "test" {
  name          = "abelt"
  database_name = aws_glue_catalog_database.test.name
}

resource "aws_glue_catalog_database" "example" {
  name = "sadabate3"
}

resource "aws_glue_catalog_table" "example" {
  name          = "abelt"
  database_name = aws_glue_catalog_database.test2.name

  storage_descriptor {
    columns {
      name = "event"
      type = "string"
    }
  }
}

resource "aws_lakeformation_permissions" "example" {
  permissions = ["ALL", "SELECT"]
  principal   = aws_iam_role.test.arn 

  table {
    database_name = aws_glue_catalog_table.example.database_name
    name          = aws_glue_catalog_table.example.name
    // column_names  = ["event"]
    region        = "us-east-2"
  }
}

