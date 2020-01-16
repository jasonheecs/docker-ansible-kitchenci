FROM ubuntu:14.04

LABEL name="jasonheecs/ansible:ubuntu-14.04"
LABEL version="1.0.1"
LABEL maintainer="hello@jasonhee.com"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee /etc/apt/sources.list.d/ansible.list           && \
    echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/ansible.list    && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367    && \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:fkrull/deadsnakes && \
    DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends \
        ansible \
        fonts-lato \
        javascript-common \
        libjs-jquery \
        libruby \
        python2.7 \
        rake \
        ruby \
        ruby-minitest \
        ruby-test-unit \
        rubygems-integration \
        unzip \
        zip && \
    rm -rf /var/lib/apt/lists/*  /etc/apt/sources.list.d/ansible.list && \
    DEBIAN_FRONTEND=noninteractive apt-get purge -y software-properties-common && \
    gem install bundler -v 1.9.3 && \
    gem cleanup all

CMD [ "ansible-playbook", "--version" ]