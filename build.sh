#!/bin/bash

setenv() {
  MAGENTO_PHPFPM="$1"
  MAGENTO_BUSYBOX="$2"
  GITHUB_PAT="$3"
  BASE="rainchei/docker-magento-contents"
  BUILD_DATE="$(date '+%Y%m%d')"
  TAG="$(git describe --dirty)-${BUILD_DATE}"
}

fail() {
  echo "$1"
  exit "${2-1}"  # Return a code specified by $2 or 1 by default.
}

usage() {
  echo "Usage: $0 <MAGENTO_PHPFPM> <MAGENTO_BUSYBOX> <GITHUB_PAT>"
  echo
  echo "For example:"
  echo "$0 rainchei/docker-magento-phpfpm:foo rainchei/docker-magento-busybox:bar xxxyyyzzz"
  exit 2
}

main() {
  cd $(dirname $0)
  find . -type f -name '.DS_Store' -delete
  setenv
  [[ -z ${MAGENTO_PHPFPM} ]] || [[ -z ${MAGENTO_BUSYBOX} ]] || [[ -z ${GITHUB_PAT} ]] && usage

  # you must commit changes first
  git diff --cached --exit-code || exit 1
  git diff --exit-code || exit 2

  echo "== Build Start."
  start=$(date +%s)

  DOCKER_BUILDKIT=1 docker build \
    --pull \
    -t "${BASE}:${TAG}" \
    --build-arg MAGENTO_PHPFPM=${MAGENTO_PHPFPM} \
    --build-arg MAGENTO_BUSYBOX=${MAGENTO_BUSYBOX} \
    --build-arg GITHUB_PAT=${GITHUB_PAT} \
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
