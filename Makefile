.EXPORT_ALL_VARIABLES:
BUCKET=blog.infocruncher.com
AWS_PROFILE=prd-non-tf-905234897161
AWS_ACCOUNT_ID=905234897161
AWS_REGION=us-east-1

# ######################################################################################################################
## Generate min.js and .css from .less files
grunt-css-js:
	grunt

## Jekyll local serve unpublished
jekyll-serve-unpublished:
	# Serve site locally at http://localhost:4001/ including unpublished content
	# Ref: https://jekyllrb.com/docs/usage/
	# Note: 'bundle exec' runs the exact jekyll server version that is specified in your Gemfile/Gemfile.lock.
	# Note: grunt generates css and min js files
	# Note: May need `bundle add webrick` if you see an error like: servlet.rb:3:in `require': cannot load such file -- webrick (LoadError)
	grunt
	bundle exec jekyll serve --port 4001 --unpublished --verbose

## Jekyll local serve
jekyll-serve:
	# Serve site locally at http://localhost:4001/ EXCLUDING unpublished content
	# Ref: https://jekyllrb.com/docs/usage/
	# Note: see `jekyll-serve-unpublished` for more info.
	grunt
	bundle exec jekyll serve --port 4001 --verbose

## Jekyll bundle production
jekyll-bundle-prod:
	# Build website to ./_site folder in production mode (i.e. include Google Analytics & Disqus client code)
	# Ref: https://jekyllrb.com/docs/usage/
	# Note: 'bundle exec' runs the exact jekyll server version that is specified in your Gemfile/Gemfile.lock.
	# Note: grunt generates css and min js files
	grunt
	JEKYLL_ENV=production bundle exec jekyll build --verbose

## Installed Gems
gem-query:
	gem query --local

## Install gems in the Gemfile
bundle-install:
	# `bundle install` command always does a conservative update, refusing to update gems (or their dependencies) that you have not explicitly changed in the Gemfile
	bundle install

## Update every gem in the Gemfile to the latest possible versions
bundle-update:
	# Can be useful if versions change
	bundle update


# ######################################################################################################################
## AWS deploy _site to production bucket
s3-deploy-files: jekyll-bundle-prod
	aws s3 cp _site s3://${BUCKET} --recursive --profile ${AWS_PROFILE}
	AWS_PAGER="" aws cloudfront create-invalidation --distribution-id E139HGPJPEHK3F --paths "/*"

## AWS Cloudfront invalidation (limit 1000 free calls per month)
cf-invalidation:
	AWS_PAGER="" aws cloudfront create-invalidation --distribution-id E139HGPJPEHK3F --paths "/*"

## AWS remove production bucket
s3-remove-files:
	@echo "Really?"
	# aws s3 rm s3://${BUCKET} --recursive

## Browse to public S3 bucket
s3-browse:
	open http://${BUCKET}.s3-website-${AWS_REGION}.amazonaws.com/

## Terraform plan infrastructure (S3, R53 etc)
tf-plan:
	cd infra; terraform plan -var-file=variables.tfvars -auto-approve; cd -

## Terraform apply infrastructure (S3, R53 etc)
tf-apply:
	cd infra; terraform apply -var-file=variables.tfvars -auto-approve; cd -


# Makefile documentation
.DEFAULT_GOAL := help
.PHONY: help
help:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
