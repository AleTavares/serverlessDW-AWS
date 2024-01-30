
#-------------------------------------------------
# #### IAM Role do Redshift ######################
#-------------------------------------------------
resource "aws_iam_role" "redshift-serverless-role" {
  name               = "${var.app_name}-${var.app_environment}-redshift-serverless-role"
  assume_role_policy = data.aws_iam_policy_document.serverlessredeshifrole.json
  tags = {
    Name        = "${var.app_name}-${var.app_environment}-redshift-serverless-role"
    Environment = var.app_environment
  }
}

#-------------------------------------------------
# #### IAM Role Policy para acesso ao S3 #########
#-------------------------------------------------
resource "aws_iam_role_policy" "redshift-s3-full-access-policy" {
  name = "${var.app_name}-${var.app_environment}-redshift-serverless-role-s3-policy"
  role = aws_iam_role.redshift-serverless-role.id

  policy = data.aws_iam_policy_document.serverlessredeshifpolicy.json
}

#-------------------------------------------------
# #### Attach a policy ao Redshift role ##########
#-------------------------------------------------
resource "aws_iam_role_policy_attachment" "attach-s3" {
  role       = aws_iam_role.redshift-serverless-role.name
  policy_arn = data.aws_iam_policy.redshift-full-access-policy.arn
}