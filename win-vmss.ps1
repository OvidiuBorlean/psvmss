$vmssName = "akswinx" 
$vmssRG = "MC_AKS_AKS_WESTEUROPE" 
Connect-AzAccount
$vmss = Get-AzVmssVM -ResourceGroupName MC_AKS_AKS_WESTEUROPE -VMScaleSetName akswinx
echo $vmss
foreach ($item in $vmss.InstanceID) {
 Write-Host "Applying Configuration Change for " $item
 az vmss run-command invoke  --command-id RunPowerShellScript --name $vmssName -g $vmssRG --scripts 'netsh int ipv4 set dynamicportrange udp 49152 16178' --instance-id $item
 }