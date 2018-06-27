shared_examples "packages" do
  [
    'ansible',
    'fonts-lato',
    'javascript-common',
    'libjs-jquery',
    'libruby',
    'rake',
    'ruby',
    'ruby',
    'rubygems-integration',
    'unzip',
    'zip'
  ].each do | packageName |
    describe package(packageName) do
      it { should be_installed }
    end
  end
end