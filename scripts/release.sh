#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  git remote rm origin
  git remote add origin https://jonpitch:${GH_TOKEN}@github.com/jonpitch/auto-release
  git fetch
  git checkout master

  # cut tag and update changelog
  npm run release

  # update changelog and push to master
  # npm run changelog
  git push --set-upstream origin master --follow-tags
  exit 0
fi
