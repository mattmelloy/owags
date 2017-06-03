#
# Cookbook Name:: arcgis-server
# Recipe:: fileserver
#
# Copyright 2015 Esri
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

directory node['arcgis']['data_store']['local_backup_dir'] do
  owner node['arcgis']['run_as_user']
  if node['platform'] != 'windows'
    mode '0755'
  end
  recursive true
  action :create
end

directory node['arcgis']['server']['local_directories_root'] do
  owner node['arcgis']['run_as_user']
  if node['platform'] != 'windows'
    mode '0755'
  end
  recursive true
  action :create
end

if node['platform'] == 'windows'
  directory node['arcgis']['portal']['local_content_dir'] do
    owner node['arcgis']['run_as_user']
    recursive true
    action :create
  end
else
  subdir = '/'
  node['arcgis']['portal']['local_content_dir'].split('/').each do |path|
    subdir = ::File.join(subdir, path)
    if subdir != '/'
      directory subdir do
        owner node['arcgis']['run_as_user']
        mode '0755'
        action :create
      end
    end
  end
end

# TODO: share the directories
