
<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
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
