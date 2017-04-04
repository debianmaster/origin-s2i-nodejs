#!/bin/bash -e

./node_modules/.bin/standard-version

git status -s | grep '^ M'
if [ "$?" -eq "0" ] ; then
  echo "You have modified files. Sorry, you have to take care of that before I publish"
  exit
fi

BASE_IMAGES="${NAMESPACE}/${OS}-${ONBUILD_IMAGE_NAME} ${NAMESPACE}/${OS}-${BASE_IMAGE_NAME}"

if [ ! -z $DOCKER_USER ] && [ ! -z $DOCKER_PASS ]; then
  echo "---> Authenticating to DockerHub..."
  docker login --username $DOCKER_USER --password $DOCKER_PASS
fi

for BASE in $BASE_IMAGES ; do
  echo "publishing: ${BASE}..."
  docker push $BASE
done

TAGS=$(grep VERSIONS Makefile | cut -d = -f 2 | cut -d ' ' -f 1-4)
for VERSION in $(echo $TAGS | tr ' ' "\n") ; do
  git tag "node-${VERSION}"
done
