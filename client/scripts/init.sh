#!/usr/bin/env sh

docker compose build client
docker compose run --rm client yarn install --frozen-lockfile
