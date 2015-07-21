require 'beaker-rspec'
require 'pry'

hosts.each do |host|
  on host, install_puppet
end

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    puppet_module_install(source: module_root, module_name: 'my_module')
    hosts.each do |host|
      on host, puppet('module','install','puppetlabs-stdlib'), { acceptable_exit_codes: [0,1] }
    end
  end
end
