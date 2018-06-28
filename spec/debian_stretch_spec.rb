require "serverspec"
require "spec_helper"

describe "Dockerfile" do
  include_examples "dockerfile", './debian9', 'debian-stretch', 'Debian GNU/Linux 9 (stretch)', :debian

  include_examples "packages"

  include_examples "gems"
end