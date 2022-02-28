#
# Cookbook:: linux_web_server
# Spec:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'linux_web_server::default' do
  context 'When all attributes are default, on Ubuntu 20.04' do
    platform 'ubuntu', '20.04'
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on CentOS 7' do
    platform 'centos', '7'
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on RedHat 7' do
    platform 'redhat', '7'
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
