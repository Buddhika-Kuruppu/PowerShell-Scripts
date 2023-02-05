Connect-AzAccount -Tenant 'tenant Id' -SubscriptionId 'subscription Id'
$credential = Get-Credential
Connect-AzAccount -ServicePrincipal `
  -Credential $credential `
  -Tenant tenant Id
New-AzResourceGroupDeployment -Name Test_Deployment -ResourceGroupName Test-RG -TemplateFile .\main.bicep
