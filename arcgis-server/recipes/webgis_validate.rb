#
# Cookbook Name:: arcgis-server
# Recipe:: webgis_validate
#
# Copyright 2016 Esri
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

raise "Chef-client version 12.5 or newer is required." if Gem::Version.new(node['chef_packages']['chef']['version']) < Gem::Version.new('12.5')

[node['arcgis']['server']['setup'],
 node['arcgis']['portal']['setup'],
 node['arcgis']['data_store']['setup'],
 node['arcgis']['web_adaptor']['setup'],
 node['arcgis']['server']['authorization_file'],
 node['arcgis']['portal']['authorization_file']].each do |file|
 raise "File '#{file}' not found." if !File.exists?(file)
end
