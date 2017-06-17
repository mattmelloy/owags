include_recipe 'windows'

directory 'C:/ArcGIS' do
  action :create
end

directory 'C:/ArcGIS/10.5' do
  action :create
end

directory 'C:/ArcGIS/10.5/server' do
  action :create
end

powershell_script 'download_files' do
	code <<-EOH
	if (!(Test-Path "c:/ArcGIS/arcgis_datastore_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_datastore_105.zip" -LocalFile "c:/ArcGIS/arcgis_datastore_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgis_portal_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_portal_105.zip" -LocalFile "c:/ArcGIS/arcgis_portal_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgis_server_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_server_105.zip" -LocalFile "c:/ArcGIS/arcgis_server_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgis_webadaptor_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_webadaptor_105.zip" -LocalFile "c:/ArcGIS/arcgis_webadaptor_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgisserver105.ecp")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "FILES/ARCGIS/HS105.ecp" -LocalFile "c:/ArcGIS/arcgisserver105.ecp" }
	if (!(Test-Path "c:/ArcGIS/WildcardEsriAuOnline14to19.pfx")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "FILES/PORTAL/WildcardEsriAuOnline14to19.pfx" -LocalFile "c:/ArcGIS/WildcardEsriAuOnline14to19.pfx" }
	EOH
	not_if {::File.exists?('c:/ArcGIS/arcgis_server_105.zip')}
end

windows_zipfile 'C:/ArcGIS/10.5/server' do
  source "c:/ArcGIS/arcgis_server_105.zip"
  action :unzip
  not_if {::File.exists?("C:/ArcGIS/10.5/server/Setup.exe")}
end
