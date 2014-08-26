packagecloud_repo 'exoscale/community' do
  type 'deb'
end

package 'graphite-api' do
  action :install
end

service 'graphite-api' do
  action :nothing
  supports start: true, stop: true, status: true, restart: true, reload: true
end
