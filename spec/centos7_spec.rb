require "serverspec"
require "spec_helper"

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