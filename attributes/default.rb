# postgresql
default[:postgresql][:username][:postgres]        = 'postgres'
default[:postgresql][:password][:postgres]        = 'postgres'
default[:postgresql][:config][:listen_addresses]  = '*'
default[:postgresql][:config][:logging_collector] = true
default[:postgresql][:config][:datestyle]         = 'iso, mdy'
default[:postgresql][:config][:ident_file]        = nil
default[:postgresql][:config][:port]              = 5432
default[:postgresql][:pg_hba]                     = [
    {type: 'local', db: 'all', user: 'postgres', addr: nil, method: 'trust'},
    {type: 'local', db: 'all', user: 'all', addr: nil, method: 'trust'},
    {type: 'host', db: 'all', user: 'all', addr: '127.0.0.1/32', method: 'md5'},
    {type: 'host', db: 'all', user: 'all', addr: '::1/128', method: 'md5'},
    {type: 'local', db: 'all', user: 'all', addr: nil, method: 'md5'},
    {type: 'host', db: 'all', user: 'all', addr: '0.0.0.0/0', method: 'md5'}
]

## application attributes
default[:sahai][:username]                               = 'deployer'
default[:sahai][:password]                               = 'letterkay'
default[:sahai][:group]                                  = 'sysadmin'
default[:sahai][:name]                                   = 'C42 Deployer'
default[:sahai][:config]                                 = 'sahai.conf'
default[:sahai][:project_home]                           = '/var/www/sahai-web'
default[:sahai][:database][:adapter]                     = 'postgresql'
default[:sahai][:database][:encoding]                    = 'unicode'
default[:sahai][:database][:host]                        = '127.0.0.1'
default[:sahai][:database][:port]                        = node[:postgresql][:config][:port]
default[:sahai][:database][:dbname]                      = 'sahai'
default[:sahai][:database][:pool_size]                   = 5
default[:sahai][:database][:username]                    = 'sahai'
default[:sahai][:database][:password]                    = 'lettersdeebee'
default[:sahai][:secret_key_base]                        = '8fe6592eadce6428aa538db9597f68c0b12b5e6faf626af9beb64ffc78e6bc7b149056541d4ad02aed417ba51d38c145b2dc40e4166d1a94d8aeaa052ea41196'
default[:sahai][:ruby][:version]                         = '2.2.0'
default[:sahai][:web_server][:flag_editor_location]      = '/tmp/nginx_build_flag_editor.rb'
default[:sahai][:web_server][:build_scipt_location]      = '/tmp/nginx_tcp_proxy_setup.sh'

#unicorn
default[:unicorn][:worker_timeout] = 60
default[:unicorn][:preload_app] = false
default[:unicorn][:worker_processes] = 2
default[:unicorn][:before_fork] = 'sleep 1'
default[:unicorn][:port] = '8080'
default[:unicorn][:config_file] = "#{node[:sahai][:project_home]}/config/unicorn.rb"
default[:unicorn][:options] = { :tcp_nodelay => true, :backlog => 100 }