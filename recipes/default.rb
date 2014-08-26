begin
  include_recipe "graphite-api::install_with_#{node['graphite_api']['install_method']}"
rescue Chef::Exceptions::RecipeNotFound
  raise Chef::Exceptions::RecipeNotFound, 'The install method ' \
    "`#{node['graphite_api']['install_method']}' is not supported by this " \
    'cookbook. Please ensure you have spelled it correctly. If you continue ' \
    'to encounter this error, please fill an issue.'
end

template '/etc/graphite-api.yaml' do
  source 'graphite-api.yaml.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :restart, 'service[graphite-api]', :delayed
end
