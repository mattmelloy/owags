Initialize-AWSDefaults -StoredCredentials HMAS -Region AP-Southeast-2 

$bucket = "esriau-231320508276"

Copy-S3Object -BucketName $bucket -Key "SETUP/105/arcgis_datastore_105.zip" -LocalFile "c:\ArcGIS\arcgis_datastore_105.zip"
Copy-S3Object -BucketName $bucket -Key "SETUP/105/arcgis_portal_105.zip" -LocalFile "c:\ArcGIS\arcgis_portal_105.zip"
Copy-S3Object -BucketName $bucket -Key "SETUP/105/arcgis_server_105.zip" -LocalFile "c:\ArcGIS\arcgis_server_105.zip"
Copy-S3Object -BucketName $bucket -Key "SETUP/105/arcgis_webadaptor_105.zip" -LocalFile "c:\ArcGIS\arcgis_webadaptor_105.zip"