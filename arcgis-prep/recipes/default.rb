include_recipe 'aws'

aws_s3_file "C:\\ArcGIS\\10.4.1\\arcgis_server_1041.zip" do
  bucket "esriau-347212306395"
  remote_path "FILES/ARCGIS/arcgis_server_1041.zip"
end

aws_s3_file "C:\\ArcGIS\\10.4.1\\hs.ecp" do
  bucket "esriau-347212306395"
  remote_path "FILES/ARCGIS/hs.ecp"
end

windows_zipfile "C:\\ArcGIS\\10.4.1\\server" do
  source "C:\\ArcGIS\\10.5\\arcgis_server_1041.zip"
  action :unzip
end