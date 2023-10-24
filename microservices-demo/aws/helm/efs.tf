resource "kubernetes_persistent_volume" "bsee" {
  depends_on = [helm_release.efs]
  count      = 0
  metadata {
    name = "bsee"
  }
  spec {
    capacity = {
      storage = "50Gi"
    }
    access_modes = ["ReadWriteMany"]
    persistent_volume_source {
      csi {
        driver        = "efs.csi.aws.com"
        volume_handle = module.efs[0].id
      }
    }
  }
}

resource "kubernetes_storage_class" "efs" {
  depends_on = [helm_release.efs]
  count      = 0
  metadata {
    name = "efs"
  }
  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Retain"
  parameters = {
    provisioningMode = "efs-ap"
    fileSystemId     = module.efs[0].id
    directoryPerms   = "700"
    basePath         = "/mnt/efs"
  }
  mount_options = ["tls"]
}

module "efs" {
  count      = 0
  source     = "cloudposse/efs/aws"
  depends_on = [helm_release.efs]
  # Cloud Posse recommends pinning every module to a specific version
  version = "0.32.7"

  namespace = "default"
  stage     = "prod"
  name      = "bsee"
  region    = "us-east-2"
  vpc_id    = data.aws_vpcs.prod.ids[0]
  subnets   = data.aws_subnets.prod-public.ids
  zone_id   = [aws_route53_zone.wayofthesys.zone_id]

  allowed_security_group_ids = data.aws_eks_cluster.default.vpc_config[0].security_group_ids
}

resource "aws_efs_file_system_policy" "policy" {
  count          = 0
  file_system_id = module.efs[0].id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "ExamplePolicy01",
    "Statement": [
        {
            "Sid": "EFS01",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Resource": "${module.efs[0].arn}",
            "Action": [
                "elasticfilesystem:ClientMount",
                "elasticfilesystem:ClientWrite"
            ]
        }
    ]
}
POLICY
}
