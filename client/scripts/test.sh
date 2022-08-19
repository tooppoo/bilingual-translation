#!/usr/bin/env sh

docker compose run \
  --rm \
  -e NODE_ENV=test \
  client yarn test
