text = File.read("/opt/rebuildnginx/nginx-1.8.0/debian/rules")
new_contents = text.gsub(/common_configure_flags := \/, "common_configure_flags := \\\n --add-module=/opt/rebuildnginx/nginx_tcp_proxy_module \\")
puts new_contents
File.open("/opt/rebuildnginx/nginx-1.8.0/debian/rules", "w") {|file| file.puts new_contents }