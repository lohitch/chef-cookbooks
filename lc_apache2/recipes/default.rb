#
# Cookbook:: lc_apache2
# Recipe:: default
#
# Copyright:: 2017, Lohitkumar Halemani, All Rights Reserved.

apt_update 'update' do
  action :update
end

package 'apache2' do
  action :install
end

service 'apache2' do
  action [:enable, :start]
end
