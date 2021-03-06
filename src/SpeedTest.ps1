
<#
#ฬท๐   ๐๐ก๐ข ๐ข๐๐ก๐๐๐ฃ๐ค๐
#ฬท๐   ๐ตโโโโโ๐ดโโโโโ๐ผโโโโโ๐ชโโโโโ๐ทโโโโโ๐ธโโโโโ๐ญโโโโโ๐ชโโโโโ๐ฑโโโโโ๐ฑโโโโโ ๐ธโโโโโ๐จโโโโโ๐ทโโโโโ๐ฎโโโโโ๐ตโโโโโ๐นโโโโโ ๐งโโโโโ๐พโโโโโ ๐ฌโโโโโ๐บโโโโโ๐ฎโโโโโ๐ฑโโโโโ๐ฑโโโโโ๐ฆโโโโโ๐บโโโโโ๐ฒโโโโโ๐ชโโโโโ๐ตโโโโโ๐ฑโโโโโ๐ฆโโโโโ๐ณโโโโโ๐นโโโโโ๐ชโโโโโ.๐ถโโโโโ๐จโโโโโ@๐ฌโโโโโ๐ฒโโโโโ๐ฆโโโโโ๐ฎโโโโโ๐ฑโโโโโ.๐จโโโโโ๐ดโโโโโ๐ฒโโโโโ
#>



# ============================================================================================================
# SCRIPT VARIABLES
# ============================================================================================================
$Script:CurrentPath = (Get-Location).Path
$Script:ScriptPath = ''
$Script:CurrentModule = $ExecutionContext.SessionState.Module

if(($Global:MyInvocation) -And ($Global:MyInvocation.MyCommand) -And ($Global:MyInvocation.MyCommand.Path)){
    $Script:ScriptPath  = Split-Path $Global:MyInvocation.MyCommand.Path
}
$Script:PwshPath = (Get-Item ((Get-Command pwsh.exe).Source)).DirectoryName

$Script:Edition=$PSVersionTable.PSEdition.ToString()
$Script:Version=$PSVersionTable.PSVersion.ToString()
$Script:Paths = (Get-ModulePath | where Writeable -eq $True).Path
$Script:DefaultModulePath = ''
if($Paths.Count -gt 0){
     $DefaultModulePath = $Paths[0]
}




function Get-SpeedTesterPath {

    try{
      $ScriptMyInvocation = $Script:MyInvocation.MyCommand.Path
      $ModPath = (Get-Item $ScriptMyInvocation).DirectoryName
      $BinPath = Join-Path $ModPath 'bin'
      $SpeedTestExePath = Join-Path $BinPath 'speedtest.exe'

      if(Test-Path $SpeedTestExePath){
        return $SpeedTestExePath
      }else{
        throw "Missing speed tester app"
      }
      return ""
    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }

}



function Get-ClosestServers {
    $List = &"$(Get-SpeedTesterPath)" "-L" "-fjson"
    $ServersData = $List | ConvertFrom-Json
    $ServerList = $ServersData.servers
    return $ServerList
}
