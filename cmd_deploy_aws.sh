# Build website to ./_site folder in production mode (i.e. include Google Analytics & Disqus client code)
# Ref: https://jekyllrb.com/docs/usage/
# Note: 'bundle exec' runs the exact jekyll server version that is specified in your Gemfile/Gemfile.lock.
JEKYLL_ENV=production bundle exec jekyll build --verbose

# Deploy website to AWS S3 bucket from ./_site folder (using credentials & config from ~/.aws folder)
# Ref: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html
# Ref: https://docs.aws.amazon.com/polly/latest/dg/setup-aws-cli.html
aws s3 sync /Users/dylan/_gitdrh/dylanhogg.github.io/_site/ s3://blog.infocruncher.com/
