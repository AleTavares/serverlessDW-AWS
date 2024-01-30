################################
## Redshift Serverless - Main ##
################################

# Create the Redshift Serverless Namespace
resource "aws_redshiftserverless_namespace" "serverless" {
  namespace_name      = var.namespace_name
  db_name             = var.database_name
  admin_username      = var.admin_username
  admin_user_password = var.admin_password
  iam_roles           = [aws_iam_role.redshift-serverless-role.arn]

  tags = {
    Name        = var.namespace_name
    Environment = var.app_environment
  }
}

################################################

# Create the Redshift Serverless Workgroup
resource "aws_redshiftserverless_workgroup" "serverless" {
  depends_on = [aws_redshiftserverless_namespace.serverless]

  namespace_name = aws_redshiftserverless_namespace.serverless.id
  workgroup_name = var.redshift_workgroup_name
  base_capacity  = var.base_capacity

  security_group_ids = [aws_security_group.redshift-serverless-security-group.id]
  subnet_ids = [
    aws_subnet.redshift-serverless-subnet-az[0].id,
    aws_subnet.redshift-serverless-subnet-az[1].id,
    aws_subnet.redshift-serverless-subnet-az[2].id,
  ]
  publicly_accessible = var.acasso_publico_redshift

  tags = {
    Name        = var.redshift_workgroup_name
    Environment = var.app_environment
  }
}