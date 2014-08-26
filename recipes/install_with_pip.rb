include_recipe 'build-essential'
include_recipe 'python'

directory '/srv/graphite' do
  owner 'root'
  group 'root'
  mode 0644
  action :create
end

file node['graphite_api']['search_index'] do
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
end

%w(libcairo2-dev libffi-dev).each do |pkg|
  package pkg
end

%w(gunicorn graphite-api).each do |pkg|
  python_pip pkg do
    action :install
  end
end

template '/etc/init.d/graphite-api' do
  source 'graphite-api-init.erb'
  mode 0755
  owner 'root'
  group 'root'
end

service 'graphite-api' do
  action [:enable, :start]
  supports start: true, stop: true, restart: true
end
