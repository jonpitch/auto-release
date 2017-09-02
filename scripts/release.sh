#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  # cut tag
  npm run release

  # update changelog
  npm run changelog

  # success
  exit 0
fi
