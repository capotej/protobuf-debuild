# Protobuf3 debuild

Uses docker and debian debuild to produce protobuf 3 packages for ubuntu/trusty.

Based on the [packaging scripts for debian jessie and protobuf 2](https://packages.debian.org/jessie/libprotobuf-dev), updated to work with protobuf 3.

A diff of all the changes made is available at [changes.diff](https://github.com/capotej/protobuf-debuild/blob/master/changes.diff)

# Usage

To start the build, just run the following:

        $ make protobuf

The build is separated into 2 parts:

* building the base `build-image` docker image, which does all the necessary setup, like install all dependent packages and tools,
* building the protobuf package, which is just executing [`build.sh`](https://github.com/capotej/protobuf-debuild/blob/master/protobuf/build.sh) inside the `build-image` container.

This makes iterating on the packaging scripts faster, since the build-image is only built when its `Dockerfile` changes.

# Packages

You can find the built packages here: https://packagecloud.io/capotej/protobuf3
