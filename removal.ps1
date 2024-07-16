Param($vmResourceId)

Connect-AzAccount -Identity

Select-AzSubscription -SubscriptionId $($vmResourceId.Split("/")[2])

Remove-AzVMExtension -ResourceGroupName $($vmResourceId.Split("/")[4]) -VMName $($vmResourceId.Split("/")[-1]) "MicrosoftMonitoringAgent" -Force

Update-AzTag -ResourceId $vmResourceId -Tag @{MMA_Installed = "true" } -Operation Delete