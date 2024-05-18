#!/usr/bin/env bash

# fail on unset variables and command errors
set -eu -o pipefail # -x: is for debugging

GITHUB_EVENT_NAME=${GITHUB_EVENT_NAME:-}

if [ "${GITHUB_EVENT_NAME}" = "push" ]; then
  brew install peaceiris/tap/tss
else
  brew install --build-from-source ./Formula/tss.rb
fi

tss version
