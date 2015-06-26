include_recipe "postgresql::client"
include_recipe "postgresql::server"
include_recipe "database::postgresql"

postgresql_connection_info = {
    host:     node[:sahai][:database][:host],
    port:     node[:sahai][:database][:port],
    username: node[:postgresql][:username][:postgres],
    password: node[:postgresql][:password][:postgres]
}

postgresql_database_user node[:sahai][:database][:username] do
  connection postgresql_connection_info
  password   node[:sahai][:database][:password]
  action     :create
end

postgresql_database node[:sahai][:database][:dbname] do
  connection postgresql_connection_info
  provider   Chef::Provider::Database::Postgresql
  action    :create
end

postgresql_database_user node[:sahai][:database][:username] do
  connection postgresql_connection_info
  database_name node[:sahai][:database][:dbname]
  privileges [:all]
  action :grant
end
