
<#
#̷𝓍   𝓐𝓡𝓢 𝓢𝓒𝓡𝓘𝓟𝓣𝓤𝓜
#̷𝓍   🇵​​​​​🇴​​​​​🇼​​​​​🇪​​​​​🇷​​​​​🇸​​​​​🇭​​​​​🇪​​​​​🇱​​​​​🇱​​​​​ 🇸​​​​​🇨​​​​​🇷​​​​​🇮​​​​​🇵​​​​​🇹​​​​​ 🇧​​​​​🇾​​​​​ 🇬​​​​​🇺​​​​​🇮​​​​​🇱​​​​​🇱​​​​​🇦​​​​​🇺​​​​​🇲​​​​​🇪​​​​​🇵​​​​​🇱​​​​​🇦​​​​​🇳​​​​​🇹​​​​​🇪​​​​​.🇶​​​​​🇨​​​​​@🇬​​​​​🇲​​​​​🇦​​​​​🇮​​​​​🇱​​​​​.🇨​​​​​🇴​​​​​🇲​​​​​
#>


$NordLogConfig = Get-LogConfig



function Get-NordVPNPath {

    try{
      if( -not (Get-NordVPNInitialized) ) { Initialize-NordVPNVariables }
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

function Get-NordVPNCountries {

    try{
      if( -not (Get-NordVPNInitialized) ) { Initialize-NordVPNVariables }
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
        [ValidateSet('AL', 'AR', 'AU', 'AT', 'BE', 'BA', 'BR', 'BG', 'CA', 'CL', 'CR', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI',
                'FR', 'GE', 'DE', 'GR', 'HK', 'HU', 'IS', 'IN', 'ID', 'IE', 'IL', 'IT', 'JP', 'LV', 'LU', 'MY', 'MX',
                'MD', 'NL', 'NZ', 'MK', 'NO', 'PL', 'PT', 'RO', 'RS', 'SG', 'SK', 'SI', 'ZA', 'KR', 'ES', 'SE', 'CH',
                'TW', 'TH', 'TR', 'UA', 'AE', 'GB', 'US', 'VN')]
        [string]$Code
    )
if( -not (Get-NordVPNInitialized) ) { Initialize-NordVPNVariables }
    switch($Code){
        "AL" { return "Albania"}
        "AR" { return "Argentina"}
        "AU" { return "Australia"}
        "AT" { return "Austria"}
        "BE" { return "Belgium"}
        "BA" { return "Bosnia and Herzegovina"}
        "BR" { return "Brazil"}
        "BG" { return "Bulgaria"}
        "CA" { return "Canada"}
        "CL" { return "Chile"}
        "CR" { return "Costa Rica"}
        "HR" { return "Croatia"}
        "CY" { return "Cyprus"}
        "CZ" { return "Czech Republic"}
        "DK" { return "Denmark"}
        "EE" { return "Estonia"}
        "FI" { return "Finland"}
        "FR" { return "France"}
        "GE" { return "Georgia"}
        "DE" { return "Germany"}
        "GR" { return "Greece"}
        "HK" { return "Hong Kong"}
        "HU" { return "Hungary"}
        "IS" { return "Iceland"}
        "IN" { return "India"}
        "ID" { return "Indonesia"}
        "IE" { return "Ireland"}
        "IL" { return "Israel"}
        "IT" { return "Italy"}
        "JP" { return "Japan"}
        "LV" { return "Latvia"}
        "LT" { return "Lithuania"}
        "LU" { return "Luxembourg"}
        "MY" { return "Malaysia"}
        "MX" { return "Mexico"}
        "MD" { return "Moldova"}
        "NL" { return "Netherlands"}
        "NZ" { return "New Zealand"}
        "MK" { return "North Macedonia"}
        "NO" { return "Norway"}
        "PL" { return "Poland"}
        "PT" { return "Portugal"}
        "RO" { return "Romania"}
        "RS" { return "Serbia"}
        "SG" { return "Singapore"}
        "SK" { return "Slovakia"}
        "SI" { return "Slovenia"}
        "ZA" { return "South Africa"}
        "KR" { return "South Korea"}
        "ES" { return "Spain"}
        "SE" { return "Sweden"}
        "CH" { return "Switzerland"}
        "TW" { return "Taiwan"}
        "TH" { return "Thailand"}
        "TR" { return "Turkey"}
        "UA" { return "Ukraine"}
        "AE" { return "United Arab Emirates"}
        "GB" { return "United Kingdom"}
        "US" { return "United States"}
        "VN" { return "Vietnam"}
    }
    return ""
  }


function Disconnect-NordVPN {
    [CmdletBinding(SupportsShouldProcess)]
    param()
    if( -not (Get-NordVPNInitialized) ) { Initialize-NordVPNVariables }
    try{
        log "Disonnecting from NordVPN..."
        &"$(Get-NordVPNPath)" "-d"
    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }
}

function Get-RandomCountry{
    $Country = @('AL', 'AR', 'AU', 'AT', 'BE', 'BA', 'BR', 'BG', 'CA', 'CL', 'CR', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI',
                'FR', 'GE', 'DE', 'GR', 'HK', 'HU', 'IS', 'IN', 'ID', 'IE', 'IL', 'IT', 'JP', 'LV', 'LU', 'MY', 'MX',
                'MD', 'NL', 'NZ', 'MK', 'NO', 'PL', 'PT', 'RO', 'RS', 'SG', 'SK', 'SI', 'ZA', 'KR', 'ES', 'SE', 'CH',
                'TW', 'TH', 'TR', 'UA', 'AE', 'GB', 'US', 'VN') | Get-Random
    return $Country
}

function Connect-NordVPN {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory=$false)]
        [ValidateSet('AL', 'AR', 'AU', 'AT', 'BE', 'BA', 'BR', 'BG', 'CA', 'CL', 'CR', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI',
                'FR', 'GE', 'DE', 'GR', 'HK', 'HU', 'IS', 'IN', 'ID', 'IE', 'IL', 'IT', 'JP', 'LV', 'LU', 'MY', 'MX',
                'MD', 'NL', 'NZ', 'MK', 'NO', 'PL', 'PT', 'RO', 'RS', 'SG', 'SK', 'SI', 'ZA', 'KR', 'ES', 'SE', 'CH',
                'TW', 'TH', 'TR', 'UA', 'AE', 'GB', 'US', 'VN')]
        [string]$Country="CA",
        [Parameter(Mandatory=$false)]
        [string]$Server,
        [Parameter(Mandatory=$false)]
        [switch]$Random
    )
    
    try{
        if( -not (Get-NordVPNInitialized) ) { Initialize-NordVPNVariables }
        if ($PSBoundParameters.ContainsKey('Server')) {
            log "Connecting to NordVPN server $Server..."
            &"$(Get-NordVPNPath)" "-c" "$Server"
            return
        }
        if ($PSBoundParameters.ContainsKey('Random')) {
            $Country  = Get-RandomCountry
            $FriendlyCountryName = Get-CountryNameFromCode $Country
            log "Connecting to NordVPN in RANDOM country $FriendlyCountryName ($Country)..."
            &"$(Get-NordVPNPath)" "-c" "-g" "$FriendlyCountryName"
            return
        }
        $FriendlyCountryName = Get-CountryNameFromCode $Country
        log "Connecting to NordVPN in country $FriendlyCountryName ($Country)..."
        &"$(Get-NordVPNPath)" "-c" "-g" "$FriendlyCountryName"

    }catch{
        Show-ExceptionDetails $_ -ShowStack
    }
}
