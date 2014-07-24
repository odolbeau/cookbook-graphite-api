require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe port(80) do
  it { should be_listening }
end
