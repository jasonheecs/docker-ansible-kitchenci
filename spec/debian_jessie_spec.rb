require "serverspec"
require "spec_helper"

describe "Dockerfile" do
  include_examples "dockerfile", './debian8', 'debian-8', 'Debian GNU/Linux 8 (jessie)', :debian

  include_examples "packages"

  include_examples "gems"
end