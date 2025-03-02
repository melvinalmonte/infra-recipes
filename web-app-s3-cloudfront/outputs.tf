output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket hosting the Vue.js application"
  value       = aws_s3_bucket.website_bucket.id
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "website_url" {
  description = "The URL to access the website"
  value       = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
} 