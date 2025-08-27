#!/usr/bin/env bash

set -e

echo "> build time: $(date +'%Y-%m-%d %H:%M:%S %Z')" > version.md

for dep in $(jq -r ".dependencies.[]" "./vcpkg.json"); do
  name="$(jq -r ".name" "./vcpkg/ports/${dep}/vcpkg.json")"
  version="$(jq -r ".version" "./vcpkg/ports/${dep}/vcpkg.json")"
  echo "- ${name} **${version}**" >> version.md
done

cat version.md
