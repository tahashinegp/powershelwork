$DataSourceFile = "D:\powershell_check_checksum\DataSources.rdl"

[xml]$XmlDataSourceDefinition = Get-Content $DataSourceFile;
Write-Host("Data Source Name:$($XmlDataSourceDefinition.Report.Name)")
$con=$XmlDataSourceDefinition.Report.DataSources.DataSource.ConnectionProperties
#$xmlDataSourceName=$XmlDataSourceDefinition.SelectNodes("//DataSources/DataSource/*") | Where-Object { ($_ -eq "ConnectionProperties")}

#$xmlDataSourceName = $XmlDataSourceDefinition.DataSources.DataSource.ConnectionProperties | ? {$_.ChildNodes -eq "ConnectionProperties"}
Write-Host ("Data Source Extension: $con.Extension")
Write-Host ("Data Source Connection $con.ConnectString")
