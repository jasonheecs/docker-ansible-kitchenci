require "serverspec"
require "docker"

set :backend, :exec

Dir[File.join(__dir__, 'support', '*.rb')].each { |file| require file }

Docker.options = { read_timeout: 800, write_timeout: 800 }

describe "Dockerfile" do
  include_examples "dockerfile", './debian8', 'debian-jessie', 'Debian GNU/Linux 8 (jessie)', :debian

  include_examples "packages"

  include_examples "gems"
end