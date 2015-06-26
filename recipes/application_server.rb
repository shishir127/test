include_recipe "unicorn"

node.set[:unicorn][:options] = { :tcp_nodelay => true, :backlog => 100 }

unicorn_config node[:unicorn][:config_file] do
  listen({ node[:unicorn][:port] => node[:unicorn][:options] })
  working_directory ::File.join(app['deploy_to'], 'current')
  worker_timeout node[:unicorn][:worker_timeout]
  preload_app node[:unicorn][:preload_app]
  worker_processes node[:unicorn][:worker_processes]
  before_fork node[:unicorn][:before_fork]
end