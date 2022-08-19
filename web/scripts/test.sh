#!/usr/bin/env sh

docker compose run \
  --rm \
  --no-deps \
  -e RAILS_ENV=test \
  -e RACK_ENV=test \
  web bundle exec rspec
