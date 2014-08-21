#
# Cookbook Name:: gnu-parallel
# Recipe:: modulefile
# Author:: Koji Tanaka (<kj.tanaka@gmail.com>)
#
# Copyright 2014, FutureGrid Project, Indiana University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory "#{node['gnu_parallel']['modulefile_dir']}" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
  action :create
end

template "#{node['gnu_parallel']['modulefile_dir']}/#{node['gnu_parallel']['version']}" do
  source "modulefile.erb"
  variables(
    :prefix => node['gnu_parallel']['prefix']
  )
end

template "#{node['gnu_parallel']['modulefile_dir']}/.version" do
  source "dot.version.erb"
  variables(
    :default_version => node['gnu_parallel']['default_version']
  )
end