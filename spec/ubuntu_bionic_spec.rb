require "serverspec"
require "spec_helper"

describe "Dockerfile" do
  include_examples "dockerfile", './ubuntu18.04', 'ubuntu-bionic', 'Ubuntu 18', :ubuntu

  include_examples "packages"

  include_examples "gems"
end