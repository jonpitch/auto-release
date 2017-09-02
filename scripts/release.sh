#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  # setup git
  # git config --global user.email "travis@travis-ci.org"
  # git config --global user.name "Travis CI"
  #
  # git remote add master https://${GH_TOKEN}@github.com/jonpitch/auto-release.git > /dev/null 2>&1
  # git push --quiet --set-upstream master master

  # cut tag
  npm run release

  # update changelog
  npm run changelog

  # success
  exit 0
fi
