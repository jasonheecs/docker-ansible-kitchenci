require "serverspec"
require "spec_helper"

describe "Dockerfile" do
  include_examples "dockerfile", './ubuntu16.04', 'ubuntu-16.04', 'Ubuntu 16', :ubuntu

  include_examples "packages"

  include_examples "gems"
end