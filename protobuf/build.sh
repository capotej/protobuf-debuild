#!/bin/sh
set -e

cd /tmp

## Download 3.0.0
wget https://github.com/google/protobuf/archive/v3.0.0.tar.gz

## If the release doesnt contain gmock we have to clone it and retar it
tar -zxvf v3.0.0.tar.gz

if [ ! -d "protobuf-3.0.0/gmock" ]; then
  git clone -b release-1.7.0 https://github.com/google/googlemock.git protobuf-3.0.0/gmock
fi

if [ ! -d "protobuf-3.0.0/gmock/gtest" ]; then
  git clone -b release-1.7.0 https://github.com/google/googletest.git protobuf-3.0.0/gmock/gtest
fi

tar -cvzf protobuf_3.0.0.orig.tar.gz protobuf-3.0.0

# clean this just in case
rm -rf protobuf-3.0.0

## Untar it again and build it debian
tar zxvf protobuf_3.0.0.orig.tar.gz

cp -Rv /build/debian protobuf-3.0.0/
cd protobuf-3.0.0/

debuild -us -uc

cp -v ../libprotobuf-dev_3.0.0-1_amd64.deb /build
cp -v ../libprotobuf-java_3.0.0-1_all.deb /build
cp -v ../libprotobuf-lite10_3.0.0-1_amd64.deb /build
cp -v ../libprotobuf10_3.0.0-1_amd64.deb /build
cp -v ../libprotoc-dev_3.0.0-1_amd64.deb /build
cp -v ../libprotoc10_3.0.0-1_amd64.deb /build
cp -v ../protobuf-compiler_3.0.0-1_amd64.deb /build
cp -v ../protobuf_3.0.0-1.debian.tar.gz /build
cp -v ../protobuf_3.0.0-1.dsc /build
cp -v ../protobuf_3.0.0.orig.tar.gz /build
cp -v ../python-protobuf_3.0.0-1_amd64.deb /build
