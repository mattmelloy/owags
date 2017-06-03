#
# Cookbook Name:: arcgis-server
# Attributes:: portal
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

default['arcgis']['portal'].tap do |portal|

  case ENV['arcgis_cloud_platform']
  when 'aws'
    portal['preferredidentifier'] = 'ip'
  else
    portal['preferredidentifier'] = 'hostname'
  end

  portal['wa_name'] = 'portal'

  if node['fqdn'].nil? || ENV['arcgis_cloud_platform'] == 'aws'
    portal['domain_name'] = node['ipaddress']
    portal['url'] = 'https://' + node['ipaddress'] + ':7443/arcgis'
    # Portal configuration requires fully qualified domain name in the WebAdaptor URL
    portal['wa_url'] = 'https://' + node['arcgis']['portal']['domain_name'] + '/' + node['arcgis']['portal']['wa_name']
  else
    portal['domain_name'] = node['fqdn']
    portal['url'] = 'https://' + node['fqdn'] + ':7443/arcgis'
    portal['wa_url'] = 'https://' + node['fqdn'] + '/' + node['arcgis']['portal']['wa_name']
  end

  portal['private_url'] = 'https://' + node['arcgis']['portal']['domain_name'] + ':7443/arcgis'
  portal['web_context_url'] = ''
  portal['admin_username'] = 'admin'
  portal['admin_password'] = 'changeit'
  portal['admin_email'] = 'admin@mydomain.com'
  portal['admin_full_name'] = 'Administrator'
  portal['admin_description'] = 'Initial account administrator'
  portal['security_question'] = 'Your favorite ice cream flavor?'
  portal['security_question_answer'] = 'bacon'
  portal['keystore_file'] = ''
  portal['keystore_password'] = ''
  portal['cert_alias'] = node['arcgis']['portal']['domain_name']
  portal['configure_autostart'] = true
  portal['install_system_requirements'] = true
  unless node['arcgis']['portal']['authorization_file'].nil?
    portal['cached_authorization_file'] = ::File.join(Chef::Config[:file_cache_path],
                                                      ::File.basename(node['arcgis']['portal']['authorization_file']))
  end

  # authorization_file_version must be <major>.<minor> ('10.4.1' -> '10.4')
  portal['authorization_file_version'] = node['arcgis']['version'].to_f.to_s

  case node['platform']
  when 'windows'
    portal['authorization_tool'] = ENV['ProgramW6432'] + '\\Common Files\\ArcGIS\\bin\\SoftwareAuthorization.exe'
    portal['authorization_file'] = ''
    portal['setup'] = 'C:\\Temp\\ArcGISPortal\\Setup.exe'
    portal['lp-setup'] = 'C:\\Temp\\ArcGISPortal\\SetupFile\\Setup.msi'
    portal['install_dir'] = ENV['ProgramW6432'] + '\\ArcGIS\\Portal'
    portal['data_dir'] = 'C:\\arcgisportal'
    portal['local_content_dir'] = node['arcgis']['portal']['data_dir'] + '\\content'
    portal['content_dir'] = node['arcgis']['portal']['local_content_dir']

    case node['arcgis']['version']
    when '10.5'
      portal['product_code'] = '{43EF63C6-957B-4DA7-A222-6904053BF222}'
    when '10.4.1'
      portal['product_code'] = '{31373E04-9B5A-4CD7-B668-0B1DE7F0D45F}'
    when '10.4'
      portal['product_code'] = '{FA6FCD2D-114C-4C04-A8DF-C2E43979560E}'
    else
      throw 'Unsupported ArcGIS version'
    end
  else # node['platform'] == 'linux'
    portal['install_dir'] = '/'
    portal['install_subdir'] = 'arcgis/portal'
    portal['start_tool'] = ::File.join(node['arcgis']['portal']['install_dir'],
                                       node['arcgis']['portal']['install_subdir'],
                                       '/startportal.sh')
    portal['stop_tool'] = ::File.join(node['arcgis']['portal']['install_dir'],
                                      node['arcgis']['portal']['install_subdir'],
                                      '/stopportal.sh')
    portal['authorization_tool'] = ::File.join(node['arcgis']['portal']['install_dir'],
                                               node['arcgis']['portal']['install_subdir'],
                                               '/tools/authorizeSoftware')
    portal['authorization_file'] = ''
    portal['setup'] = '/tmp/portal-cd/Setup'
    portal['lp-setup'] = '/tmp/portalLP-cd/Setup'
    portal['data_dir'] = ::File.join(node['arcgis']['portal']['install_dir'],
                                     node['arcgis']['portal']['install_subdir'],
                                     'usr/arcgisportal')
    portal['local_content_dir'] = ::File.join(node['arcgis']['portal']['data_dir'], 'content')
    portal['content_dir'] = node['arcgis']['portal']['local_content_dir']
  end

  portal['content_store_type'] = 'fileStore'
  portal['content_store_provider'] = 'FileSystem'
  portal['content_store_connection_string'] = node['arcgis']['portal']['content_dir']
  portal['object_store'] = nil
end
