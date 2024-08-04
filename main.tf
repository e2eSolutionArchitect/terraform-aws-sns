
resource "aws_sns_topic" "this" {
  name              = var.sns_name
  fifo_topic        = var.fifo_topic
  kms_master_key_id = module.aws_kms.id #var.kms_master_key_id
  tags = merge(
    { "resourcename" = var.sns_name }, var.tags
  )
}


resource "aws_sns_topic_policy" "this" {
  arn    = aws_sns_topic.this.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}



data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "default_SSL"
  statement {
    sid    = "AllowPublishThroughSSLOnly"
    effect = "Deny"
    actions = [
      "SNS:Publish",
    ]
    resources = [aws_sns_topic.this.arn]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = [false]
    }
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
  depends_on = [aws_sns_topic.this]
}


module "aws_kms" {
  #source = "../aws-kms"
  source                  = "git::https://github.com/e2eSolutionArchitect/terraform-aws-kms.git?ref=v1.0.0"
  kms_name                = "encryption key for ${var.sns_name}"
  kms_alias               = var.sns_name
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  is_enabled              = var.is_enabled
  tags                    = var.tags
}