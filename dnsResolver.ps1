#Resolve-DnsName -Name www.google.com -Type A

# Resolve for list of Addresses
$Namelist = @('google.com' , 'facebook.com')
$ServerList = @('8.8.8.8','8.8.4.4')

$FinalResult = @()
foreach ($Name in $NameList) {
    $tempObj = "" | Select-Object Name, IPAddress, Status, ErrorMessage
    try {
        $dnsRecord = Resolve-DnsName $Name -Server $ServerList -ErrorAction Stop | Where-Object { $_.Type -eq 'A' }
        $tempObj.Name = $Name
        $tempObj.IPAddress = ($dnsRecord.IPAddress -join ',')
        $tempObj.Status = 'OK'
        $tempObj.ErrorMessage = ''
    }
    catch {
        $tempObj.Name = $Name
        $tempObj.IPAddress = ''
        $tempObj.Status = 'NOT_OK'
        $tempObj.ErrorMessage = $_.Exception.Message
    }
    $FinalResult += $tempObj
}
return $FinalResult
