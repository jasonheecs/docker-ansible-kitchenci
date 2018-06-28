# Docker Ansible and Kitchen CI Images

[![Build Status][travis-badge]][travis-link] [![Docker Automated Build Status][docker-build-badge]][docker-hub-link]

A set of Docker images with Ansible and Kitchen CI dependencies installed, meant for easier creation and testing of Ansible playbooks with Kitchen CI. [Docker Hub link][docker-hub-link]

## Usage
To use the docker images in Kitchen CI, simply specify the image name with the relevant tag in your `.kitchen.yml` file:

Example:
```yaml
---
driver:
  name: docker
  use_sudo: false

provisioner:
  hosts: test-kitchen
  name: ansible_playbook
  require_chef_for_busser: false
  ansible_verbosity: 2
  ansible_verbose: true

platforms:
  - name: ubuntu-18.04
    driver_config:
      image: jasonheecs/ansible:ubuntu-18.04
      platform: ubuntu
  - name: ubuntu-16.04
    driver_config:
      image: jasonheecs/ansible:ubuntu-16.04
      platform: ubuntu
  - name: ubuntu-14.04
    driver_config:
      image: jasonheecs/ansible:ubuntu-14.04
      platform: ubuntu
  - name: centos-7.0
    driver_config:
      image: jasonheecs/ansible:centos-7
      platform: centos
  - name: debian-9
    driver_config:
      image: jasonheecs/ansible:debian-9
      platform: debian
  - name: debian-8
    driver_config:
      image: jasonheecs/ansible:debian-8
      platform: debian

verifier:
  name: serverspec

suites:
  - name: default
    verifier:
      default_pattern: true
      bundler_path: '/usr/local/bin'
      rspec_path: '/usr/local/bin'
```

## Tags
List of tags and their distros:
- jasonheecs/ansible:ubuntu-18.04
- jasonheecs/ansible:ubuntu-16.04
- jasonheecs/ansible:ubuntu-14.04
- jasonheecs/ansible:centos-7
- jasonheecs/ansible:debian-9
- jasonheecs/ansible:debian-8

## Testing
Testing is done via Rspec and Dockerfile-lint. 

To run Rspec tests:
```bash
gem install bundler
bundle install
bundle exec rspec spec/<name-of-spec-file>
#e.g: bundle exec rspec spec/ubuntu_bionic_spec.rb
```

To run linting tests on the Dockerfiles, make sure Node and npm are installed and:
```bash
npm run test
```

Refer to the [travis.yml](.travis.yml) file and [Travis build logs][travis-link] for details on the automated tests and expected outputs.

## License
MIT

[docker-build-badge]: https://img.shields.io/docker/build/jasonheecs/ansible.svg
[docker-hub-link]: https://hub.docker.com/r/jasonheecs/ansible/
[travis-badge]: https://travis-ci.com/jasonheecs/docker-ansible-kitchenci.svg?branch=master
[travis-link]: https://travis-ci.com/jasonheecs/docker-ansible-kitchenci