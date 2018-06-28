require "serverspec"
require "spec_helper"

describe "Dockerfile" do
  include_examples "dockerfile", './ubuntu14.04', 'ubuntu-trusty', 'Ubuntu 14', :ubuntu

  include_examples "packages"

  include_examples "gems"
end