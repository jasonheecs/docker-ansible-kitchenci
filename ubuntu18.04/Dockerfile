FROM ubuntu:18.04

LABEL name="jasonheecs/ansible:ubuntu-16.04"
LABEL version="1.0.0"
LABEL maintainer="hello@jasonhee.com"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -my --no-install-recommends wget gnupg && \
    echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main' | tee /etc/apt/sources.list.d/ansible.list       && \
    echo 'deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main' | tee -a /etc/apt/sources.list.d/ansible.list  && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367 && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ansible \
        fonts-lato \
        javascript-common \
        libjs-jquery \
        libruby \
        rake \
        ruby \
        ruby-minitest \
        ruby-test-unit \
        rubygems-integration \
        unzip \
        zip && \
    rm -rf /var/lib/apt/lists/*  /etc/apt/sources.list.d/ansible.list && \
    gem install bundler && \
    gem cleanup all

RUN mkdir -p /run/sshd

CMD [ "ansible-playbook", "--version" ]