# PowerShell.Module.Network
Network configuration module


[![GitHub release (semver)][img release]][release]
[![Commits since release][img commits since release]][commits]
[![Repo size][img size]][download zip]

[![Test result](./tests/TestResult.svg)][test result]
[![Code coverage](./tests/CodeCoverage.svg)][code coverage]
[![GitHub Pages][img pages status]][pages home]

A PowerShell module for interacting with the Network Adapters and the NordVPN API.

<img src='./img/NordVPN-Servers.png' width='140' align='right' alt='Project logo'/>

## Introduction

### Network Adapters
General Settings

### NordVPN 
This module provides various functions for retrieving country, grouping,
technology, and server information from the web API provided by NordVPN.

Possible filter parameters are generated dynamically by retrieving lists of
valid entries from the API. Lists of countries, groups, technologies, and
servers are included as an offline fallback, and these can be updated.
Sessional caching of country, group, and technology data is customisable.

## Functions
- Clear-NordVPNCache
- Clear-NordVPNCountryCache
- Clear-NordVPNGroupCache
- Clear-NordVPNTechnologyCache
- Find-NordVPNCity
- Find-NordVPNCountry
- Find-NordVPNGroup
- Find-NordVPNTechnology
- Get-NordVPNCityList
- Get-NordVPNCountryList
- Get-NordVPNGroupList
- Get-NordVPNModuleSetting
- Get-NordVPNRecommendedList
- Get-NordVPNServerList
- Get-NordVPNTechnologyList
- Reset-NordVPNModule
- Set-NordVPNModuleSetting

## Documentation

A full set of Markdown help files can be found **[here][help index]**.

You can also see the GitHub Pages website **[here][pages home]**.

## Configuration

Information on configuring the module can be found
 **[here][about settings]**.

## Testing

The module includes a complete testing suite using [Pester][pester site]. This
 may be found in the *tests* directory in the module root. A custom script
 permits in-place integration testing by protecting related files. Test result
 and code coverage reports are included, as is a script for regenerating test
 data. Also included for reference is the script used to generate result &
 coverage badges for GitHub.
