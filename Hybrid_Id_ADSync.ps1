#---------------------------------------------#
#          Connect to Remote Server           #
#PSRemoting should be enabled in remote server#
#---------------------------------------------#
Enter-PSSession -ComputerName #<Remote Server Name>

Import-Module ADSync

#Do the Delta Sync
Start-ADSyncSyncCycle -PolicyType Delta
#Do the Full Sync
Start-ADSyncSyncCycle -PolicyType Initial 