#
# Cookbook Name:: testing
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'nginx'

file '/tmp/test.txt' do
  content 'this is a chef test'
  mode '0644'
end
