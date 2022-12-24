#!/bin/zsh
set -euo pipefail

branch=$(git symbolic-ref --short -q HEAD)

if [[ $branch != 'master' ]]
then
	echo "not on 'master' - so not deployed"
	exit 1
fi

echo "Deploying Let's Fold Scarves"

source _cloudfront-distribution-id
# build site
bundle exec jekyll build --config _config.yml,_config_build.yml
mkdir -p _deploy/_admin

# upload to s3
echo "sync content..."
# s3cmd sync --guess-mime-type --no-mime-magic --delete-removed --exclude '.sass-cache' --exclude 's3cfg*' --exclude 'database/*' _deploy/ s3://www.fullofwishes.co.uk
aws s3 sync --profile grange85 --size-only --delete --exclude '.sass-cache' _deploy/ s3://www.moley75.co.uk/

# update the routing rules
# echo "update routing rules..."
# aws s3api put-bucket-website --bucket www.fullofwishes.co.uk --website-configuration file://config/routing-rules.json

# invalidate cloudfront
echo "invalidate cloudfont distribution..."
aws cloudfront create-invalidation --profile grange85 --distribution-id $CDN_DISTRIBUTION_ID --paths "/*"


echo "Let's Folds Scarves successfully deployed."
