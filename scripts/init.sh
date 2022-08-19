#!/usr/bin/env sh

docker compose build

for pkg in 1 2 3
do
  sh "../$pkg/scripts/init.sh"
end
