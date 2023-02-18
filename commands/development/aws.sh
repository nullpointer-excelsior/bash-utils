#!/bin/bash

clear
###### getting temporal credentials for docker credentials
# aws
AWS_SESSION_TOKEN_FILE="aws-session-token.json"
ROLE_ARN="arn:aws:iam::568635850695:role/EKSDefaultPolicyFor-Sai"
ROLE_SESSION_NAME="test-asume-role-day"
PROFILE="sai-test"
# assuming aws role
aws --profile $PROFILE sts assume-role --role-arn $ROLE_ARN --role-session-name $ROLE_SESSION_NAME > $AWS_SESSION_TOKEN_FILE
# get credentials
AWS_ACCESS_KEY_ID=$(jq -r '.Credentials.AccessKeyId' $AWS_SESSION_TOKEN_FILE)
AWS_SECRET_ACCESS_KEY=$(jq -r '.Credentials.SecretAccessKey' $AWS_SESSION_TOKEN_FILE)
AWS_SESSION_TOKEN=$(jq -r '.Credentials.SessionToken' $AWS_SESSION_TOKEN_FILE)

rm -f $AWS_SESSION_TOKEN_FILE

echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN"
