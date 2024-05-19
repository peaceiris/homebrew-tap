#!/usr/bin/env bash

# fail on unset variables and command errors
set -eu -o pipefail # -x: is for debugging

GITHUB_EVENT_NAME=${GITHUB_EVENT_NAME:-}

if [ "${GITHUB_EVENT_NAME}" = "push" ]; then
  brew install peaceiris/tap/robots
else
  brew install --build-from-source ./Formula/robots.rb
fi

ROBOTS_TXT=$(mktemp)
curl -s "https://peaceiris.com/robots.txt" --output "${ROBOTS_TXT}"
robots "${ROBOTS_TXT}" Googlebot "https://peaceiris.com/"
