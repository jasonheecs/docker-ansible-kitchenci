require "serverspec"
require "docker"

Docker.options = { read_timeout: 800, write_timeout: 800 }

[
  ['./ubuntu18.04', 'Ubuntu 18', 'ubuntu-bionic'],
  ['./ubuntu16.04', 'Ubuntu 16', 'ubuntu-xenial'],
  ['./ubuntu14.04', 'Ubuntu 14', 'ubuntu-trusty']
].each do | directory, expected_os_version, tag |
  describe "Dockerfile" do
    before(:all) do
      
      @image = Docker::Image.build_from_dir(directory)
      @image.tag(repo: 'jasonheecs/ansible', tag: tag)

      @container = Docker::Container.create('Cmd' => ['ls'], 'Image' => @image.id)
      @container.start

      set :os, family: :debian
      set :backend, :docker
      set :docker_image, @image.id
      set :docker_container, @container.id
      set :docker_container_create_options, { 'Entrypoint' => ['/bin/bash', '-s'] }

    end
    
    it "should have the maintainer label" do
      expect(@image.json["Config"]["Labels"].has_key?("maintainer"))
    end

    it "installs the right version of Ubuntu" do
      expect(os_version).to include(expected_os_version)
    end

    [
      'ansible',
      'fonts-lato',
      'javascript-common',
      'libjs-jquery',
      'libruby',
      'rake',
      'ruby',
      'ruby',
      'rubygems-integration',
      'unzip',
      'zip'
    ].each do | packageName |
      describe package(packageName) do
        it { should be_installed }
      end
    end

    [
      'minitest',
      'test-unit'
    ].each do | gemName |
      describe package(gemName) do
          it { should be_installed.by('gem') }
      end
    end

    after(:all) do
      @container.stop
    end

    def os_version
      command("cat /etc/*release").stdout
    end

  end

end