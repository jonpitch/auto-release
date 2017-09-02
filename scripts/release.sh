#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  # cut tag
  npm run release

  # update changelog and push to master
  git remote rm origin
  git remote add origin https://jonpitch:${GH_TOKEN}@github.com/jonpitch/auto-release
  git fetch
  git checkout master
  npm run changelog
  git push
  exit 0
fi
