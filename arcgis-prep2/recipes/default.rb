
directory 'C:/ArcGIS' do
  action :create
end

powershell_script 'download_files' do
	code <<-EOH
	Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_datastore_105.zip" -LocalFile "c:/ArcGIS/arcgis_datastore_105.zip"
	Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_portal_105.zip" -LocalFile "c:/ArcGIS/arcgis_portal_105.zip"
	Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_server_105.zip" -LocalFile "c:/ArcGIS/arcgis_server_105.zip"
	Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_webadaptor_105.zip" -LocalFile "c:/ArcGIS/arcgis_webadaptor_105.zip"
	Copy-S3Object -BucketName "esriau-231320508276" -Key "FILES/ARCGIS/hs.ecp" -LocalFile "c:/ArcGIS/arcgisserver105.ecp"
	Copy-S3Object -BucketName "esriau-231320508276" -Key "FILES/PORTAL/WildcardEsriAuOnline14to19.pfx" -LocalFile "c:/ArcGIS/WildcardEsriAuOnline14to19.pfx"
	EOH
end


windows_zipfile "C:/ArcGIS/10.5/server" do
  source "c:/ArcGIS/arcgis_server_105.zip"
  action :unzip
end