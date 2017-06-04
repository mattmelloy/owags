arcgis cookbook CHANGELOG
================

This file is used to list changes made in each version of the arcgis cookbook.

1.1.1
-----
- Initial release of arcgis cookbook

1.1.2
-----
- Support configuration of highly available Portal for ArcGIS
- Fixed problem with NetFx3 windows feature installation on Windows 8.1
- Fixed problem with missing '\items\portal\properties.json' file
- Use path relative to 'install_dir' path for server and portal software authorization tools on linux
- Improved 'desktop' and 'licensemanager' recipes
- Supported domain user accounts

1.1.3
-----
- Added ArcGIS GeoEvent Extension for Server resource
- Default value of attribute node['data_store']['preferredidentifier'] set to 'hostname' instead of 'ip' 

2.1.0
-----
- Added support for ArcGIS 10.4
- Added 'all_uninstalled' and 'cleanup' recipes
 
2.2.0
-----
- Added support for ArcGIS Pro
- Using 10.4 federation workflow
- Added 'arcgis' top level key to all arcgis cookbook attributes

