directory "#{node[:sahai][:project_home]}/shared" do
  group node[:sahai][:group]
  owner node[:sahai][:user]
  mode 0755
  action :create
  recursive true
end

directory "#{node[:sahai][:project_home]}/shared/config" do
  group node[:sahai][:group]
  owner node[:sahai][:user]
  mode 0755
  action :create
  recursive true
end

template "#{node[:sahai][:project_home]}/shared/config/database.yml" do
  source 'database.yml.erb'
end

template "#{node[:sahai][:project_home]}/shared/config/secrets.yml" do
  source 'secrets.yml.erb'
end
