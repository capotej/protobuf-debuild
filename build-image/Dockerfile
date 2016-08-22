FROM ubuntu:trusty

RUN apt-get update && apt-get install -y \
    devscripts \
    debhelper \
    curl \
    git \
    quilt \
    m4 \
    autoconf \
    wget dh-autoreconf g++ zlib1g-dev dh-python python-all libpython-all-dev python-setuptools python-google-apputils xmlto ant default-jdk maven-repo-helper

VOLUME ["/build"]
WORKDIR /build

ADD runner.sh /root

ENTRYPOINT "/root/runner.sh"
