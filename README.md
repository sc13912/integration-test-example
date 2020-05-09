# integration-test-example
an integration test example using Selenium/Rspec to test against a live website hosted on AWS S3 bucket, which is created/managed by Terraform. 
This is follow by the previous unit test example.

# Demo Sequences
# Step-1: (run Terraform to create the S3 bucket)
docker-compose build terraform
docker-compose run --rm terraform init
docker-compose run --rm terraform plan
docker-compose run --rm terraform apply

# Step-2: (copy website files into S3 bucket)
docker-compose run --rm --entrypoint aws aws s3 cp --recursive website/ s3://explorecalifornia-sc13912.org

# Step-3: (ready selenium and run the Rspec test against the live website on S3)
docker-compose up -d selenium
docker-compose build integration-tests
docker-compose run --rm -e WEBSITE_URL=explorecalifornia-sc13912.org.s3-website-us-east-1.amazonaws.com  integration-tests 

# Step-4: (clean up and destroy the S3 bucket)
docker-compose run --rm --entrypoint aws aws s3 rm --recursive s3://explorecalifornia-sc13912.org
docker-compose run --rm terraform destroy
docker-compose down
