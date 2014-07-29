#
# Cookbook Name:: graphite-api
# Recipe:: default
#
# Copyright 2014, Olivier Dolbeau
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy
# of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#

begin
  include_recipe "graphite-api::install_with_#{node['graphite_api']['install_method']}"
rescue Chef::Exceptions::RecipeNotFound
  raise Chef::Exceptions::RecipeNotFound, 'The install method ' \
    "`#{node['graphite_api']['install_method']}' is not supported by this " \
    'cookbook. Please ensure you have spelled it correctly. If you continue ' \
    'to encounter this error, please fill an issue.'
end

if node['graphite_api']['influxdb']['enabled'] == true
  include_recipe 'python'
  python_pip 'graphite_influxdb'
end

template '/etc/graphite-api.yaml' do
  source 'graphite-api.yaml.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :restart, 'service[graphite-api]', :delayed
end
