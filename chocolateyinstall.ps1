
function deployhProject(){
    Param
    (
         [Parameter(Mandatory=$true)]
        [string] $nuveenbusiness_api,
         [Parameter(Mandatory=$true)]
        [string]   $nuveenebusiness_contactus_api,
         [Parameter(Mandatory=$true)]
         [string]  $nuveenebusiness_nuveendata_api,
        # [Parameter(Mandatory=$true)]
        # [string]  $destinationServer,
         [Parameter(Mandatory=$true)]
         [string]  $destination
     
        # [Parameter(Mandatory=$true)]
        # [string] $destserver
    )
 
    <#
        if((-not(Test-Path "\\$destinationServer\$destination")))
    {
        Write-Host "Creating new folder...... "
       
        New-Item -Path "\\$server\$destination" -ItemType Directory
    }
    else {
        Write-Output "Delete contents of $"
    foreach($item in get-childitem $destination )
    {
        Write-Output "Delete" $item.fullname
        Remove-Item $item.fullname -recurse -Force
    }
    }
    #>

  

    Copy-Item -Path $nuveenbusiness_api -Destination \\$destinationServer\$destination -force -Recurse
    Copy-Item -Path $nuveenebusiness_contactus_api -Destination \\$destinationServer\$destination  -force -Recurse
    Copy-Item -Path $nuveenebusiness_nuveendata_api -Destination \\$destinationServer\$destination  -force -Recurse
    #robocopy  $nuveenbusiness_api $destination    | Write-Output
    #robocopy /MIR  $nuveenebusiness_contactus_api $destination    |  Write-Output
    #robocopy /MIR  $nuveenebusiness_nuveendata_api $destination    | Write-Output
    
   
}

function  deployfolderNew(){

  Param
  (
       [Parameter(Mandatory=$true)]
      [string] $nuveen,
       [Parameter(Mandatory=$true)]
       [string]  $destination
   
      # [Parameter(Mandatory=$true)]
      # [string] $destserver
  )
  Write-Host $nuveen
  Copy-Item -Path $nuveen -Destination $destination -force -Recurse 

}
<#
# command line call: `choco install <pkg_id> --params "'/LICENSE:value'"`
$pp = Get-PackageParameters
$pp.keys

$pp.values

#>


<#if (!$pp['DeployEnvironment']) { throw "Must supply a DeployEnvironment in the choco install arguments as foll
choco install <ssis package name> --params /DeployEnvironment:<val>'"" where '<val>' is DEV, UAT or PROD for SSIS packages
REF: https://chocolatey.org/docs/how-to-parse-package-parameters-argument" }

#>

$Destinationfolder = "E:\output"
#$filename= Get-ChildItem "$env:chocolateyPackageFolder" -Filter *.API | where-object {$_.extension -eq ".API"}
$service_nuveenebusiness_contactus_api="$env:chocolateyPackageFolder\Nuveen.EBusiness.ContactUs.API"
Write-Host $service_nuveenebusiness_contactus_api | % { Write-Host $_.FullName }
$filename= Get-ChildItem "$env:chocolateyPackageFolder" |  % { Write-Host $_.FullName }
#$servicefolder= |  Where-Object $_.name -like "*.API*"
#write-host $filename.Length
#$service_nuveenebusiness_api = ""
#$service_nuveenebusiness_contactus_api = ""
 $servicefolder= New-Object 'Collections.Generic.List[string]'
  for ($i=0; $i -le $filename.Length; $i++){
      Write-Host $filename.
      $servicefolder.Add($filename[$i])
    
  
   # Write-Host $servicefolder
  }
 
  Write-Host $servicefolder.Length
  Foreach ($deployfolderName in $servicefolder){
    if($deployfolderName.ToUpper().EndsWith(".API")){
      write-host $deployfolderName
      deployfolderNew $deployfolderName $Destinationfolder;
      Write-Host "deploying finished";
    }
   
 

  }
 
  #Write-Host $service_nuveenebusiness_api
  
  $service_nuveenebusiness_contactus_api="$env:chocolateyPackageFolder\Nuveen.EBusiness.ContactUs.API"
  
  #$service_nuveenebusiness_nuveendata_api="$env:chocolateyPackageFolder\Nuveen.EBusiness.NuveenData.API"
<#
try {

  deployhProject $service_nuveenebusiness_api $service_nuveenebusiness_contactus_api $service_nuveenebusiness_nuveendata_api  $Destinationfolder
  
}
catch {
  Write-Host "Exception"
}
#>


#$DeployEnv = $pp['DeployEnvironment']

<#
$jsonfile = "$env:chocolateyPackageFolder\bin\destinationServers.json"

if (Test-Path $jsonfile) {
  Write-Host $jsonfile
  $json= Get-Content -Raw -Path $jsonfile | ConvertFrom-Json
foreach ($line in $json.destinations){

     if ($line.environment -eq $DeployEnv) {
             $ds=[string]$line.server
             Write-Host $ds
            # $df=[string]$line.dbfolder
             deployhProject $service_nuveenebusiness_api $service_nuveenebusiness_contactus_api $service_nuveenebusiness_nuveendata_api $ds $Destinationfolder

    }
  }
}
#>





