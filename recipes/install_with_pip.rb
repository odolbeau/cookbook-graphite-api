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
