include_recipe 'windows'

directory 'C:/ArcGIS' do
  action :create
end

powershell_script 'download_files' do
	code <<-EOH
	if (!(Test-Path "c:/ArcGIS/arcgis_datastore_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_datastore_105.zip" -LocalFile "c:/ArcGIS/arcgis_datastore_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgis_portal_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_portal_105.zip" -LocalFile "c:/ArcGIS/arcgis_portal_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgis_server_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_server_105.zip" -LocalFile "c:/ArcGIS/arcgis_server_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgis_webadaptor_105.zip")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "SETUP/105/arcgis_webadaptor_105.zip" -LocalFile "c:/ArcGIS/arcgis_webadaptor_105.zip" }
	if (!(Test-Path "c:/ArcGIS/arcgisserver105.ecp")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "FILES/ARCGIS/hs.ecp" -LocalFile "c:/ArcGIS/arcgisserver105.ecp" }
	if (!(Test-Path "c:/ArcGIS/WildcardEsriAuOnline14to19.pfx")) { Copy-S3Object -BucketName "esriau-231320508276" -Key "FILES/PORTAL/WildcardEsriAuOnline14to19.pfx" -LocalFile "c:/ArcGIS/WildcardEsriAuOnline14to19.pfx" }
	not_if {::File.exists?('c:/ArcGIS/arcgis_server_105.zip')}
	EOH
end

directory 'C:/ArcGIS/10.5' do
  action :create
end

directory 'C:/ArcGIS/10.5/server' do
  action :create
end

<<<<<<< HEAD
windows_zipfile 'C:/ArcGIS/10.5/server' do
  source "c:/ArcGIS/arcgis_server_105.zip"
  action :unzip
  not_if {::File.exists?('C:/ArcGIS/10.5/server/arcgis_server_105/setup.msi')}
end

=======
powershell_script 'Unzip_files' do
	code <<-EOH
	$spath = "c:/ArcGIS/arcgis_server_105.zip"
	$destination = "C:/ArcGIS/10.5/server"
	Get-ChildItem $spath  -Recurse  | foreach-object  {
		$archiveFile = $_.fullname | out-string -stream
		$shellApplication = new-object -com shell.application
		$zipPackage = $shellApplication.NameSpace($archiveFile)
		$destinationFolder = $shellApplication.NameSpace($destination)
		$destinationFolder.CopyHere($zipPackage.Items(), 16) }
		EOH
end
>>>>>>> 6bd935741b09f05c93b7fc035dc6b0a025e2db19
