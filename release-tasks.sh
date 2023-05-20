#!/bin/bash

if [ "$HEROKU_APP_NAME" ]; then
  printenv HEROKU_APP_NAME; else
  bundle exec rails db:migrate;
fi

echo "Done running release-tasks.sh"
