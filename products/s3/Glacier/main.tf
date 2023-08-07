resource "aws_s3_bucket" "example2" {
  bucket = var.bucket

  tags = {
    Name        = var.Name
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example2" {
  bucket = aws_s3_bucket.example2.bucket
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.example2.bucket

  rule {
    id = "log"

    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }

    transition {
      days          = 180
      storage_class = "GLACIER"
    }

    transition {
      days          = 270
      storage_class = "DEEP_ARCHIVE"
    }    

  }

} 