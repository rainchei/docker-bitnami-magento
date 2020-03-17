#!/bin/bash

setenv() {
  BASE="rainchei/docker-magento-nginx"
  BUILD_DATE="$(date '+%Y%m%d')"
  TAG="$(git describe --dirty)-${BUILD_DATE}"
}

fail() {
  echo "$1"
  exit "${2-1}"  # Return a code specified by $2 or 1 by default.
}

main() {
  cd $(dirname $0)
  find . -type f -name '.DS_Store' -delete
  setenv

  # you must commit changes first
  git diff --cached --exit-code || exit 1
  git diff --exit-code || exit 2

  echo "== Build Start."
  start=$(date +%s)

  DOCKER_BUILDKIT=1 docker build \
    --pull \
    -t "${BASE}:${TAG}" \
    . \
  || fail "Failed to build ${BASE}:${TAG}." 2

  end=$(date +%s)
  echo "== Build End."
  echo
  echo "It costs $((end-start)) seconds."
  echo
  docker push "${BASE}:${TAG}" \
  || fail "Failed to push ${BASE}:${TAG}." 2

  echo "${BASE}:${TAG}"
}

## ================================================

main
