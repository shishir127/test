# include_recipe 'nginx'

template "/tmp/nginx_tcp_proxy_setup.sh" do
  source "nginx_tcp_proxy_setup"
  mode "0754"
end

template "/tmp/nginx_build_flag_editor.rb" do
  source "nginx_build_flag_editor.rb"
  mode "0754"
end

bash "build nginx" do
  action :run
  code "/tmp/nginx_tcp_proxy_setup.sh"
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
