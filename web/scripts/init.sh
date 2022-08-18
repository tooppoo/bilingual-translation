#!/usr/bin/env sh

docker compose build web
docker compose run --rm --no-deps web bundle install
