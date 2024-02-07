export PATH=$(npm bin):$PATH

VERSION=`auto version`

## Support for label 'skip-release'
if [ ! -z "$VERSION" ]; then
  ## Update Changelog
  auto changelog

  ## Publish Package
  yarn version 
  git commit -m "Bump version to: %s [skip ci]"
  yarn build
  yarn release

  ## Create GitHub Release
  git push --follow-tags --set-upstream origin $branch
  auto release
fi