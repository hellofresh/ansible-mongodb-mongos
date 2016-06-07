require 'serverspec'

# Required by serverspec
set :backend, :exec

describe user('mongodb') do
  it { should exist }
  it { should belong_to_primary_group 'mongodb' }
  it { should have_login_shell '/bin/false' }
end

describe file('/etc/mongos.conf') do
  it { should exist }
  it { should be_file }
end

describe file('/etc/init/mongos.conf') do
  it { should exist }
  it { should be_file }
end

describe file('/var/log/mongodb') do
  it { should exist }
  it { should be_directory }
end
