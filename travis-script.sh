#!/bin/bash
set -ev

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  if [ "$TRAVIS_BRANCH" == "master" ]; then
    echo "Building master"
    mvn deploy --settings target/travis/settings.xml -B -V -Pmutation,rpm
  else
    echo "Building feature branch"
    mvn verify --settings target/travis/settings.xml -B -V -Pmutation
  fi
else
  echo "Building pull request"
  mvn verify --settings target/travis/settings.xml -B -V -Pmutation
fi
