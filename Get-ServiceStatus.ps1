# Display status of services which are running on a specified machine

# Creates Parameter

Param (
    [Parameter(Mandatory=$true)]
    [String[]]  #Accepts Multiple inputs
     $ComputerName
)

# Variable for storing Get-Service objects

$Services = Get-Service -ComputerName $ComputerName

# Perform on each objects in Get-Services

Foreach ($Service in $Services){

    $ServiceStatus = $service.Status # Variable for status and display name with member enumeration

    $ServiceDisplayName = $Service.DisplayName

    # Desicion Making

    if ($ServiceStatus -eq 'Running'){
        Write-Output "Service Fine - Status of $ServiceDisplayName is $ServiceStatus"
    }

    Else {
        Write-Output "Check the Service - Status of $ServiceDisplayName is $ServiceStatus"
    }
}

# Get-Service -ComputerName $ComputerName | Where-Object -Property Status -eq 'Stopped'
# Get-Service -ComputerName $ComputerName | Where-Object -Property Status -eq 'Running'