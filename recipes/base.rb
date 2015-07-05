execute 'apt-get update' do
  command 'sudo apt-get -y update'
end

include_recipe 'git'