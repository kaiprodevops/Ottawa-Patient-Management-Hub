#!/bin/bash
set -e # Stops the script if any command fails

# Best Practice: Force dummy credentials so you don't accidentally deploy to real AWS
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"

echo "Deleting existing stack if any..."
aws --endpoint-url=http://localhost:4566 cloudformation delete-stack \
    --stack-name patient-management || true

echo "Deploying CloudFormation stack to LocalStack..."
aws --endpoint-url=http://localhost:4566 cloudformation deploy \
    --stack-name patient-management \
    --template-file "./cdk.out/localstack.template.json"

echo "Retrieving Application Load Balancer DNS..."
aws --endpoint-url=http://localhost:4566 elbv2 describe-load-balancers \
    --query "LoadBalancers[0].DNSName" --output text