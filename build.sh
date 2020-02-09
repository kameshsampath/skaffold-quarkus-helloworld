#!/bin/bash

set -eo pipefail

image=$(echo $IMAGE)

echo "Using maven mirror $MAVEN_MIRROR_URL"

if [ ! -z "$image" ]; then
  docker build -t $image -f Dockerfile.dev $BUILD_CONTEXT
  if $PUSH_IMAGE
  then
    docker push $image
  fi
fi