#!/usr/bin/env bash

# Example of running container as though we were in CI

docker run --rm --name testing \
	-e TF_VAR_aws_assume_role_arn="arn:aws:iam::126450723953:role/OrganizationAccountAccessRole" \
	-e AWS_DEFAULT_PROFILE=default \
	-e AWS_PROFILE=default \
	-e AWS_ACCESS_KEY_ID \
	-e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
	-e AWS_SECURITY_TOKEN \
	-e AWS_REGION \
	-e AWS_DEFAULT_REGION \
	-e VAULT_SERVER_ENABLED=false \
	--volume $(pwd)/testing/:/conf/testing/ \
	cloudposse/testing.cloudposse.co:latest -l -c "tests/run.sh"
