# You can choose between "package" (for dibian base OS) or "pip"
default['graphite_api']['install_method'] = 'pip'

default['graphite_api']['search_index'] = '/srv/graphite/index'
default['graphite_api']['time_zone'] = 'Europe/Berlin'
default['graphite_api']['functions'] = ['graphite_api.functions.SeriesFunctions', 'graphite_api.functions.PieFunctions']
default['graphite_api']['finders'] = []

# Whisper config
default['graphite_api']['whisper']['enabled'] = true
if node['graphite_api']['whisper']['enabled'] == true
  default['graphite_api']['finders'] |= ['graphite_api.finders.whisper.WhisperFinder']
  default['graphite_api']['whisper']['directories'] = ['/srv/graphite/whisper']
end

# InfluxDB config
default['graphite_api']['influxdb']['enabled'] = false
if node['graphite_api']['influxdb']['enabled'] == true
  default['graphite_api']['finders'] |= ['graphite_influxdb.InfluxdbFinder']
  default['graphite_api']['influxdb']['host'] = '127.0.0.1'
  default['graphite_api']['influxdb']['port'] = 8086
  default['graphite_api']['influxdb']['user'] = 'graphite'
  default['graphite_api']['influxdb']['pass'] = 'graphite'
  default['graphite_api']['influxdb']['db'] = 'graphite'
end
