require "docker"

shared_examples "dockerfile" do | directory,tag,expected_os_version |
    let(:image) { Docker::Image.build_from_dir(directory) }
    let(:container) { Docker::Container.create('Cmd' => ['ls'], 'Image' => image.id) }
    let(:os_version) { command('cat /etc/*release').stdout }

    before(:each) do
      image.tag(repo: 'jasonheecs/ansible', tag: tag)

      set :os, family: :debian
      set :backend, :docker
      set :docker_image, image.id
      set :docker_container, container.id
      set :docker_container_create_options, { 'Entrypoint' => ['/bin/bash', '-s'] }
    end

    it "should have the maintainer label" do
      expect(image.json["Config"]["Labels"].has_key?("maintainer"))
    end

    it "installs the right version of Ubuntu" do
      expect(os_version).to include(expected_os_version)
    end
end