#!/bin/sh -ex

if [ -z "$REVISION" ]; then
  echo '$REVISION is required'
  exit 1
fi

if [ -z "$NPM_TOKEN" ]; then
  echo '$NPM_TOKEN is required'
  exit 1
fi

echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" >> .npmrc

base_version="$(npm view --json | jq -r '.version' | sed -E 's/-.+//')"

npm version "$base_version-$REVISION"

npm publish
