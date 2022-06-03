<#
.Synopsis
Short Description

.DESCRIPTION
Long Description

.EXAMPLE
Example on usage of Script

#>

# Script Name : Server Basic Information Gathering v1.0
# Created By : Buddhike Kuruppu
# Date : 03-Jun-2022
# Last Update : 03-Jun-2022
# Reference

# Parameters

Param (
    [Parameter(Mandatory=$true)]
    [String]

    $ComputerName # For My PC DESKTOP-OFKNPN0
)

# variable Declaration

$Credential = Get-Credential
$CimSession = New-CimSession -ComputerName $ComputerName -Credential $Credential
$Analysis = $Credential.Username


# OS information

$OSinfo = (Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $ComputerName).caption

# Disk Utilization on OS Drive

$osdrive = Get-WmiObject -Class Win32_logicaldisk | Where-Object DeviceID -EQ 'C:'
$FreeSpace = (($osdrive.FreeSpace)/1gb) # Member Enumeration of variable

# System Memory Utilization

$MemoryInGB = ((((Get-CimInstance Win32_PhysicalMemory -ComputerName $ComputerName).Capacity | measure -Sum).Sum)/1gb)

# Last Reboot Details

$LastReboot = (Get-CimInstance -Class Win32_OperatingSystem -ComputerName $ComputerName).LastBootUpTime
$LastReboot

# IP and DNS Details

$DNS = Resolve-DnsName -Name $ComputerName | Where-Object Type -eq "A" #DNS Record Type as A_AAAA | A | NS | MD | MF | CNAME | SOA | MB | MG | MR | NULL and etc.
$DNSName = $DNS.Name
$DNSIPAddr = $DNS.IPaddress
$NetIPInfo = Get-CimInstance Win32_NetworkAdapterConfiguration


#Target DNS

$DNSServer = (Get-DNSClientServerAddress -cimsession $CimSession -InterfaceAlias "ethernet" -AddressFamily IPv4).ServerAddresses

#$CimSession = New-CimSession -ComputerName $ComputerName -Credential (Get-Credential)
#(Get-DNSClientServerAddress -cimsession $CimSession -InterfaceAlias "ethernet" -AddressFamily IPv4).ServerAddresses

# Output

Write-Output "Support Information for the $ComputerName"
Write-Output "========================================="


 