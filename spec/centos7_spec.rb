require "serverspec"
require "docker"

set :backend, :exec

Dir[File.join(__dir__, 'support', '*.rb')].each { |file| require file }

Docker.options = { read_timeout: 800, write_timeout: 800 }

describe "Dockerfile" do
  include_examples "dockerfile", './centos7', 'centos-7', 'CentOS Linux', :redHat

  [
    'ansible',
    'ruby'
  ].each do | packageName |
    describe package(packageName) do
      it { should be_installed }
    end
  end
end