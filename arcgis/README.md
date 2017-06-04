ArcGIS Cookbook
===============

This cookbook installs and configures ArcGIS for Server and ArcGIS for Desktop.

Requirements
------------
### Supported ArcGIS versions:
* 10.4

### Supported ArcGIS Software
* Arcgis Pro 1.1/1.2 
* ArcGIS for Server
* ArcGIS Data Store
* Portal for ArcGIS
* ArcGIS Web Adaptor
* ArcGIS for Desktop (Windows only)
* ArcGIS License Manager
* ArcGIS GeoEvent Extension for Server

### Platforms
* Windows 7
* Windows 8 (8.1)
  * 8.1 requires .Net Framework 3.5 (See ms_dotnet cookbook README)
* Windows Server 2008 (R2)
* Windows Server 2012 (R2)
* Ubuntu 14.04 (when deploying ArcGIS for Server on Amazon Web Services)
* Rhel 6.5, 7.0

### Dependencies
The following cookbooks are required:
* hostsfile
* limits
* authbind
* iptables
* windows
* ms_dotnet
* openssl

Attributes
----------
* `node['arcgis']['version']` = ArcGIS version, default `10.4`
* `node['arcgis']['run_as_user']` = Account used to run Server, Portal, and Data Store, default `arcgis`
* `node['arcgis']['run_as_password']` = Password for the account used to run Server, Portal, and Data Store, default `Pa$$w0rdPa$$w0rd`
* `node['arcgis']['server']['wa_name']` = The name of the web adaptor used for ArcGIS Server, default `server`
* `node['arcgis']['server']['domain_name']` = ArcGIS Server domain name; default value is the fully qualified domain name of the node
* `node['arcgis']['server']['local_url']` = ArcGIS Server local URL; default `http://localhost:6080/arcgis`
* `node['arcgis']['server']['url']` = ArcGIS Server public URL; default `https://<server domain name>/<server Web Adaptor name>`
* `node['arcgis']['server']['admin_username']` = Primary ArcGIS Server administrator user name; default is `admin`
* `node['arcgis']['server']['admin_password']` = Primary ArcGIS Server administrator password; default password is `changeit`
* `node['arcgis']['server']['directories_root']` = ArcGIS Server root directory; default directory is `C:\arcgisserver`, `/mnt/arcgisserver`
* `node['arcgis']['server']['setup']` = The location of the ArcGIS Server setup executable; default location is `C:\Temp\ArcGISServer\Setup.exe`, `/tmp/server-cd/Setup`
* `node['arcgis']['server']['install_dir']` = ArcGIS Server installation directory; default directory is `%ProgramW6432%\ArcGIS\Server`, `/`
* `node['arcgis']['server']['authorization_file']` = ArcGIS Server authorization file path; default path is `C:\Temp\server_license.prvc`, `/tmp/server_license.prvc`
* `node['arcgis']['server']['authorization_file_version']` = ArcGIS Server authorization file version; default version is `10.3`
* `node['arcgis']['server']['managed_database']` = Connection inofrmation for the ArcGIS Server's managed database
* `node['arcgis']['server']['replicated_database']` = Replicated GeoDatabase connection string
* `node['arcgis']['server']['keystore_file']` = Path to PKSC12 keystore file (.pfx) with server SSL certificate
* `node['arcgis']['server']['keystore_password']` = Keystore file password
* `node['arcgis']['server']['cert_alias']` = Server certificate alias; default
* `node['arcgis']['server']['domain_name']` = Server domin name; default the fully qualified domain name of the machine
* `node['arcgis']['server']['system_properties']` = ArcGIS Server system properties; default `{}` 
* `node['arcgis']['web_adaptor']['admin_access']` = Indicates if ArcGIS Server Manager and Admin API will be available through the Web Adaptor; default is `false`
* `node['arcgis']['portal']['domain_name']` = Portal domin name; default the fully qualified domain name of the machine
* `node['arcgis']['portal']['wa_name']` = The web adaptor name for Portal; default name is `portal`
* `node['arcgis']['portal']['local_url']` = Portal for ArcGIS local URL; default `https://<portal domain name>:7443/arcgis`
* `node['arcgis']['portal']['url']` = Portal for ArcGIS public URL; default `https://<portal domain name>/<portal Web Adaptor name>`
* `node['arcgis']['portal']['private_url']` = Portal for ArcGIS private URL; default `https://<portal domain name>:7443/arcgis`
* `node['arcgis']['portal']['web_context_url']` = Portal for ArcGIS web context URL; default `nil`
* `node['arcgis']['portal']['admin_username']` = Initial portal administrator user name; default name is `admin`
* `node['arcgis']['portal']['admin_password']` = Initial portal administrator password; default password is `changeit`
* `node['arcgis']['portal']['admin_email']` = Initial portal administrator e-mail; default email is `admin@mydomain.com`
* `node['arcgis']['portal']['admin_full_name']` = Initial portal administrator full name; default name is `Administrator`
* `node['arcgis']['portal']['admin_description']` = Initial portal administrator description, default description is `Initial portal account administrator`
* `node['arcgis']['portal']['security_question']` = Security question; default question is `Your favorite ice cream flavor?`
* `node['arcgis']['portal']['security_question_answer']` = Security question answer; default answer is `bacon`
* `node['arcgis']['portal']['setup']` = Portal for ArcGIS setup path; default path is `C:\Temp\ArcGISPortal\Setup.exe`, `/tmp/portal-cd/Setup`
* `node['arcgis']['portal']['install_dir']` = Portal for ArcGIS installation directory; default path is `%ProgramW6432%\ArcGIS\Portal`, `/`
* `node['arcgis']['portal']['content_dir']` = Portal content directory; default directory is `C:\arcgisportal\content`, `/arcgis/portal/usr/arcgisportal/content`
* `node['arcgis']['portal']['authorization_file']` = Portal for ArcGIS authorization file path; default location is `C:\Temp\portal_license.prvc`, `/tmp/portal_license.prvc`
* `node['arcgis']['portal']['authorization_file_version']` = Portal authorization file version; default version is `10.3`
* `node['arcgis']['portal']['keystore_file']` = Path to PKSC12 keystore file (.pfx) with server SSL certificate
* `node['arcgis']['portal']['keystore_password']` = Keystore file password
* `node['arcgis']['portal']['cert_alias']` = Server certificate alias; default `node['arcgis']['server']['domain_name']`
* `node['arcgis']['web_adaptor']['setup']` = Location of ArcGIS Web Adaptor setup executable; default location is `C:\Temp\WebAdaptorIIS\Setup.exe`, `/tmp/web-adaptor-cd/Setup`
* `node['arcgis']['web_adaptor']['install_dir']` = ArcGIS Web Adaptor installation directory
* `node['arcgis']['data_store']['data_dir']` = ArcGIS Data Store data directory; default directory is `C:\arcgisdatastore\data`, `/mnt/arcgisdatastore/data`
* `node['arcgis']['data_store']['setup']` = Location of ArcGIS Data Store setup executable; default location is `C:\Temp\ArcGISDataStore\Setup.exe`, `/tmp/tmp/data-store-cd/Setup`
* `node['arcgis']['data_store']['install_dir']` = ArcGIS Data Store installation directory; default directory is `%ProgramW6432%\ArcGIS\DataStore`, `/`
* `node['arcgis']['data_store']['preferredidentifier']` = ArcGIS Data Store preferred identifier method <hostname|ip>; default is `hostname`
* `node['arcgis']['data_store']['types']` = Comma-separated list of ArcGIS Data Store types (relational|tileCache|spatiotemporal); default is `tileCache,relational`
* `node['arcgis']['iis']['keystore_file']` = Path to PKSC12 keystore file (.pfx) with server SSL certificate
* `node['arcgis']['iis']['keystore_password']` = Keystore password
* `node['arcgis']['pro']['setup']` = The location of ArcGIS Pro setup msi; default location is `C:\Temp\ArcGISPro\ArcGISPro.msi`
* `node['arcgis']['pro']['install_dir']` = ArcGIS Pro installation directory; default path is `%ProgramFiles%\ArcGIS\Pro`
* `node['arcgis']['pro']['blockaddins']` = Configure the types of Add-ins that Pro will load; default is `#0`
* `node['arcgis']['pro']['allusers']` = Defines installation context of Pro, 1 = per machine and 2 = per user; default '2'
* `node['arcgis']['desktop']['setup']` = The location of ArcGIS for Desktop setup executable; default location is `C:\Temp\ArcGISDesktop\Setup.exe`
* `node['arcgis']['desktop']['install_dir']` = Desktop for ArcGIS installation directory; default path is `%ProgramFiles(x86)%\ArcGIS`
* `node['arcgis']['desktop']['install_features']` = Comma-separated list of desktop features to install; default is `ALL`
* `node['arcgis']['desktop']['authorization_file']` = Desktop for ArcGIS authorization file path; default location is `C:\\Temp\\license.ecp`
* `node['arcgis']['desktop']['authorization_file_version']` = Desktop authorization file version; default version is `10.3`
* `node['arcgis']['desktop']['esri_license_host']` = Hostname of ArcGIS License Manager; default is `%COMPUTERNAME%`
* `node['arcgis']['desktop']['software_class']` = Desktop software class <Viewer|Editor|Professional>; default is `Viewer`
* `node['arcgis']['desktop']['seat_preference']` = Desktop license seat preference <Fixed|Float>; default is `Fixed`
* `node['arcgis']['licensemanager']['setup']` = The location of ArcGIS License Manager setup executable; default location is `C:\Temp\ArcGISLicenseManager\Setup.exe`, `/tmp/licensemanager-cd/Setup`
* `node['arcgis']['licensemanager']['install_dir']` = ArcGIS License Manager installation directory; default path is `%ProgramFiles(x86)%\ArcGIS`, `/`
* `node['arcgis']['geoevent']['authorization_file']1` = ArcGIS GeoEvent Extension for Server authorization file path, default path is ``
* `node['arcgis']['geoevent']['authorization_file_version']` = ArcGIS GeoEvent Extension for Server authorization file version, default version is `node['arcgis']['server']['authorization_file_version']`
* `node['arcgis']['geoevent']['setup']` = The location of ArcGIS GeoEvent Extension for Server setup executable, default location is `C:\Temp\ArcGIS_GeoEventExtension\\setup.exe`,`/tmp/geo-event-cd/Setup.sh`


Recipes
-------
### arcgis::system
Creates user account that will run all ArcGIS software components, sets limits, and installs required packages.

### arcgis::all_installed
Installs all ArcGIS for Server and ArcGIS for Desktop software supported by the cookbook.

### arcgis::webgis_installed
Installs ArcGIS for Server, Portal for ArcGIS, ArcGIS Data Store, and ArcGIS Web Adaptors for server and portal.

### arcgis::all_uninstalled
Uninstalls all ArcGIS software of the specified version.

### arcgis::clean
Deletes local directories created by ArcGIS software.

### arcgis::authbind
Configures authbind for Apache Tomcat user (for Debian Linux family).

### arcgis::iptables
Configures iptables to forward ports 80/443 to 8080/8443.

### arcgis::iis
Enables IIS with features required by ArcGIS Web Adaptor IIS, configures HTTPS, and starts IIS

### arcgis::server
Installs and configures ArcGIS for Server.

### arcgis::server_node
Installs ArcGIS Server on the machine and joins an existing site

### arcgis::server_wa
Installs ArcGIS Web Adaptor and configures it with ArcGIS Server. You must install and condigure an IIS or Java application server such as Tomcat before installing ArcGIS Web Adaptor.

### arcgis::portal
Installs and configures Portal for ArcGIS.

### arcgis::portal_wa
Installs ArcGIS Web Adaptor and configures it with ArcGIS Portal. IIS or Java application server such as Tomcat must be installed and configured before installing Web Adaptor.

### arcgis::portal_standby
Installs and configures Portal for ArcGIS on standby machine

### arcgis::datastore
Installs and configures ArcGIS Data Store on primary machine.

### arcgis::datastore_standby
Installs and configures ArcGIS Data Store on standby machine.

### arcgis::federation
Registers and federates ArcGIS Server with Portal.

### arcgis::pro
Installs ArcGIS Pro.

### arcgis::desktop
Installs and configures ArcGIS for Desktop.

### arcgis::licensemanager
Installs and configures ArcGIS License Manager.

### arcgis::geoevent
Installs and configures ArcGIS GeoEvent Extension for Server.

Usage
-----
node-windows.json (Web GIS on single Windows machine)

```javascript
{
  "arcgis" : {
    "run_as_user":"arcgis",
    "run_as_password":"Run_As_Pa$$w0rd",
    "iis" : {
       "keystore_file":"C:\\ArcGIS\\keystore.pfx",
       "keystore_password":"changeit"
     },
     "web_adaptor" : {
       "setup":"C:\\ArcGIS\\WebAdaptorIIS\\Setup.exe"
     },
     "data_store" : {
       "setup":"C:\\ArcGIS\\DataStore\\Setup.exe"
     },
     "server" : {
       "domain_name":"agsportalssl.esri.com",
       "admin_username":"admin",
       "admin_password":"admin123",
       "directories_root":"C:\\arcgisserver",
       "setup":"C:\\ArcGIS\\Server\\Setup.exe",
       "authorization_file":"C:\\ArcGIS\\Server.prvc"
     },
     "portal" : {
       "domain_name":"agsportalssl.esri.com",
       "admin_username":"admin",
       "admin_password":"admin123",
       "admin_email":"admin@mydomain.com",
       "security_question":"Your favorite ice cream flavor?",
       "security_question_answer":"vanilla",
       "setup":"C:\\ArcGIS\\Portal\\Setup.exe",
       "authorization_file":"C:\\ArcGIS\\Portal.prvc"
     }
   },
   "run_list":[  
      "recipe[arcgis::system]",
      "recipe[arcgis::iis]",
      "recipe[arcgis::server]",
      "recipe[arcgis::server_wa]",
      "recipe[arcgis::datastore]",
      "recipe[arcgis::portal]",
      "recipe[arcgis::portal_wa]",
      "recipe[arcgis::federation]"
   ]
}
```

node-rhel.json (Web GIS on single Red Hat Enterprise Linux Server machine )

```javascript
{
    "java" : {
      "install_flavor":"oracle",
      "jdk_version":"7",
      "oracle":{
        "accept_oracle_download_terms":true
      }
    },
    "tomcat":{
      "base_version":7,
      "port":8080,
      "ssl_port":8443
    },
    "arcgis" : {
      "web_adaptor":{
        "setup":"/arcgis/WebAdaptor/Setup"
      },
      "data_store":{
        "setup":"/arcgis/DataStore/Setup"
      },
      "server":{
        "domain_name":"agsportalssl.esri.com",
        "admin_username":"admin",
        "admin_password":"admin123",
        "directories_root":"/home/ags/arcgis/server/usr/directories",
        "setup":"/arcgis/Server/Setup",
        "authorization_file":"/arcgis/server.prvc"
      },
      "portal":{
        "domain_name":"agsportalssl.esri.com",
        "admin_username":"admin",
        "admin_password":"admin123",
        "admin_email":"admin@mydomain.com",
        "security_question":"Your favorite ice cream flavor?",
        "security_question_answer":"vanilla",
        "setup":"/arcgis/Portal/Setup",
        "authorization_file":"/arcgis/portal.ecp"
      }
    },
    "run_list":[
      "recipe[arcgis::system]",
      "recipe[java]",
      "recipe[iptables]",
      "recipe[arcgis::iptables]",
      "recipe[tomcat]",
      "recipe[arcgis::server]",
      "recipe[arcgis::server_wa]",
      "recipe[arcgis::datastore]",
      "recipe[arcgis::portal]",
      "recipe[arcgis::portal_wa]",
      "recipe[arcgis::federation]"
    ]
}
```

## Issues

Find a bug or want to request a new feature?  Please let us know by submitting an [issue](https://github.com/Esri/arcgis-cookbook/issues).

## Contributing

Esri welcomes contributions from anyone and everyone. Please see our [guidelines for contributing](https://github.com/esri/contributing).

Licensing
---------

Copyright 2015 Esri

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

A copy of the license is available in the repository's [License.txt](https://github.com/Esri/arcgis-cookbook/blob/master/License.txt?raw=true) file.

[](Esri Tags: ArcGIS Chef Cookbook)
[](Esri Language: Ruby)
