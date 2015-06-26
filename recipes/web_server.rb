include_recipe 'nginx'

#get nginx source

script "build nginx" do
  action run
  script :bash
  attribute { user: node[:sahai][:username] }
  code nginx_tcp_proxy_setup.erb
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

nginx_site 'default' do
  enable false
end

template "#{node[:nginx][:dir]}/sites-available/sahai" do
  source 'nginx.conf.erb'
  notifies :restart, 'service[nginx]'
end

directory "#{node[:sahai][:project_home]}" do
  group node[:sahai][:group]
  owner node[:sahai][:username]
  mode 0755
  action :create
  recursive true
end

nginx_site 'sahai' do
  enable true
end
