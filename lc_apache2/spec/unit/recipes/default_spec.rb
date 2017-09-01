#
# Cookbook:: lc_apache2
# Spec:: default
#
# Copyright:: 2017, Lohitkumar Halemani, All Rights Reserved.

require 'spec_helper'

describe 'lc_apache2::default' do
  context 'Ubuntu' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'updates apt cache' do
      expect(chef_run).to update_apt_update('update')
    end

    it 'installs apache' do
      expect(chef_run).to install_package('apache2')
    end

    it 'enables apache2 service' do
      expect(chef_run).to enable_service('apache2')
    end

    it 'starts apache2 service' do
      expect(chef_run).to start_service('apache2')
    end
  end
end
