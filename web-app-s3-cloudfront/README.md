# Vue.js Application Hosting with AWS S3 and CloudFront

This Terraform template sets up infrastructure to host a Vue.js application on AWS using S3 for storage and CloudFront for content delivery.

## Architecture

- **S3 Bucket**: Stores the static files of your Vue.js application
- **CloudFront Distribution**: Serves the content with low latency globally
- **Security**: S3 bucket is configured to block public access, only allowing CloudFront to access the content

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.2.0 or newer)
- AWS CLI configured with appropriate credentials
- Vue.js application built and ready for deployment (the `dist` directory)

## Usage

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Configure Variables**:
   Create a `terraform.tfvars` file with your specific values:
   ```
   bucket_name = "your-unique-bucket-name"
   aws_region  = "us-east-1"  # Optional, defaults to us-east-1
   environment = "dev"        # Optional, defaults to dev
   ```

3. **Plan the Deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

5. **Upload Vue.js Application**:
   After the infrastructure is created, upload your Vue.js application to the S3 bucket:
   ```bash
   aws s3 sync ./dist/ s3://your-unique-bucket-name/ --delete
   ```

6. **Access Your Application**:
   Your application will be available at the CloudFront domain name, which is output after the `terraform apply` command completes.

## Cleaning Up

To destroy all resources created by this template:
```bash
terraform destroy
```

## Notes

- The CloudFront distribution is configured to redirect all 403 and 404 errors to `index.html`, which is necessary for Single Page Applications (SPAs) like Vue.js.
- The S3 bucket is configured to block all public access, and only CloudFront can access its contents.
- CloudFront is configured with a default TTL of 1 hour (3600 seconds).
- A placeholder index.html file is created during the initial deployment to avoid CloudFront errors. This placeholder will be automatically replaced when you deploy your Vue.js application.
- The configuration includes proper dependency management to ensure resources are created in the correct order. 