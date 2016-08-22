#!/bin/sh

set -e

# Freshen up the cache
apt-get update

if [ -e "/build/build.sh" ]; then
  echo "Found build.sh, executing!"
  cd /build && sh build.sh
fi
