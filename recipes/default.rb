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
  checksum "fda369e096ddbc52aec82f27ab61b5f0b2ad5a5538f06fd01ed23c7e593155b1"
end

%w{libssl-dev libpcre3-dev}.each do |pkg|
  package pkg
end

dpkg_package "nginx" do
  source "#{Chef::Config[:file_cache_path]}/nginx.deb"
  action :install
end