require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe service('graphite-api') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8888) do
  it { should be_listening }
end
