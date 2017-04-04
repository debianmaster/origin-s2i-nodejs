#!/bin/bash -e

BASE_IMAGES="${NAMESPACE}/${OS}-${ONBUILD_IMAGE_NAME} ${NAMESPACE}/${OS}-${BASE_IMAGE_NAME}"

if [ ! -z $DOCKER_USER ] && [ ! -z $DOCKER_PASS ]; then
  echo "---> Authenticating to DockerHub..."
  docker login --username $DOCKER_USER --password $DOCKER_PASS
fi

for BASE in $BASE_IMAGES ; do
  echo "publishing: ${BASE}..."
  # docker push $BASE
done

TAGS=$(grep VERSIONS Makefile | cut -d = -f 2 | cut -d ' ' -f 1-4)
for VERSION in $(echo $TAGS | tr ' ' "\n") ; do
  git tag "node-${VERSION}"
done
