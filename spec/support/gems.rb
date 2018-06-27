shared_examples "gems" do
  [
    'minitest',
    'test-unit'
  ].each do | gemName |
    describe package(gemName) do
        it { should be_installed.by('gem') }
    end
  end
end