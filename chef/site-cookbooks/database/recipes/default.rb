# PostgreSQL
# template "#{node[:postgresql][:dir]}/pg_hba.conf" do
#   source "pg_hba.conf"
#   notifies :restart, "service[postgresql]", :immediately
# end

# postgresql_connection_info = {
#   :host     => "localhost",
#   :password => node['postgresql']['password']['postgres']
# }
#
# postgresql_database_user 'pavel' do
#   connection postgresql_connection_info
#   password ''
#   # role_attributes :superuser => true, :createdb => true
#   action :create
# end

postgresql_database_user 'vagrant' do
  connection postgresql_connection_info
  database_name 'myapp2_development'
  privileges [:all]
  action :grant
end

postgresql_database 'myapp2_development' do
  connection(
    :host      => '127.0.0.1',
    :port      => 5432,
    :username  => 'vagrant',
    :password  => node['postgresql']['password']['postgres']
  )
  action :create
end