#-------------------------------------------------
# #### Role Redshifit ############################
#-------------------------------------------------

data "aws_iam_policy_document" "serverlessredeshifrole" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["redshift.amazonaws.com"]
    }
  }
}

#-------------------------------------------------
# #### Policy Redshift ###########################
#-------------------------------------------------
data "aws_iam_policy_document" "serverlessredeshifpolicy" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = ["*"]
  }
}

#-------------------------------------------------
# #### Neme Anexa Policy #########################
#-------------------------------------------------
data "aws_iam_policy" "redshift-full-access-policy" {
  name = "AmazonRedshiftAllCommandsFullAccess"
}
