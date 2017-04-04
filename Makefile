BASE_IMAGE_NAME=s2i-nodejs
ONBUILD_IMAGE_NAME=nodejs
NAMESPACE=bucharestgold
VERSIONS=4.8.2 5.12.0 6.10.2 7.8.0

include build/common.mk
