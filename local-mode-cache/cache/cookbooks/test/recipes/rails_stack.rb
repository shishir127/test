include_recipe 'build-essential'
include_recipe 'ruby_build'

%w(libssl-dev).each do |pkg|
  package pkg do
    action :install
  end
end

ruby_build_ruby node[:sahai][:ruby][:version]

link '/usr/bin/ruby' do
  to '/usr/local/ruby/2.1.5/bin/ruby'
end

gem_package 'bundler' do
  options '--no-ri --no-rdoc'
end
