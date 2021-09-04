.EXPORT_ALL_VARIABLES:
AWS_PROFILE=prd-non-tf-905234897161
AWS_ACCOUNT_ID=905234897161
AWS_REGION=us-east-1

## TF init
tf-init:
	terraform init -var-file=variables.tfvars

## TF validate
tf-validate:
	terraform validate

## TF plan
tf-plan:
	terraform plan -var-file=variables.tfvars

## TF apply
tf-apply: tf-plan
	terraform apply -var-file=variables.tfvars -auto-approve

## TF destroy
tf-destroy:
	terraform destroy -var-file=variables.tfvars -auto-approve