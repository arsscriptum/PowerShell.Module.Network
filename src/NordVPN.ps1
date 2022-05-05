
<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>


$NordLogConfig = Get-LogConfig



function Get-NordVPNPath {

    try{
      
      $ProgramPath = "C:\Program Files\NordVPN"
      $NordVPNExe = Join-Path $ProgramPath 'NordVPN.exe'
     
      if(Test-Path $NordVPNExe){
        return $NordVPNExe
      }else{
        throw "Missing Nord VPN Exe"
      }
      return ""
    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }

}


function Get-CountryNameFromCode {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateSet('us', 'ca')]
        [string]$Country
    )

    switch($Country){
      'us' {  return 'United States' }
      'ca' {  return 'Canada'}
    }
    return ""
  }


function Get-NordServerInCountry {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateSet('us', 'ca')]
        [string]$Country
    )

    switch($Country){
      'us' {  return 'United States #9012' }
      'ca' {  return 'Canada #1561'}
    }
    return ""
  }


function Disconnect-NordVPN {
    [CmdletBinding(SupportsShouldProcess)]
    param()
    
    try{
        log "Disonnecting from NordVPN..."
        &"$(Get-NordVPNPath)" "-d"
    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }
}


function Connect-NordVPN {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$false)]
        [ValidateSet('us', 'ca')]
        [string]$Country="ca",
        [Parameter(Mandatory=$false)]
        [ValidateSet('United States #9012', 'Canada #1561')]
        [string]$Server="Canada #1561",
        [Parameter(Mandatory=$false)]
        [ValidateSet('us', 'ca')]
        [string]$Group="ca"
    )
    
    try{
        if ($PSBoundParameters.ContainsKey('Country')) {
            $srv = Get-NordServerInCountry $Country
            log "Connecting to NordVPN $srv..."
            &"$(Get-NordVPNPath)" "-c" "$srv"
            return
        }
        if ($PSBoundParameters.ContainsKey('Server')) {
            log "Connecting to NordVPN $Server..."
            &"$(Get-NordVPNPath)" "-c" "$Server"
            return
        }
        if ($PSBoundParameters.ContainsKey('Group')) {
            $GroupName = Get-CountryNameFromCode "$Group"
            log "Connecting to BEST NordVPN Server in $GroupName..."
            &"$(Get-NordVPNPath)" "-c" "-g" "$GroupName" 
            return
        }
        $Server="Canada #1561"
        log "Connecting to NordVPN $Server..."
        &"$(Get-NordVPNPath)" "-c" "$Server"
      
    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }
}
