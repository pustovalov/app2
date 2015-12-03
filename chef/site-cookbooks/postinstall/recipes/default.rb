group "rvm" do
  action :create
  members "vagrant"
  gid 1100
  append true
end

bash "chgrp and chmod" do
  user "root"
  cwd "/usr/local"
  code <<-EOH
    chgrp -R rvm rvm
    chmod -R g+rwxX rvm
  EOH
end