BASE_IMAGE_NAME=s2i-nodejs
ONBUILD_IMAGE_NAME=nodejs
NAMESPACE=bucharestgold
VERSIONS=4.8.1 5.12.0 6.10.1 7.7.4

include build/common.mk
