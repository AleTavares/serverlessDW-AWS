# Bucket MWAA
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.account_id}-${var.bucket_name}"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
## Pasta armazenamento de
## Copia todos os arquivos a serem importados no Redshift
resource "aws_s3_object" "dag" {
  depends_on = [aws_s3_bucket_versioning.versioning]
  for_each   = fileset("dados/", "**")
  bucket     = aws_s3_bucket.bucket.id
  key        = "dados/${each.value}"
  source     = "dados/${each.value}"
  etag       = filemd5("dados/${each.value}")
}
