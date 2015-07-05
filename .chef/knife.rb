chef_server_url   'http://127.0.0.1:8889'
node_name         'test'
client_key        '/etc/chef/dummy.pem'
chef_zero.enabled true
local_mode        true
ssl_verify_mode   :verify_peer

cookbook_path    ['.chef/cookbooks']
node_path        '.chef/nodes'
role_path        '.chef/roles'
environment_path '.chef/environments'
data_bag_path    '.chef/data_bags'

knife[:berkshelf_path] = '.chef/cookbooks'