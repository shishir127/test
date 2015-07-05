package ['autoconf', 'binutils-doc', 'bison', 'build-essential', 'flex', 'gettext', 'ncurses-dev']

git "/tmp/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
  action :sync
end

bash 'install ruby-build' do
  code <<-EOH
  cd /tmp/ruby-build
  ./install.sh
  EOH
end

execute "apt-get -y update"

package %w(libssl-dev build-essential bison openssl libreadline6 libreadline6-dev
        zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0
        libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev autoconf
        libc6-dev ssl-cert subversion libffi-dev)

execute 'build ruby' do
  action :run
  command "ruby-build #{node[:sahai][:ruby][:version]} /usr/local/ruby"
end

link '/usr/bin/ruby' do
  to '/usr/local/ruby/bin/ruby'
end

link "/usr/bin/gem" do
  to "/usr/local/ruby/bin/gem"
end

link "/usr/bin/erb" do
  to "/usr/local/ruby/bin/erb"
end

link "/usr/bin/irb" do
  to "/usr/local/ruby/bin/irb"
end

link "/usr/bin/rake" do
  to "/usr/local/ruby/bin/rake"
end

link "/usr/bin/rdoc" do
  to "/usr/local/ruby/bin/rdoc"
end

link "/usr/bin/ri" do
  to "/usr/local/ruby/bin/rdoc"
end

# execute 'debug' do
#   command "echo 'installing bundler'"
# end

gem_package 'bundler' do
  options '--no-ri --no-rdoc'
end
