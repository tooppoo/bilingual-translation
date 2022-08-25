#!/usr/bin/env sh

cmd=$1

here=$(dirname $0)

for pkg in web client
do
  script="$here/../$pkg/scripts/$cmd.sh"

  echo "$script"
  sh $script
done
