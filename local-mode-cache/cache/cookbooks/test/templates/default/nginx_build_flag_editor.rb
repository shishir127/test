extra_flags = "--add-module=/opt/rebuildnginx/nginx_tcp_proxy_module \\\n"
config_file = File.open("/opt/rebuildnginx/nginx-1.8.0/debian/rules", "r")
tempfile = File.open("/tmp/file.txt", "w")
config_file.each_line do |line|
  tempfile<<line
  if line.downcase=~Regexp.new("common_configure_flags :=")
    tempfile << extra_flags
  end
end
config_file.close
tempfile.close
require 'fileutils'
FileUtils.mv("/tmp/file.txt", "/opt/rebuildnginx/nginx-1.8.0/debian/rules")
