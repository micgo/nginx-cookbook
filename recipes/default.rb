#
# Cookbook Name:: nginx-cookbook
# Recipe:: default
#
# Copyright 2014, Chef Software, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/nginx.deb" do
  owner "root"
  group "root"
  mode "0644"
  source "http://ec2-54-80-160-92.compute-1.amazonaws.com:8080/job/nginx-app/ws/nginx_1.4.1-1_amd64.deb"
  checksum "e2d6c544be6282daa148e2d1a0259309d94741a6803d797b63de521b7e0202f8"
end

%w{libssl-dev libpcre3-dev}.each do |pkg|
  package pkg
end

dpkg_package "nginx" do
  source "#{Chef::Config[:file_cache_path]}/nginx.deb"
  action :install
end