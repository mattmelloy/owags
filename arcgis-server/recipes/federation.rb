#
# Cookbook Name:: arcgis-server
# Recipe:: webadaptor
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

arcgis_server_portal 'Federate Server' do
  portal_url node['arcgis']['portal']['wa_url']
  username node['arcgis']['portal']['admin_username']
  password node['arcgis']['portal']['admin_password']
  server_url node['arcgis']['server']['web_context_url']
  server_admin_url node['arcgis']['server']['private_url']
  server_username node['arcgis']['server']['admin_username']
  server_password node['arcgis']['server']['admin_password']
  is_hosting node['arcgis']['server']['is_hosting']
  action :federate_server
end
