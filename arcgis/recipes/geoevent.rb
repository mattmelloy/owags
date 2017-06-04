#
# Cookbook Name:: arcgis
# Recipe:: geoevent
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

arcgis_geoevent 'Validate ArcGIS GeoEvent Extension for Server system requirements' do
  action :system
end

arcgis_geoevent 'Authorize ArcGIS GeoEvent Extension for Server' do
  authorization_file node['arcgis']['geoevent']['authorization_file']
  authorization_file_version node['arcgis']['geoevent']['authorization_file_version']
  action :authorize
end

arcgis_geoevent 'Setup ArcGIS GeoEvent Extension for Server' do
  setup node['arcgis']['geoevent']['setup']
  install_dir node['arcgis']['server']['install_dir']
  run_as_user node['arcgis']['run_as_user']
  run_as_password node['arcgis']['run_as_password']
  action :install
end
