require "serverspec"
require "docker"

set :backend, :exec

Dir[File.join(__dir__, 'support', '*.rb')].each { |file| require file }

Docker.options = { read_timeout: 800, write_timeout: 800 }

describe "Dockerfile" do
  include_examples "dockerfile", './ubuntu14.04', 'ubuntu-trusty', 'Ubuntu 14', :ubuntu

  include_examples "packages"

  include_examples "gems"
end