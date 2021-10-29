.EXPORT_ALL_VARIABLES:
BUCKET=blog.infocruncher.com
AWS_PROFILE=prd-non-tf-905234897161
AWS_ACCOUNT_ID=905234897161
AWS_REGION=us-east-1

## Jekyll local serve unpublished
jekyll-serve-unpublished:
	# Serve site locally at http://localhost:4000/ including unpublished content
	# Ref: https://jekyllrb.com/docs/usage/
	# Note: 'bundle exec' runs the exact jekyll server version that is specified in your Gemfile/Gemfile.lock.
	bundle exec jekyll serve --unpublished --verbose

## Jekyll local serve
jekyll-serve:
	# Serve site locally at http://localhost:4000/ EXCLUDING unpublished content
	# Ref: https://jekyllrb.com/docs/usage/
	# Note: 'bundle exec' runs the exact jekyll server version that is specified in your Gemfile/Gemfile.lock.
	bundle exec jekyll serve --verbose

## Jekyll bundle production
jekyll-bundle-prod:
	# Build website to ./_site folder in production mode (i.e. include Google Analytics & Disqus client code)
	# Ref: https://jekyllrb.com/docs/usage/
	# Note: 'bundle exec' runs the exact jekyll server version that is specified in your Gemfile/Gemfile.lock.
	JEKYLL_ENV=production bundle exec jekyll build --verbose

## AWS deploy _site to production bucket
s3-deploy-files: jekyll-bundle-prod
	aws s3 cp _site s3://${BUCKET} --recursive --profile ${AWS_PROFILE}
	# NOTE: Remember to invalidate Cloudfront cache to materialise changes: `cf-invalidation`

## AWS Cloudfront invalidation (limit 1000 free calls per month)
cf-invalidation:
	aws cloudfront create-invalidation --distribution-id E139HGPJPEHK3F --paths "/*"

## AWS remove production bucket
s3-remove-files:
	aws s3 rm s3://${BUCKET} --recursive

## Browse to public S3 bucket
s3-browse:
	open http://${BUCKET}.s3-website-${AWS_REGION}.amazonaws.com/

## Terraform plan infrastructure (S3, R53 etc)
tf-plan:
	cd infra; terraform plan -var-file=variables.tfvars -auto-approve; cd -

## Terraform apply infrastructure (S3, R53 etc)
tf-apply:
	cd infra; terraform apply -var-file=variables.tfvars -auto-approve; cd -

#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
# 	* save line in hold space
# 	* purge line
# 	* Loop:
# 		* append newline + line to hold space
# 		* go to next line
# 		* if line starts with doc comment, strip comment character off and loop
# 	* remove target prerequisites
# 	* append hold space (+ newline) to line
# 	* replace newline plus comments by `---`
# 	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
.PHONY: help
help:
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')
