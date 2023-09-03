---
ID: "a326e8a5-4320-46cd-8840-910749dc3c71"
Date Created: "2023-05-10"
Date Modified: "2023-05-10"
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Title: "dbatools - Command Index.md"
Sources: 
  - [""](""): ""
ImageURL: ""
Tags: ["AG", "DbBackup", "CertBackup", "CertificatesEncryption", "Community", "Connection", "ConnectionStrings", "Database", "DataMasking", "dbatoolsCM", "dbatoolsConfig", "dbatoolsSupport", "dbatoolsupdates", "DBCC", "Diagnostic", "Detach", "Endpoints", "Export", "Storage", "FileStream", "Lookup", "General", "LinkedServer", "LogShipping", "Login", "MailandLogging", "MaxMemory", "Migration", "Mirroring", "Network", "PolicyBasedManagement", "RegisteredServers", "Replication", "ResourceGovernor", "Security", "Server", "SPN", "Services", "DataGeneration", "Snapshots", "spconfigure", "Agent", "ClientAlias", "SMO", "startup", "tempdb", "Traces", "Utilities", "WSFC", "Tables"]
Aliases:
  - "<% tp.file.title %>"
---


# dbatools Command Index

*Source: https://dbatools.io/commands/*

[[dbatools]] is a free [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]] module with over 500 [[SQL Server]] best practice, administration, development and migration commands included. Currently, other components of SQL Server such as SSIS, SSRS and SSAS are not supported, but they are part of the overall goal.

The high number of commands may seem overwhelming but think of it like learning SQL Server. Start with the basics like Logins, Jobs, or Backup/Restore and later on, you can move on to Extended Events. To make it easier, weâve included [simplified usage examples](https://dbatools.io/getting-started) that can help you get started.

Want to help build dbatools? We invite you to [join](https://dbatools.io/slack) the [team](https://dbatools.io/team).

## Categories

[Availability Groups](https://dbatools.io/commands//#AG)  
[Backup and Restore â Database](https://dbatools.io/commands//#DbBackup)  
[Backup and Restore â Certificates](https://dbatools.io/commands//#CertBackup)  
[Certificates and Encryption](https://dbatools.io/commands//#CertificatesEncryption)  
[Community Tools](https://dbatools.io/commands//#Community)  
[Connections](https://dbatools.io/commands//#Connection)  
[Connection Strings](https://dbatools.io/commands//#ConnectionStrings)  
[Databases](https://dbatools.io/commands//#Database)  
[Data Masking](https://dbatools.io/commands//#DataMasking)  
[dbatools Computer Management](https://dbatools.io/commands//#dbatoolsCM)  
[dbatools Configuration](https://dbatools.io/commands//#dbatoolsConfig)  
[dbatools Support tools](https://dbatools.io/commands//#dbatoolsSupport)  
[dbatools update watcher](https://dbatools.io/commands//#dbatoolsupdates)  

[DBCC](https://dbatools.io/commands//#DBCC)  
[Diagnostics and Performance](https://dbatools.io/commands//#Diagnostic)  
[Detach and Attach](https://dbatools.io/commands//#Detach)  
[Endpoints](https://dbatools.io/commands//#Endpoints)  
[Export](https://dbatools.io/commands//#Export)  
[File System and Storage](https://dbatools.io/commands//#Storage)  
[FileStream](https://dbatools.io/commands//#FileStream)  
[Lookup (Find)](https://dbatools.io/commands//#Lookup)  
[General](https://dbatools.io/commands//#General)  
[Linked Servers](https://dbatools.io/commands//#LinkedServer)  
[Log Shipping](https://dbatools.io/commands//#LogShipping)  
[Login and User Management](https://dbatools.io/commands//#Login)  
[Mail and Logging](https://dbatools.io/commands//#MailandLogging)  

[Max Memory](https://dbatools.io/commands//#MaxMemory)  
[Migration](https://dbatools.io/commands//#Migration)  
[Mirroring](https://dbatools.io/commands//#Mirroring)  
[Network and Firewall](https://dbatools.io/commands//#Network)  
[Policy-Based Management](https://dbatools.io/commands//#PolicyBasedManagement)  
[Registered Servers](https://dbatools.io/commands//#RegisteredServers)  
[Replication](https://dbatools.io/commands//#Replication)  
[Resource Governor](https://dbatools.io/commands//#ResourceGovernor)  
[Security and Encryption](https://dbatools.io/commands//#Security)  
[Server Management](https://dbatools.io/commands//#Server)  
[Service Principal Names (SPNs)](https://dbatools.io/commands//#SPN)  
[Services](https://dbatools.io/commands//#Services)  
[Data Generation](https://dbatools.io/commands//#DataGeneration)  

[Snapshots](https://dbatools.io/commands//#Snapshots)  
[sp\_configure](https://dbatools.io/commands//#spconfigure)  
[SQL Agent](https://dbatools.io/commands//#Agent)  
[SQL Client Configuration](https://dbatools.io/commands//#ClientAlias)  
[SQL Management Objects](https://dbatools.io/commands//#SMO)  
[System startup](https://dbatools.io/commands//#startup)  
[tempdb](https://dbatools.io/commands//#tempdb)  
[Traces, Profiler and Extended Events](https://dbatools.io/commands//#Traces)  
[Utilities](https://dbatools.io/commands//#Utilities)  
[Windows Server Failover Cluster](https://dbatools.io/commands//#WSFC)  
[Table Data](https://dbatools.io/commands//#Tables)  

### Migration

[Copy-DbaAgentAlert](http://docs.dbatools.io/Copy-DbaAgentAlert)  
[Copy-DbaAgentJobCategory](http://docs.dbatools.io/Copy-DbaAgentJobCategory)  
[Copy-DbaAgentJob](http://docs.dbatools.io/Copy-DbaAgentJob)  
[Copy-DbaAgentOperator](http://docs.dbatools.io/Copy-DbaAgentOperator)  
[Copy-DbaAgentProxy](http://docs.dbatools.io/Copy-DbaAgentProxy)  
[Copy-DbaAgentServer](http://docs.dbatools.io/Copy-DbaAgentServer)  
[Copy-DbaAgentSchedule](http://docs.dbatools.io/Copy-DbaAgentSchedule)  
[Copy-DbaBackupDevice](http://docs.dbatools.io/Copy-DbaBackupDevice)  
[Copy-DbaCredential](http://docs.dbatools.io/Copy-DbaCredential)  
[Copy-DbaCustomError](http://docs.dbatools.io/Copy-DbaCustomError)  
[Copy-DbaDatabase](http://docs.dbatools.io/Copy-DbaDatabase)  
[Copy-DbaDataCollector](http://docs.dbatools.io/Copy-DbaDataCollector)  
[Copy-DbaDbAssembly](http://docs.dbatools.io/Copy-DbaDbAssembly)  
[Copy-DbaDbMail](http://docs.dbatools.io/Copy-DbaDbMail)  
[Copy-DbaDbQueryStoreOption](http://docs.dbatools.io/Copy-DbaDbQueryStoreOption)  
[Copy-DbaEndpoint](http://docs.dbatools.io/Copy-DbaEndpoint)  
[Copy-DbaInstanceAudit](http://docs.dbatools.io/Copy-DbaInstanceAudit)  
[Copy-DbaInstanceAuditSpecification](http://docs.dbatools.io/Copy-DbaInstanceAuditSpecification)  
[Copy-DbaInstanceTrigger](http://docs.dbatools.io/Copy-DbaInstanceTrigger)  
[Copy-DbaLinkedServer](http://docs.dbatools.io/Copy-DbaLinkedServer)  
[Copy-DbaLogin](http://docs.dbatools.io/Copy-DbaLogin)  
[Copy-DbaPolicyManagement](http://docs.dbatools.io/Copy-DbaPolicyManagement)  
[Copy-DbaRegServer](http://docs.dbatools.io/Copy-DbaRegServer)  
[Copy-DbaResourceGovernor](http://docs.dbatools.io/Copy-DbaResourceGovernor)  
[Copy-DbaSpConfigure](http://docs.dbatools.io/Copy-DbaSpConfigure)  
[Copy-DbaStartupProcedure](http://docs.dbatools.io/Copy-DbaStartupProcedure)  
[Copy-DbaSysDbUserObject](http://docs.dbatools.io/Copy-DbaSysDbUserObject)  
[Copy-DbaXESession](http://docs.dbatools.io/Copy-DbaXESession)  
[Start-DbaMigration](http://docs.dbatools.io/Start-DbaMigration)  
[Test-DbaMigrationConstraint](http://docs.dbatools.io/Test-DbaMigrationConstraint)

### Backup and Restore â Database

[Backup-DbaDatabase](http://docs.dbatools.io/Backup-DbaDatabase)  
[Get-DbaDbRecoveryModel](http://docs.dbatools.io/Get-DbaDbRecoveryModel)  
[Format-DbaBackupInformation](http://docs.dbatools.io/Format-DbaBackupInformation)  
[Get-DbaDbBackupHistory](http://docs.dbatools.io/Get-DbaDbBackupHistory)  
[Get-DbaBackupInformation](http://docs.dbatools.io/Get-DbaBackupInformation)  
[Get-DbaDbExtentDiff](http://docs.dbatools.io/Get-DbaDbExtentDiff)  
[Get-DbaDbRestoreHistory](http://docs.dbatools.io/Get-DbaDbRestoreHistory)  
[Get-DbaLastBackup](http://docs.dbatools.io/Get-DbaLastBackup)  
[Invoke-DbaAdvancedRestore](http://docs.dbatools.io/Invoke-DbaAdvancedRestore)  
[Measure-DbaBackupThroughput](http://docs.dbatools.io/Measure-DbaBackupThroughput)  
[Read-DbaBackupHeader](http://docs.dbatools.io/Read-DbaBackupHeader)  
[Remove-DbaBackup](http://docs.dbatools.io/Remove-DbaBackup)  
[Remove-DbaDbBackupRestoreHistory](http://docs.dbatools.io/Remove-DbaDbBackupRestoreHistory)  
[Restore-DbaDatabase](http://docs.dbatools.io/Restore-DbaDatabase)  
[Select-DbaBackupInformation](http://docs.dbatools.io/Select-DbaBackupInformation)  
[Test-DbaBackupInformation](http://docs.dbatools.io/Test-DbaBackupInformation)  
[Test-DbaDbRecoveryModel](http://docs.dbatools.io/Test-DbaDbRecoveryModel)  
[Test-DbaLastBackup](http://docs.dbatools.io/Test-DbaLastBackup)

### Backup and Restore â Certificates

[Backup-DbaComputerCertificate](http://docs.dbatools.io/Backup-DbaComputerCertificate)  
[Backup-DbaDbCertificate](http://docs.dbatools.io/Backup-DbaDbCertificate)  
[Backup-DbaDbMasterKey](http://docs.dbatools.io/Backup-DbaDbMasterKey)  
[Backup-DbaServiceMasterKey](http://docs.dbatools.io/Backup-DbaServiceMasterKey)  
[Restore-DbaDbCertificate](http://docs.dbatools.io/Restore-DbaDbCertificate)

### Diagnostics and Performance

[Clear-DbaConnectionPool](http://docs.dbatools.io/Clear-DbaConnectionPool)  
[Clear-DbaLatchStatistics](http://docs.dbatools.io/Clear-DbaLatchStatistics)  
[Clear-DbaPlanCache](http://docs.dbatools.io/Clear-DbaPlanCache)  
[Clear-DbaWaitStatistics](http://docs.dbatools.io/Clear-DbaWaitStatistics)  
[Disable-DbaTraceFlag](http://docs.dbatools.io/Disable-DbaTraceFlag)  
[Enable-DbaTraceFlag](http://docs.dbatools.io/Enable-DbaTraceFlag)  
[Export-DbaExecutionPlan](http://docs.dbatools.io/Export-DbaExecutionPlan)  
[Get-DbaCpuRingBuffer](http://docs.dbatools.io/Get-DbaCpuRingBuffer)  
[Get-DbaCpuUsage](http://docs.dbatools.io/Get-DbaCpuUsage)  
[Get-DbaDbVirtualLogFile](http://docs.dbatools.io/Get-DbaDbVirtualLogFile)  
[Get-DbaDump](http://docs.dbatools.io/Get-DbaDump)  
[Get-DbaEstimatedCompletionTime](http://docs.dbatools.io/Get-DbaEstimatedCompletionTime)  
[Get-DbaExecutionPlan](http://docs.dbatools.io/Get-DbaExecutionPlan)  
[Get-DbaExternalProcess](http://docs.dbatools.io/Get-DbaExternalProcess)  
[Get-DbaIoLatency](http://docs.dbatools.io/Get-DbaIoLatency)  
[Get-DbaLatchStatistic](http://docs.dbatools.io/Get-DbaLatchStatistic)  
[Get-DbaOpenTransaction](http://docs.dbatools.io/Get-DbaOpenTransaction)  
[Get-DbaPlanCache](http://docs.dbatools.io/Get-DbaPlanCache)  
[Get-DbaProcess](http://docs.dbatools.io/Get-DbaProcess)  
[Get-DbaQueryExecutionTime](http://docs.dbatools.io/Get-DbaQueryExecutionTime)  
[Get-DbaSpinLockStatistic](http://docs.dbatools.io/Get-DbaSpinLockStatistic)  
[Get-DbaTopResourceUsage](http://docs.dbatools.io/Get-DbaTopResourceUsage)  
[Get-DbaTraceFlag](http://docs.dbatools.io/Get-DbaTraceFlag)  
[Get-DbaWaitingTask](http://docs.dbatools.io/Get-DbaWaitingTask)  
[Get-DbaWaitResource](http://docs.dbatools.io/Get-DbaWaitResource)  
[Get-DbaWaitStatistic](http://docs.dbatools.io/Get-DbaWaitStatistic)  
[Measure-DbaDbVirtualLogFile](http://docs.dbatools.io/Measure-DbaDbVirtualLogFile)  
[Measure-DbaDiskSpaceRequirement](http://docs.dbatools.io/Measure-DbaDiskSpaceRequirement)  
[Stop-DbaExternalProcess](http://docs.dbatools.io/Stop-DbaExternalProcess)  
[Stop-DbaProcess](http://docs.dbatools.io/Stop-DbaProcess)  
[Test-DbaDiskSpeed](http://docs.dbatools.io/Test-DbaDiskSpeed)

### DBCC

[Get-DbaDbccHelp](http://docs.dbatools.io/Get-DbaDbccHelp)  
[Get-DbaDbccMemoryStatus](http://docs.dbatools.io/Get-DbaDbccMemoryStatus)  
[Get-DbaDbccProcCache](http://docs.dbatools.io/Get-DbaDbccProcCache)  
[Get-DbaDbccSessionBuffer](http://docs.dbatools.io/Get-DbaDbccSessionBuffer)  
[Get-DbaDbccStatistic](http://docs.dbatools.io/Get-DbaDbccStatistic)  
[Get-DbaDbccUserOption](http://docs.dbatools.io/Get-DbaDbccUserOption)  
[Get-DbaDbDbccOpenTran](http://docs.dbatools.io/Get-DbaDbDbccOpenTran)  
[Invoke-DbaDbccDropCleanBuffer](http://docs.dbatools.io/Invoke-DbaDbccDropCleanBuffer)  
[Invoke-DbaDbccFreeCache](http://docs.dbatools.io/Invoke-DbaDbccFreeCache)  
[Invoke-DbaDbDbccCheckConstraint](http://docs.dbatools.io/Invoke-DbaDbDbccCheckConstraint)  
[Invoke-DbaDbDbccCleanTable](http://docs.dbatools.io/Invoke-DbaDbDbccCleanTable)  
[Invoke-DbaDbDbccUpdateUsage](http://docs.dbatools.io/Invoke-DbaDbDbccUpdateUsage)

### Traces and Profiler

[Get-DbaTrace](http://docs.dbatools.io/Get-DbaTrace)  
[Read-DbaTraceFile](http://docs.dbatools.io/Read-DbaTraceFile)  
[Remove-DbaTrace](http://docs.dbatools.io/Remove-DbaTrace)  
[Start-DbaTrace](http://docs.dbatools.io/Start-DbaTrace)  
[Stop-DbaTrace](http://docs.dbatools.io/Stop-DbaTrace)

### Extended Events

[ConvertTo-DbaXESession](http://docs.dbatools.io/ConvertTo-DbaXESession)  
[Copy-DbaXESessionTemplate](http://docs.dbatools.io/Copy-DbaXESessionTemplate)  
[Export-DbaXECsv](http://docs.dbatools.io/Export-DbaXECsv)  
[Export-DbaXESession](http://docs.dbatools.io/Export-DbaXESession)  
[Export-DbaXESessionTemplate](http://docs.dbatools.io/Export-DbaXESessionTemplate)  
[Get-DbaXEObject](http://docs.dbatools.io/Get-DbaXEObject)  
[Get-DbaXESession](http://docs.dbatools.io/Get-DbaXESession)  
[Get-DbaXESessionTarget](http://docs.dbatools.io/Get-DbaXESessionTarget)  
[Get-DbaXESessionTargetFile](http://docs.dbatools.io/Get-DbaXESessionTargetFile)  
[Get-DbaXESessionTemplate](http://docs.dbatools.io/Get-DbaXESessionTemplate)  
[Get-DbaXESmartTarget](http://docs.dbatools.io/Get-DbaXESmartTarget)  
[Get-DbaXEStore](http://docs.dbatools.io/Get-DbaXEStore)  
[Import-DbaXESessionTemplate](http://docs.dbatools.io/Import-DbaXESessionTemplate)  
[Invoke-DbaXeReplay](http://docs.dbatools.io/Invoke-DbaXeReplay)  
[New-DbaXESession](http://docs.dbatools.io/New-DbaXESession)  
[New-DbaXESmartCsvWriter](http://docs.dbatools.io/New-DbaXESmartCsvWriter)  
[New-DbaXESmartEmail](http://docs.dbatools.io/New-DbaXESmartEmail)  
[New-DbaXESmartQueryExec](http://docs.dbatools.io/New-DbaXESmartQueryExec)  
[New-DbaXESmartReplay](http://docs.dbatools.io/New-DbaXESmartReplay)  
[New-DbaXESmartTableWriter](http://docs.dbatools.io/New-DbaXESmartTableWriter)  
[Read-DbaXEFile](http://docs.dbatools.io/Read-DbaXEFile)  
[Remove-DbaXESession](http://docs.dbatools.io/Remove-DbaXESession)  
[Remove-DbaXESmartTarget](http://docs.dbatools.io/Remove-DbaXESmartTarget)  
[Start-DbaXESession](http://docs.dbatools.io/Start-DbaXESession)  
[Start-DbaXESmartTarget](http://docs.dbatools.io/Start-DbaXESmartTarget)  
[Stop-DbaXESession](http://docs.dbatools.io/Stop-DbaXESession)  
[Stop-DbaXESmartTarget](http://docs.dbatools.io/Stop-DbaXESmartTarget)  
[Watch-DbaXESession](http://docs.dbatools.io/Watch-DbaXESession)

### Resource Governor

[Get-DbaResourceGovernor](http://docs.dbatools.io/Get-DbaResourceGovernor)  
[Get-DbaRgClassifierFunction](http://docs.dbatools.io/Get-DbaRgClassifierFunction)  
[Get-DbaRgResourcePool](http://docs.dbatools.io/Get-DbaRgResourcePool)  
[Get-DbaRgWorkloadGroup](http://docs.dbatools.io/Get-DbaRgWorkloadGroup)  
[New-DbaRgResourcePool](http://docs.dbatools.io/New-DbaRgResourcePool)  
[New-DbaRgWorkloadGroup](http://docs.dbatools.io/New-DbaRgWorkloadGroup)  
[Remove-DbaRgResourcePool](http://docs.dbatools.io/Remove-DbaRgResourcePool)  
[Remove-DbaRgWorkloadGroup](http://docs.dbatools.io/Remove-DbaRgWorkloadGroup)  
[Set-DbaResourceGovernor](http://docs.dbatools.io/Set-DbaResourceGovernor)  
[Set-DbaRgResourcePool](http://docs.dbatools.io/Set-DbaRgResourcePool)  
[Set-DbaRgWorkloadGroup](http://docs.dbatools.io/Set-DbaRgWorkloadGroup)

### PerfMon

[Add-DbaPfDataCollectorCounter](http://docs.dbatools.io/Add-DbaPfDataCollectorCounter)  
[Export-DbaPfDataCollectorSetTemplate](http://docs.dbatools.io/Export-DbaPfDataCollectorSetTemplate)  
[Get-DbaPfAvailableCounter](http://docs.dbatools.io/Get-DbaPfAvailableCounter)  
[Get-DbaPfDataCollector](http://docs.dbatools.io/Get-DbaPfDataCollector)  
[Get-DbaPfDataCollectorCounter](http://docs.dbatools.io/Get-DbaPfDataCollectorCounter)  
[Get-DbaPfDataCollectorCounterSample](http://docs.dbatools.io/Get-DbaPfDataCollectorCounterSample)  
[Get-DbaPfDataCollectorSet](http://docs.dbatools.io/Get-DbaPfDataCollectorSet)  
[Get-DbaPfDataCollectorSetTemplate](http://docs.dbatools.io/Get-DbaPfDataCollectorSetTemplate)  
[Import-DbaPfDataCollectorSetTemplate](http://docs.dbatools.io/Import-DbaPfDataCollectorSetTemplate)  
[Invoke-DbaPfRelog](http://docs.dbatools.io/Invoke-DbaPfRelog)  
[Remove-DbaPfDataCollectorSet](http://docs.dbatools.io/Remove-DbaPfDataCollectorSet)  
[Remove-DbaPfDataCollectorCounter](http://docs.dbatools.io/Remove-DbaPfDataCollectorCounter)  
[Start-DbaPfDataCollectorSet](http://docs.dbatools.io/Start-DbaPfDataCollectorSet)  
[Stop-DbaPfDataCollectorSet](http://docs.dbatools.io/Stop-DbaPfDataCollectorSet)

### Availability Groups

[Add-DbaAgDatabase](http://docs.dbatools.io/Add-DbaAgDatabase)  
[Add-DbaAgListener](http://docs.dbatools.io/Add-DbaAgListener)  
[Add-DbaAgReplica](http://docs.dbatools.io/Add-DbaAgReplica)  
[Disable-DbaAgHadr](http://docs.dbatools.io/Disable-DbaAgHadr)  
[Enable-DbaAgHadr](http://docs.dbatools.io/Enable-DbaAgHadr)  
[Get-DbaAgBackupHistory](http://docs.dbatools.io/Get-DbaAgBackupHistory)  
[Get-DbaAgDatabase](http://docs.dbatools.io/Get-DbaAgDatabase)  
[Get-DbaAgHadr](http://docs.dbatools.io/Get-DbaAgHadr)  
[Get-DbaAgListener](http://docs.dbatools.io/Get-DbaAgListener)  
[Get-DbaAgReplica](http://docs.dbatools.io/Get-DbaAgReplica)  
[Get-DbaAvailabilityGroup](http://docs.dbatools.io/Get-DbaAvailabilityGroup)  
[Grant-DbaAgPermission](http://docs.dbatools.io/Grant-DbaAgPermission)  
[Invoke-DbaAgFailover](http://docs.dbatools.io/Invoke-DbaAgFailover)  
[Join-DbaAvailabilityGroup](http://docs.dbatools.io/Join-DbaAvailabilityGroup)  
[New-DbaAvailabilityGroup](http://docs.dbatools.io/New-DbaAvailabilityGroup)  
[Remove-DbaAgDatabase](http://docs.dbatools.io/Remove-DbaAgDatabase)  
[Remove-DbaAgListener](http://docs.dbatools.io/Remove-DbaAgListener)  
[Remove-DbaAgReplica](http://docs.dbatools.io/Remove-DbaAgReplica)  
[Remove-DbaAvailabilityGroup](http://docs.dbatools.io/Remove-DbaAvailabilityGroup)  
[Resume-DbaAgDbDataMovement](http://docs.dbatools.io/Resume-DbaAgDbDataMovement)  
[Revoke-DbaAgPermission](http://docs.dbatools.io/Revoke-DbaAgPermission)  
[Set-DbaAgListener](http://docs.dbatools.io/Set-DbaAgListener)  
[Set-DbaAgReplica](http://docs.dbatools.io/Set-DbaAgReplica)  
[Set-DbaAvailabilityGroup](http://docs.dbatools.io/Set-DbaAvailabilityGroup)  
[Suspend-DbaAgDbDataMovement](http://docs.dbatools.io/Suspend-DbaAgDbDataMovement)  
[Sync-DbaAvailabilityGroup](http://docs.dbatools.io/Sync-DbaAvailabilityGroup)  
[Test-DbaAvailabilityGroup](http://docs.dbatools.io/Test-DbaAvailabilityGroup)

### Windows Server Failover Cluster

[Get-DbaWsfcAvailableDisk](http://docs.dbatools.io/Get-DbaWsfcAvailableDisk)  
[Get-DbaWsfcCluster](http://docs.dbatools.io/Get-DbaWsfcCluster)  
[Get-DbaWsfcDisk](http://docs.dbatools.io/Get-DbaWsfcDisk)  
[Get-DbaWsfcNetwork](http://docs.dbatools.io/Get-DbaWsfcNetwork)  
[Get-DbaWsfcNetworkInterface](http://docs.dbatools.io/Get-DbaWsfcNetworkInterface)  
[Get-DbaWsfcNode](http://docs.dbatools.io/Get-DbaWsfcNode)  
[Get-DbaWsfcResource](http://docs.dbatools.io/Get-DbaWsfcResource)  
[Get-DbaWsfcResourceType](http://docs.dbatools.io/Get-DbaWsfcResourceType)  
[Get-DbaWsfcRole](http://docs.dbatools.io/Get-DbaWsfcRole)  
[Get-DbaWsfcSharedVolume](http://docs.dbatools.io/Get-DbaWsfcSharedVolume)

### Mirroring

[Add-DbaDbMirrorMonitor](http://docs.dbatools.io/Add-DbaDbMirrorMonitor)  
[Get-DbaDbMirror](http://docs.dbatools.io/Get-DbaDbMirror)  
[Get-DbaDbMirrorMonitor](http://docs.dbatools.io/Get-DbaDbMirrorMonitor)  
[Invoke-DbaDbMirrorFailover](http://docs.dbatools.io/Invoke-DbaDbMirrorFailover)  
[Invoke-DbaDbMirroring](http://docs.dbatools.io/Invoke-DbaDbMirroring)  
[Remove-DbaDbMirror](http://docs.dbatools.io/Remove-DbaDbMirror)  
[Remove-DbaDbMirror](http://docs.dbatools.io/Remove-DbaDbMirror)  
[Remove-DbaDbMirrorMonitor](http://docs.dbatools.io/Remove-DbaDbMirrorMonitor)  
[Repair-DbaDbMirror](http://docs.dbatools.io/Repair-DbaDbMirror)  
[Set-DbaDbMirror](http://docs.dbatools.io/Set-DbaDbMirror)

### tempdb

[Get-DbaTempdbUsage](http://docs.dbatools.io/Get-DbaTempdbUsage)  
[Set-DbaTempdbConfig](http://docs.dbatools.io/Set-DbaTempDbConfig)  
[Test-DbaTempdbConfig](http://docs.dbatools.io/Test-DbaTempDbConfig)

### Data Masking

[Invoke-DbaDbDataMasking](http://docs.dbatools.io/Invoke-DbaDbDataMasking)  
[Invoke-DbaDbPiiScan](http://docs.dbatools.io/Invoke-DbaDbPiiScan)  
[New-DbaDbMaskingConfig](http://docs.dbatools.io/New-DbaDbMaskingConfig)  
[Test-DbaDbDataMaskingConfig](http://docs.dbatools.io/Test-DbaDbDataMaskingConfig)

### Certificates and Encryption

[Copy-DbaDbCertificate](http://docs.dbatools.io/Copy-DbaDbCertificate)  
[Disable-DbaDbEncryption](http://docs.dbatools.io/Disable-DbaDbEncryption)  
[Enable-DbaDbEncryption](http://docs.dbatools.io/Enable-DbaDbEncryption)  
[Get-DbaDbEncryptionKey](http://docs.dbatools.io/Get-DbaDbEncryptionKey)  
[New-DbaDbEncryptionKey](http://docs.dbatools.io/New-DbaDbEncryptionKey)  
[Remove-DbaDbEncryptionKey](http://docs.dbatools.io/Remove-DbaDbEncryptionKey)  
[Start-DbaDbEncryption](http://docs.dbatools.io/Start-DbaDbEncryption)  
[Stop-DbaDbEncryption](http://docs.dbatools.io/Stop-DbaDbEncryption)  
[Test-DbaBackupEncrypted](http://docs.dbatools.io/Test-DbaBackupEncrypted)

### Log Shipping

[Get-DbaDbLogShipError](http://docs.dbatools.io/Get-DbaDbLogShipError)  
[Invoke-DbaDbLogShipping](http://docs.dbatools.io/Invoke-DbaDbLogShipping)  
[Invoke-DbaDbLogShipRecovery](http://docs.dbatools.io/Invoke-DbaDbLogShipRecovery)  
[Remove-DbaDbLogShipping](http://docs.dbatools.io/Remove-DbaDbLogShipping)  
[Test-DbaDbLogShipStatus](http://docs.dbatools.io/Test-DbaDbLogShipStatus)

### Databases

[Get-DbaDatabase](http://docs.dbatools.io/Get-DbaDatabase)  
[Get-DbaDbAssembly](http://docs.dbatools.io/Get-DbaDbAssembly)  
[Get-DbaDbCertificate](http://docs.dbatools.io/Get-DbaDbCertificate)  
[Get-DbaDbCheckConstraint](http://docs.dbatools.io/Get-DbaDbCheckConstraint)  
[Get-DbaDbCompatibility](http://docs.dbatools.io/Get-DbaDbCompatibility)  
[Get-DbaDbFeatureUsage](http://docs.dbatools.io/Get-DbaDbFeatureUsage)  
[Get-DbaDbIdentity](http://docs.dbatools.io/Get-DbaDbIdentity)  
[Get-DbaDbMemoryUsage](http://docs.dbatools.io/Get-DbaDbMemoryUsage)  
[Get-DbaDbMirrorMonitor](http://docs.dbatools.io/Get-DbaDbMirrorMonitor)  
[Get-DbaDbObjectTrigger](http://docs.dbatools.io/Get-DbaDbObjectTrigger)  
[Get-DbaDbPageInfo](http://docs.dbatools.io/Get-DbaDbPageInfo)  
[Get-DbaDbPartitionFunction](http://docs.dbatools.io/Get-DbaDbPartitionFunction)  
[Get-DbaDbPartitionScheme](http://docs.dbatools.io/Get-DbaDbPartitionScheme)  
[Get-DbaDbQueryStoreOption](http://docs.dbatools.io/Get-DbaDbQueryStoreOption)  
[Get-DbaDbSchema](http://docs.dbatools.io/Get-DbaDbSchema)  
[Get-DbaDbSharePoint](http://docs.dbatools.io/Get-DbaDbSharePoint)  
[Get-DbaDbSpace](http://docs.dbatools.io/Get-DbaDbSpace)  
[Get-DbaDbState](http://docs.dbatools.io/Get-DbaDbState)  
[Get-DbaDbStoredProcedure](http://docs.dbatools.io/Get-DbaDbStoredProcedure)  
[Get-DbaDbSynonym](http://docs.dbatools.io/Get-DbaDbSynonym)  
[Get-DbaDbTable](http://docs.dbatools.io/Get-DbaDbTable)  
[Get-DbaDbTrigger](http://docs.dbatools.io/Get-DbaDbTrigger)  
[Get-DbaDbUdf](http://docs.dbatools.io/Get-DbaDbUdf)  
[Get-DbaDbUserDefinedTableType](http://docs.dbatools.io/Get-DbaDbUserDefinedTableType)  
[Get-DbaDbView](http://docs.dbatools.io/Get-DbaDbView)  
[Get-DbaHelpIndex](http://docs.dbatools.io/Get-DbaHelpIndex)  
[Get-DbaSuspectPage](http://docs.dbatools.io/Get-DbaSuspectPage)  
[Invoke-DbaDbClone](http://docs.dbatools.io/Invoke-DbaDbClone)  
[Invoke-DbaDbShrink](http://docs.dbatools.io/Invoke-DbaDbShrink)  
[Invoke-DbaDbUpgrade](http://docs.dbatools.io/Invoke-DbaDbUpgrade)  
[New-DbaDatabase](http://docs.dbatools.io/New-DbaDatabase)  
[New-DbaDbSchema](http://docs.dbatools.io/New-DbaDbSchema)  
[New-DbaDbSynonym](http://docs.dbatools.io/New-DbaDbSynonym)  
[Remove-DbaDatabase](http://docs.dbatools.io/Remove-DbaDatabase)  
[Remove-DbaDatabaseSafely](http://docs.dbatools.io/Remove-DbaDatabaseSafely)  
[Remove-DbaDbSchema](http://docs.dbatools.io/Remove-DbaDbSchema)  
[Remove-DbaDbSynonym](http://docs.dbatools.io/Remove-DbaDbSynonym)  
[Remove-DbaDbTable](http://docs.dbatools.io/Remove-DbaDbTable)  
[Remove-DbaDbUdf](http://docs.dbatools.io/Remove-DbaDbUdf)  
[Remove-DbaDbView](http://docs.dbatools.io/Remove-DbaDbView)  
[Rename-DbaDatabase](http://docs.dbatools.io/Rename-DbaDatabase)  
[Set-DbaDbCompatibility](http://docs.dbatools.io/Set-DbaDbCompatibility)  
[Set-DbaDbIdentity](http://docs.dbatools.io/Set-DbaDbIdentity)  
[Set-DbaDbOwner](http://docs.dbatools.io/Set-DbaDbOwner)  
[Set-DbaDbQueryStoreOption](http://docs.dbatools.io/Set-DbaDbQueryStoreOption)  
[Set-DbaDbRecoveryModel](http://docs.dbatools.io/Set-DbaDbRecoveryModel)  
[Set-DbaDbSchema](http://docs.dbatools.io/Set-DbaDbSchema)  
[Set-DbaDbState](http://docs.dbatools.io/Set-DbaDbState)  
[Show-DbaDbList](http://docs.dbatools.io/Show-DbaDbList)  
[Test-DbaConnectionAuthScheme](http://docs.dbatools.io/Test-DbaConnectionAuthScheme)  
[Test-DbaDbCollation](http://docs.dbatools.io/Test-DbaDbCollation)  
[Test-DbaDbCompatibility](http://docs.dbatools.io/Test-DbaDbCompatibility)  
[Test-DbaDbOwner](http://docs.dbatools.io/Test-DbaDbOwner)  
[Test-DbaDbQueryStore](http://docs.dbatools.io/Test-DbaDbQueryStore)  
[Test-DbaOptimizeForAdHoc](http://docs.dbatools.io/Test-DbaOptimizeForAdHoc)

### Login and User Management

[Add-DbaDbRoleMember](http://docs.dbatools.io/Add-DbaDbRoleMember)  
[Add-DbaServerRoleMember](http://docs.dbatools.io/Add-DbaServerRoleMember)  
[Get-DbaDbOrphanUser](http://docs.dbatools.io/Get-DbaDbOrphanUser)  
[Get-DbaDbRole](http://docs.dbatools.io/Get-DbaDbRole)  
[Get-DbaDbRoleMember](http://docs.dbatools.io/Get-DbaDbRoleMember)  
[Get-DbaDbUser](http://docs.dbatools.io/Get-DbaDbUser)  
[Get-DbaLogin](http://docs.dbatools.io/Get-DbaLogin)  
[Get-DbaServerRole](http://docs.dbatools.io/Get-DbaServerRole)  
[Get-DbaServerRoleMember](http://docs.dbatools.io/Get-DbaServerRoleMember)  
[New-DbaDbRole](http://docs.dbatools.io/New-DbaDbRole)  
[New-DbaDbUser](http://docs.dbatools.io/New-DbaDbUser)  
[New-DbaLogin](http://docs.dbatools.io/New-DbaLogin)  
[New-DbaServerRole](http://docs.dbatools.io/New-DbaServerRole)  
[Remove-DbaDbOrphanUser](http://docs.dbatools.io/Remove-DbaDbOrphanUser)  
[Remove-DbaDbRole](http://docs.dbatools.io/Remove-DbaDbRole)  
[Remove-DbaDbRoleMember](http://docs.dbatools.io/Remove-DbaDbRoleMember)  
[Remove-DbaDbUser](http://docs.dbatools.io/Remove-DbaDbUser)  
[Remove-DbaLogin](http://docs.dbatools.io/Remove-DbaLogin)  
[Remove-DbaServerRole](http://docs.dbatools.io/Remove-DbaServerRole)  
[Remove-DbaServerRoleMember](http://docs.dbatools.io/Remove-DbaServerRoleMember)  
[Rename-DbaLogin](http://docs.dbatools.io/Rename-DbaLogin)  
[Repair-DbaDbOrphanUser](http://docs.dbatools.io/Repair-DbaDbOrphanUser)  
[Set-DbaLogin](http://docs.dbatools.io/Set-DbaLogin)  
[Sync-DbaLoginPermission](http://docs.dbatools.io/Sync-DbaLoginPermission)  
[Test-DbaLoginPassword](http://docs.dbatools.io/Test-DbaLoginPassword)  
[Test-DbaWindowsLogin](http://docs.dbatools.io/Test-DbaWindowsLogin)  
[Watch-DbaDbLogin](http://docs.dbatools.io/Watch-DbaDbLogin)

### Security and Encryption

[Add-DbaComputerCertificate](http://docs.dbatools.io/Add-DbaComputerCertificate)  
[Disable-DbaForceNetworkEncryption](http://docs.dbatools.io/Disable-DbaForceNetworkEncryption)  
[Disable-DbaHideInstance](http://docs.dbatools.io/Disable-DbaHideInstance)  
[Enable-DbaForceNetworkEncryption](http://docs.dbatools.io/Enable-DbaForceNetworkEncryption)  
[Enable-DbaHideInstance](http://docs.dbatools.io/Enable-DbaHideInstance)  
[Get-DbaComputerCertificate](http://docs.dbatools.io/Get-DbaComputerCertificate)  
[Get-DbaCredential](http://docs.dbatools.io/Get-DbaCredential)  
[Get-DbaDbAsymmetricKey](http://docs.dbatools.io/Get-DbaDbAsymmetricKey)  
[Get-DbaDbEncryption](http://docs.dbatools.io/Get-DbaDbEncryption)  
[Get-DbaDbMasterKey](http://docs.dbatools.io/Get-DbaDbMasterKey)  
[Get-DbaExtendedProtection](http://docs.dbatools.io/Get-DbaExtendedProtection)  
[Get-DbaForceNetworkEncryption](http://docs.dbatools.io/Get-DbaForceNetworkEncryption)  
[Get-DbaHideInstance](http://docs.dbatools.io/Get-DbaHideInstance)  
[Get-DbaInstanceAudit](http://docs.dbatools.io/Get-DbaInstanceAudit)  
[Get-DbaInstanceAuditSpecification](http://docs.dbatools.io/Get-DbaInstanceAuditSpecification)  
[Get-DbaNetworkCertificate](http://docs.dbatools.io/Get-DbaNetworkCertificate)  
[Get-DbaPermission](http://docs.dbatools.io/Get-DbaPermission)  
[Get-DbaPrivilege](http://docs.dbatools.io/Get-DbaPrivilege)  
[Get-DbaUserPermission](http://docs.dbatools.io/Get-DbaUserPermission)  
[New-DbaComputerCertificate](http://docs.dbatools.io/New-DbaComputerCertificate)  
[New-DbaComputerCertificateSigningRequest](http://docs.dbatools.io/New-DbaComputerCertificateSigningRequest)  
[New-DbaCredential](http://docs.dbatools.io/New-DbaCredential)  
[New-DbaDbAsymmetricKey](http://docs.dbatools.io/New-DbaDbAsymmetricKey)  
[New-DbaDbCertificate](http://docs.dbatools.io/New-DbaDbCertificate)  
[New-DbaDbMasterKey](http://docs.dbatools.io/New-DbaDbMasterKey)  
[New-DbaServiceMasterKey](http://docs.dbatools.io/New-DbaServiceMasterKey)  
[Read-DbaAuditFile](http://docs.dbatools.io/Read-DbaAuditFile)  
[Remove-DbaComputerCertificate](http://docs.dbatools.io/Remove-DbaComputerCertificate)  
[Remove-DbaCredential](http://docs.dbatools.io/Remove-DbaCredential)  
[Remove-DbaDbAsymmetricKey](http://docs.dbatools.io/Remove-DbaDbAsymmetricKey)  
[Remove-DbaDbCertificate](http://docs.dbatools.io/Remove-DbaDbCertificate)  
[Remove-DbaDbMasterKey](http://docs.dbatools.io/Remove-DbaDbMasterKey)  
[Remove-DbaNetworkCertificate](http://docs.dbatools.io/Remove-DbaNetworkCertificate)  
[Set-DbaExtendedProtection](http://docs.dbatools.io/Set-DbaExtendedProtection)  
[Set-DbaNetworkCertificate](http://docs.dbatools.io/Set-DbaNetworkCertificate)  
[Set-DbaPrivilege](http://docs.dbatools.io/Set-DbaPrivilege)  
[Test-DbaComputerCertificateExpiration](http://docs.dbatools.io/Test-DbaComputerCertificateExpiration)  

### Export

[Export-DbaCredential](http://docs.dbatools.io/Export-DbaCredential)  
[Export-DbaDacPackage](http://docs.dbatools.io/Export-DbaDacPackage)  
[Export-DbaDbRole](http://docs.dbatools.io/Export-DbaDbRole)  
[Export-DbaDbTableData](http://docs.dbatools.io/Export-DbaDbTableData)  
[Export-DbaInstance](http://docs.dbatools.io/Export-DbaInstance)  
[Export-DbaLinkedServer](http://docs.dbatools.io/Export-DbaLinkedServer)  
[Export-DbaLogin](http://docs.dbatools.io/Export-DbaLogin)  
[Export-DbaRegServer](http://docs.dbatools.io/Export-DbaRegServer)  
[Export-DbaRepServerSetting](http://docs.dbatools.io/Export-DbaRepServerSetting)  
[Export-DbaScript](http://docs.dbatools.io/Export-DbaScript)  
[Export-DbaServerRole](http://docs.dbatools.io/Export-DbaServerRole)  
[Export-DbaSpConfigure](http://docs.dbatools.io/Export-DbaSpConfigure)  
[Export-DbaSysDbUserObject](http://docs.dbatools.io/Export-DbaSysDbUserObject)  
[Export-DbaUser](http://docs.dbatools.io/Export-DbaUser)  

### Detach and Attach

[Dismount-DbaDatabase](http://docs.dbatools.io/Dismount-DbaDatabase)  
[Get-DbaDbDetachedFileInfo](http://docs.dbatools.io/Get-DbaDbDetachedFileInfo)  
[Mount-DbaDatabase](http://docs.dbatools.io/Mount-DbaDatabase)  

### SQL Agent

[Get-DbaAgentAlert](http://docs.dbatools.io/Get-DbaAgentAlert)  
[Get-DbaAgentAlertCategory](http://docs.dbatools.io/Get-DbaAgentAlertCategory)  
[Get-DbaAgentJob](http://docs.dbatools.io/Get-DbaAgentJob)  
[Get-DbaAgentJobCategory](http://docs.dbatools.io/Get-DbaAgentJobCategory)  
[Get-DbaAgentJobHistory](http://docs.dbatools.io/Get-DbaAgentJobHistory)  
[Get-DbaAgentJobOutputFile](http://docs.dbatools.io/Get-DbaAgentJobOutputFile)  
[Get-DbaAgentJobStep](http://docs.dbatools.io/Get-DbaAgentJobStep)  
[Get-DbaAgentLog](http://docs.dbatools.io/Get-DbaAgentLog)  
[Get-DbaAgentOperator](http://docs.dbatools.io/Get-DbaAgentOperator)  
[Get-DbaAgentProxy](http://docs.dbatools.io/Get-DbaAgentProxy)  
[Get-DbaAgentSchedule](http://docs.dbatools.io/Get-DbaAgentSchedule)  
[Get-DbaAgentServer](http://docs.dbatools.io/Get-DbaAgentServer)  
[Get-DbaRunningJob](http://docs.dbatools.io/Get-DbaRunningJob)  
[New-DbaAgentAlertCategory](http://docs.dbatools.io/New-DbaAgentAlertCategory)  
[New-DbaAgentJob](http://docs.dbatools.io/New-DbaAgentJob)  
[New-DbaAgentJobCategory](http://docs.dbatools.io/New-DbaAgentJobCategory)  
[New-DbaAgentJobStep](http://docs.dbatools.io/New-DbaAgentJobStep)  
[New-DbaAgentOperator](http://docs.dbatools.io/New-DbaAgentOperator)  
[New-DbaAgentProxy](http://docs.dbatools.io/New-DbaAgentProxy)  
[New-DbaAgentSchedule](http://docs.dbatools.io/New-DbaAgentSchedule)  
[Remove-DbaAgentAlert](http://docs.dbatools.io/Remove-DbaAgentAlert)  
[Remove-DbaAgentAlertCategory](http://docs.dbatools.io/Remove-DbaAgentAlertCategory)  
[Remove-DbaAgentJob](http://docs.dbatools.io/Remove-DbaAgentJob)  
[Remove-DbaAgentJobCategory](http://docs.dbatools.io/Remove-DbaAgentJobCategory)  
[Remove-DbaAgentJobStep](http://docs.dbatools.io/Remove-DbaAgentJobStep)  
[Remove-DbaAgentOperator](http://docs.dbatools.io/Remove-DbaAgentOperator)  
[Remove-DbaAgentProxy](http://docs.dbatools.io/Remove-DbaAgentProxy)  
[Remove-DbaAgentSchedule](http://docs.dbatools.io/Remove-DbaAgentSchedule)  
[Set-DbaAgentAlert](http://docs.dbatools.io/Set-DbaAgentAlert)  
[Set-DbaAgentJob](http://docs.dbatools.io/Set-DbaAgentJob)  
[Set-DbaAgentJobCategory](http://docs.dbatools.io/Set-DbaAgentJobCategory)  
[Set-DbaAgentJobOutputFile](http://docs.dbatools.io/Set-DbaAgentJobOutputFile)  
[Set-DbaAgentJobOwner](http://docs.dbatools.io/Set-DbaAgentJobOwner)  
[Set-DbaAgentJobStep](http://docs.dbatools.io/Set-DbaAgentJobStep)  
[Set-DbaAgentOperator](http://docs.dbatools.io/Set-DbaAgentOperator)  
[Set-DbaAgentSchedule](http://docs.dbatools.io/Set-DbaAgentSchedule)  
[Set-DbaAgentServer](http://docs.dbatools.io/Set-DbaAgentServer)  
[Start-DbaAgentJob](http://docs.dbatools.io/Start-DbaAgentJob)  
[Stop-DbaAgentJob](http://docs.dbatools.io/Stop-DbaAgentJob)  
[Test-DbaAgentJobOwner](http://docs.dbatools.io/Test-DbaAgentJobOwner)

### Mail and Logging

[Get-DbaDbMail](http://docs.dbatools.io/Get-DbaDbMail)  
[Get-DbaDbMailAccount](http://docs.dbatools.io/Get-DbaDbMailAccount)  
[Get-DbaDbMailConfig](http://docs.dbatools.io/Get-DbaDbMailConfig)  
[Get-DbaDbMailHistory](http://docs.dbatools.io/Get-DbaDbMailHistory)  
[Get-DbaDbMailLog](http://docs.dbatools.io/Get-DbaDbMailLog)  
[Get-DbaDbMailProfile](http://docs.dbatools.io/Get-DbaDbMailProfile)  
[Get-DbaDbMailServer](http://docs.dbatools.io/Get-DbaDbMailServer)  
[Get-DbaErrorLog](http://docs.dbatools.io/Get-DbaErrorLog)  
[Get-DbaErrorLogConfig](http://docs.dbatools.io/Get-DbaErrorLogConfig)  
[Get-DbaWindowsLog](http://docs.dbatools.io/Get-DbaWindowsLog)  
[Invoke-DbaCycleErrorLog](http://docs.dbatools.io/Invoke-DbaCycleErrorLog)  
[New-DbaDbMailAccount](http://docs.dbatools.io/New-DbaDbMailAccount)  
[New-DbaDbMailProfile](http://docs.dbatools.io/New-DbaDbMailProfile)  
[Remove-DbaDbMailAccount](http://docs.dbatools.io/Remove-DbaDbMailAccount)  
[Remove-DbaDbMailProfile](http://docs.dbatools.io/Remove-DbaDbMailProfile)  
[Set-DbaErrorLogConfig](http://docs.dbatools.io/Set-DbaErrorLogConfig)

### Table Data

[ConvertTo-DbaDataTable](http://docs.dbatools.io/ConvertTo-DbaDataTable)  
[Copy-DbaDbTableData](http://docs.dbatools.io/Copy-DbaDbTableData)  
[Copy-DbaDbViewData](http://docs.dbatools.io/Copy-DbaDbViewData)  
[Get-DbaDbCompression](http://docs.dbatools.io/Get-DbaDbCompression)  
[Get-DbaDbForeignKey](http://docs.dbatools.io/Get-DbaDbForeignKey)  
[Get-DbaDbSequence](http://docs.dbatools.io/Get-DbaDbSequence)  
[New-DbaDbSequence](http://docs.dbatools.io/New-DbaDbSequence)  
[New-DbaDbTable](http://docs.dbatools.io/New-DbaDbTable)  
[Remove-DbaDbData](http://docs.dbatools.io/Remove-DbaDbData)  
[Remove-DbaDbSequence](http://docs.dbatools.io/Remove-DbaDbSequence)  
[Remove-DbaDbTableData](http://docs.dbatools.io/Remove-DbaDbTableData)  
[Select-DbaDbSequenceNextValue](http://docs.dbatools.io/Select-DbaDbSequenceNextValue)  
[Set-DbaDbCompression](http://docs.dbatools.io/Set-DbaDbCompression)  
[Set-DbaDbSequence](http://docs.dbatools.io/Set-DbaDbSequence)  
[Test-DbaDbCompression](http://docs.dbatools.io/Test-DbaDbCompression)  
[Test-DbaIdentityUsage](http://docs.dbatools.io/Test-DbaIdentityUsage)  
[Write-DbaDbTableData](http://docs.dbatools.io/Write-DbaDbTableData)

### Server Management

[Get-DbaAvailableCollation](http://docs.dbatools.io/Get-DbaAvailableCollation)  
[Get-DbaClientProtocol](http://docs.dbatools.io/Get-DbaClientProtocol)  
[Get-DbaComputerSystem](http://docs.dbatools.io/Get-DbaComputerSystem)  
[Get-DbaInstanceProtocol](http://docs.dbatools.io/Get-DbaInstanceProtocol)  
[Get-DbaLocaleSetting](http://docs.dbatools.io/Get-DbaLocaleSetting)  
[Get-DbaMemoryUsage](http://docs.dbatools.io/Get-DbaMemoryUsage)  
[Get-DbaOperatingSystem](http://docs.dbatools.io/Get-DbaOperatingSystem)  
[Get-DbaPageFileSetting](http://docs.dbatools.io/Get-DbaPageFileSetting)  
[Get-DbaRegistryRoot](http://docs.dbatools.io/Get-DbaRegistryRoot)  

### Endpoints

[Get-DbaEndpoint](http://docs.dbatools.io/Get-DbaEndpoint)  
[New-DbaEndpoint](http://docs.dbatools.io/New-DbaEndpoint)  
[Remove-DbaEndpoint](http://docs.dbatools.io/Remove-DbaEndpoint)  
[Set-DbaEndpoint](http://docs.dbatools.io/Set-DbaEndpoint)  
[Start-DbaEndpoint](http://docs.dbatools.io/Start-DbaEndpoint)  
[Stop-DbaEndpoint](http://docs.dbatools.io/Stop-DbaEndpoint)  
[Test-DbaEndpoint](http://docs.dbatools.io/Test-DbaEndpoint)  

### Snapshots

[Get-DbaDbSnapshot](http://docs.dbatools.io/Get-DbaDbSnapshot)  
[New-DbaDbSnapshot](http://docs.dbatools.io/New-DbaDbSnapshot)  
[Remove-DbaDbSnapshot](http://docs.dbatools.io/Remove-DbaDbSnapshot)  
[Restore-DbaDbSnapshot](http://docs.dbatools.io/Restore-DbaDbSnapshot)  

### File System and Storage

[Expand-DbaDbLogFile](http://docs.dbatools.io/Expand-DbaDbLogFile)  
[Get-DbaDbFile](http://docs.dbatools.io/Get-DbaDbFile)  
[Get-DbaDbFileGroup](http://docs.dbatools.io/Get-DbaDbFileGroup)  
[Get-DbaDbFileGrowth](http://docs.dbatools.io/Get-DbaDbFileGrowth)  
[Get-DbaDbFileMapping](http://docs.dbatools.io/Get-DbaDbFileMapping)  
[Get-DbaDbLogSpace](http://docs.dbatools.io/Get-DbaDbLogSpace)  
[Get-DbaDefaultPath](http://docs.dbatools.io/Get-DbaDefaultPath)  
[Get-DbaDiskSpace](http://docs.dbatools.io/Get-DbaDiskSpace)  
[Get-DbaFile](http://docs.dbatools.io/Get-DbaFile)  
[Move-DbaDbFile](http://docs.dbatools.io/Move-DbaDbFile)  
[New-DbaDbFileGroup](http://docs.dbatools.io/New-DbaDbFileGroup)  
[New-DbaDirectory](http://docs.dbatools.io/New-DbaDirectory)  
[Remove-DbaDbFileGroup](http://docs.dbatools.io/Remove-DbaDbFileGroup)  
[Set-DbaDbFileGroup](http://docs.dbatools.io/Set-DbaDbFileGroup)  
[Set-DbaDbFileGrowth](http://docs.dbatools.io/Set-DbaDbFileGrowth)  
[Set-DbaDefaultPath](http://docs.dbatools.io/Set-DbaDefaultPath)  
[Show-DbaInstanceFileSystem](http://docs.dbatools.io/Show-DbaInstanceFileSystem)  
[Test-DbaDiskAlignment](http://docs.dbatools.io/Test-DbaDiskAlignment)  
[Test-DbaDiskAllocation](http://docs.dbatools.io/Test-DbaDiskAllocation)  
[Test-DbaPath](http://docs.dbatools.io/Test-DbaPath)  

### Services

[Get-DbaService](http://docs.dbatools.io/Get-DbaService)  
[Get-DbaDbServiceBrokerService](http://docs.dbatools.io/Get-DbaDbServiceBrokerService)  
[Restart-DbaService](http://docs.dbatools.io/Restart-DbaService)  
[Start-DbaService](http://docs.dbatools.io/Start-DbaService)  
[Stop-DbaService](http://docs.dbatools.io/Stop-DbaService)  
[Update-DbaServiceAccount](http://docs.dbatools.io/Update-DbaServiceAccount)  

### Deployment

[Get-DbaInstalledPatch](http://docs.dbatools.io/Get-DbaInstalledPatch)  
[Get-DbaKbUpdate](http://docs.dbatools.io/Get-DbaKbUpdate)  
[Install-DbaInstance](http://docs.dbatools.io/Install-DbaInstance)  
[Invoke-DbaAdvancedInstall](http://docs.dbatools.io/Invoke-DbaAdvancedInstall)  
[Invoke-DbaAdvancedUpdate](http://docs.dbatools.io/Invoke-DbaAdvancedUpdate)  
[New-DbaDacOption](http://docs.dbatools.io/New-DbaDacOption)  
[New-DbaDacProfile](http://docs.dbatools.io/New-DbaDacProfile)  
[Publish-DbaDacPackage](http://docs.dbatools.io/Publish-DbaDacPackage)  
[Save-DbaKbUpdate](http://docs.dbatools.io/Save-DbaKbUpdate)  
[Update-DbaInstance](http://docs.dbatools.io/Update-DbaInstance)  

### Data Generation

[Get-DbaRandomizedDataset](http://docs.dbatools.io/Get-DbaRandomizedDataset)  
[Get-DbaRandomizedDatasetTemplate](http://docs.dbatools.io/Get-DbaRandomizedDatasetTemplate)  
[Get-DbaRandomizedType](http://docs.dbatools.io/Get-DbaRandomizedType)  
[Get-DbaRandomizedValue](http://docs.dbatools.io/Get-DbaRandomizedValue)  
[Invoke-DbaDbDataGenerator](http://docs.dbatools.io/Invoke-DbaDbDataGenerator)  
[New-DbaDbDataGeneratorConfig](http://docs.dbatools.io/New-DbaDbDataGeneratorConfig)  
[Test-DbaDbDataGeneratorConfig](http://docs.dbatools.io/Test-DbaDbDataGeneratorConfig)  

### Utilities

[ConvertTo-DbaTimeline](http://docs.dbatools.io/ConvertTo-DbaTimeline)  
[Get-DbaBuild](http://docs.dbatools.io/Get-DbaBuild)  
[Get-DbaDependency](http://docs.dbatools.io/Get-DbaDependency)  
[Get-DbaInstanceInstallDate](http://docs.dbatools.io/Get-DbaInstanceInstallDate)  
[Get-DbaLastGoodCheckDb](http://docs.dbatools.io/Get-DbaLastGoodCheckDb)  
[Get-DbaPowerPlan](http://docs.dbatools.io/Get-DbaPowerPlan)  
[Get-DbaProductKey](http://docs.dbatools.io/Get-DbaProductKey)  
[Get-DbaSchemaChangeHistory](http://docs.dbatools.io/Get-DbaSchemaChangeHistory)  
[Get-DbaUptime](http://docs.dbatools.io/Get-DbaUptime)  
[Import-DbaCsv](http://docs.dbatools.io/Import-DbaCsv)  
[Invoke-DbaBalanceDataFiles](http://docs.dbatools.io/Invoke-DbaBalanceDataFiles)  
[Invoke-DbaDbDecryptObject](http://docs.dbatools.io/Invoke-DbaDbDecryptObject)  
[Invoke-DbaQuery](http://docs.dbatools.io/Invoke-DbaQuery)  
[New-DbaSqlParameter](http://docs.dbatools.io/New-DbaSqlParameter)  
[Join-DbaPath](http://docs.dbatools.io/Join-DbaPath)  
[Read-DbaTransactionLog](http://docs.dbatools.io/Read-DbaTransactionLog)  
[Repair-DbaInstanceName](http://docs.dbatools.io/Repair-DbaInstanceName)  
[Reset-DbaAdmin](http://docs.dbatools.io/Reset-DbaAdmin)  
[Resolve-DbaPath](http://docs.dbatools.io/Resolve-DbaPath)  
[Select-DbaObject](http://docs.dbatools.io/Select-DbaObject)  
[Set-DbaMaxDop](http://docs.dbatools.io/Set-DbaMaxDop)  
[Set-DbaPowerPlan](http://docs.dbatools.io/Set-DbaPowerPlan)  
[Test-DbaBuild](http://docs.dbatools.io/Test-DbaBuild)  
[Test-DbaInstanceName](http://docs.dbatools.io/Test-DbaInstanceName)  
[Test-DbaMaxDop](http://docs.dbatools.io/Test-DbaMaxDop)  
[Test-DbaPowerPlan](http://docs.dbatools.io/Test-DbaPowerPlan)  
[Update-DbaBuildReference](http://docs.dbatools.io/Update-DbaBuildReference)  

### Connections

[Connect-DbaInstance](http://docs.dbatools.io/Connect-DbaInstance)  
[Disconnect-DbaInstance](http://docs.dbatools.io/Disconnect-DbaInstance)  
[Get-DbaConnectedInstance](http://docs.dbatools.io/Get-DbaConnectedInstance)  
[Get-DbaConnection](http://docs.dbatools.io/Get-DbaConnection)  
[Test-DbaConnection](http://docs.dbatools.io/Test-DbaConnection)  

### Connection Strings

[New-DbaAzAccessToken](http://docs.dbatools.io/New-DbaAzAccessToken)  
[New-DbaConnectionString](http://docs.dbatools.io/New-DbaConnectionString)  
[New-DbaConnectionStringBuilder](http://docs.dbatools.io/New-DbaConnectionStringBuilder)  

### Network and Firewall

[Get-DbaFirewallRule](http://docs.dbatools.io/Get-DbaFirewallRule)  
[Get-DbaNetworkActivity](http://docs.dbatools.io/Get-DbaNetworkActivity)  
[Get-DbaNetworkConfiguration](http://docs.dbatools.io/Get-DbaNetworkConfiguration)  
[Get-DbaTcpPort](http://docs.dbatools.io/Get-DbaTcpPort)  
[New-DbaFirewallRule](http://docs.dbatools.io/New-DbaFirewallRule)  
[Remove-DbaFirewallRule](http://docs.dbatools.io/Remove-DbaFirewallRule)  
[Resolve-DbaNetworkName](http://docs.dbatools.io/Resolve-DbaNetworkName)  
[Set-DbaNetworkConfiguration](http://docs.dbatools.io/Set-DbaNetworkConfiguration)  
[Set-DbaTcpPort](http://docs.dbatools.io/Set-DbaTcpPort)  
[Test-DbaNetworkLatency](http://docs.dbatools.io/Test-DbaNetworkLatency)  

### Service Principal Names (SPNs)

[Get-DbaSpn](http://docs.dbatools.io/Get-DbaSpn)  
[Remove-DbaSpn](http://docs.dbatools.io/Remove-DbaSpn)  
[Set-DbaSpn](http://docs.dbatools.io/Set-DbaSpn)  
[Test-DbaSpn](http://docs.dbatools.io/Test-DbaSpn)

### SQL Client Configuration

[Get-DbaClientAlias](http://docs.dbatools.io/Get-DbaClientAlias)  
[New-DbaClientAlias](http://docs.dbatools.io/New-DbaClientAlias)  
[Remove-DbaClientAlias](http://docs.dbatools.io/Remove-DbaClientAlias)

### Policy-Based Management

[Get-DbaPbmCategory](http://docs.dbatools.io/Get-DbaPbmCategory)  
[Get-DbaPbmCategorySubscription](http://docs.dbatools.io/Get-DbaPbmCategorySubscription)  
[Get-DbaPbmCondition](http://docs.dbatools.io/Get-DbaPbmCondition)  
[Get-DbaPbmObjectSet](http://docs.dbatools.io/Get-DbaPbmObjectSet)  
[Get-DbaPbmPolicy](http://docs.dbatools.io/Get-DbaPbmPolicy)  
[Get-DbaPbmStore](http://docs.dbatools.io/Get-DbaPbmStore)

### General

[Add-DbaExtendedProperty](http://docs.dbatools.io/Add-DbaExtendedProperty)  
[Get-DbaBackupDevice](http://docs.dbatools.io/Get-DbaBackupDevice)  
[Get-DbaCustomError](http://docs.dbatools.io/Get-DbaCustomError)  
[Get-DbaDeprecatedFeature](http://docs.dbatools.io/Get-DbaDeprecatedFeature)  
[Get-DbaExtendedProperty](http://docs.dbatools.io/Get-DbaExtendedProperty)  
[Get-DbaFeature](http://docs.dbatools.io/Get-DbaFeature)  
[Get-DbaInstanceProperty](http://docs.dbatools.io/Get-DbaInstanceProperty)  
[Get-DbaInstanceTrigger](http://docs.dbatools.io/Get-DbaInstanceTrigger)  
[Get-DbaInstanceUserOption](http://docs.dbatools.io/Get-DbaInstanceUserOption)  
[Get-DbaMemoryCondition](http://docs.dbatools.io/Get-DbaMemoryCondition)  
[Get-DbaModule](http://docs.dbatools.io/Get-DbaModule)  
[Get-DbaMsdtc](http://docs.dbatools.io/Get-DbaMsdtc)  
[Get-DbaOleDbProvider](http://docs.dbatools.io/Get-DbaOleDbProvider)  
[Get-DbaSsisExecutionHistory](http://docs.dbatools.io/Get-DbaSsisExecutionHistory)  
[Invoke-DbaDbTransfer](http://docs.dbatools.io/Invoke-DbaDbTransfer)  
[New-DbaCustomError](http://docs.dbatools.io/New-DbaCustomError)  
[New-DbaDbTransfer](http://docs.dbatools.io/New-DbaDbTransfer)  
[New-DbaScriptingOption](http://docs.dbatools.io/New-DbaScriptingOption)  
[Remove-DbaCustomError](http://docs.dbatools.io/Remove-DbaCustomError)  
[Remove-DbaExtendedProperty](http://docs.dbatools.io/Remove-DbaExtendedProperty)  
[Set-DbaExtendedProperty](http://docs.dbatools.io/Set-DbaExtendedProperty)  
[Test-DbaDeprecatedFeature](http://docs.dbatools.io/Test-DbaDeprecatedFeature)

### FileStream

[Disable-DbaFilestream](http://docs.dbatools.io/Disable-DbaFilestream)  
[Enable-DbaFilestream](http://docs.dbatools.io/Enable-DbaFilestream)  
[Get-DbaFileStream](http://docs.dbatools.io/Get-DbaFileStream)

### Linked Servers

[Get-DbaLinkedServer](http://docs.dbatools.io/Get-DbaLinkedServer)  
[Get-DbaLinkedServerLogin](http://docs.dbatools.io/Get-DbaLinkedServerLogin)  
[New-DbaLinkedServerLogin](http://docs.dbatools.io/New-DbaLinkedServerLogin)  
[Remove-DbaLinkedServer](http://docs.dbatools.io/Remove-DbaLinkedServer)  
[Remove-DbaLinkedServerLogin](http://docs.dbatools.io/Remove-DbaLinkedServerLogin)  
[Test-DbaLinkedServerConnection](http://docs.dbatools.io/Test-DbaLinkedServerConnection)  

### Lookup (Find)

[Find-DbaAgentJob](http://docs.dbatools.io/Find-DbaAgentJob)  
[Find-DbaBackup](http://docs.dbatools.io/Find-DbaBackup)  
[Find-DbaDatabase](http://docs.dbatools.io/Find-DbaDatabase)  
[Find-DbaDbDisabledIndex](http://docs.dbatools.io/Find-DbaDbDisabledIndex)  
[Find-DbaDbDuplicateIndex](http://docs.dbatools.io/Find-DbaDbDuplicateIndex)  
[Find-DbaDbGrowthEvent](http://docs.dbatools.io/Find-DbaDbGrowthEvent)  
[Find-DbaDbUnusedIndex](http://docs.dbatools.io/Find-DbaDbUnusedIndex)  
[Find-DbaInstance](http://docs.dbatools.io/Find-DbaInstance)  
[Find-DbaLoginInGroup](http://docs.dbatools.io/Find-DbaLoginInGroup)  
[Find-DbaOrphanedFile](http://docs.dbatools.io/Find-DbaOrphanedFile)  
[Find-DbaSimilarTable](http://docs.dbatools.io/Find-DbaSimilarTable)  
[Find-DbaStoredProcedure](http://docs.dbatools.io/Find-DbaStoredProcedure)  
[Find-DbaTrigger](http://docs.dbatools.io/Find-DbaTrigger)  
[Find-DbaUserObject](http://docs.dbatools.io/Find-DbaUserObject)  
[Find-DbaView](http://docs.dbatools.io/Find-DbaView)

### SQL Management Objects

[Get-DbaManagementObject](http://docs.dbatools.io/Get-DbaManagementObject)  
[Test-DbaManagementObject](http://docs.dbatools.io/Test-DbaManagementObject)

### sp\_configure

[Export-DbaSpConfigure](http://docs.dbatools.io/Export-DbaSpConfigure)  
[Get-DbaSpConfigure](http://docs.dbatools.io/Get-DbaSpConfigure)  
[Import-DbaSpConfigure](http://docs.dbatools.io/Import-DbaSpConfigure)  
[Set-DbaSpConfigure](http://docs.dbatools.io/Set-DbaSpConfigure)

### System startup

[Disable-DbaStartupProcedure](http://docs.dbatools.io/Disable-DbaStartupProcedure)  
[Enable-DbaStartupProcedure](http://docs.dbatools.io/Enable-DbaStartupProcedure)  
[Get-DbaStartupParameter](http://docs.dbatools.io/Get-DbaStartupParameter)  
[Get-DbaStartupProcedure](http://docs.dbatools.io/Get-DbaStartupProcedure)  
[Set-DbaStartupParameter](http://docs.dbatools.io/Set-DbaStartupParameter)

### Max Memory

[Get-DbaMaxMemory](http://docs.dbatools.io/Get-DbaMaxMemory)  
[Set-DbaMaxMemory](http://docs.dbatools.io/Set-DbaMaxMemory)  
[Test-DbaMaxMemory](http://docs.dbatools.io/Test-DbaMaxMemory)  

### Replication

[Export-DbaRepServerSetting](http://docs.dbatools.io/Export-DbaRepServerSetting)  
[Get-DbaRepDistributor](http://docs.dbatools.io/Get-DbaRepDistributor)  
[Get-DbaRepPublication](http://docs.dbatools.io/Get-DbaRepPublication)  
[Get-DbaRepServer](http://docs.dbatools.io/Get-DbaRepServer)  
[Test-DbaRepLatency](http://docs.dbatools.io/Test-DbaRepLatency)

### Registered Servers

[Add-DbaRegServer](http://docs.dbatools.io/Add-DbaRegServer)  
[Add-DbaRegServerGroup](http://docs.dbatools.io/Add-DbaRegServerGroup)  
[Export-DbaRegServer](http://docs.dbatools.io/Export-DbaRegServer)  
[Get-DbaRegServer](http://docs.dbatools.io/Get-DbaRegServer)  
[Get-DbaRegServerGroup](http://docs.dbatools.io/Get-DbaRegServerGroup)  
[Get-DbaRegServerStore](http://docs.dbatools.io/Get-DbaRegServerStore)  
[Import-DbaRegServer](http://docs.dbatools.io/Import-DbaRegServer)  
[Move-DbaRegServer](http://docs.dbatools.io/Move-DbaRegServer)  
[Move-DbaRegServerGroup](http://docs.dbatools.io/Move-DbaRegServerGroup)  
[Remove-DbaRegServer](http://docs.dbatools.io/Remove-DbaRegServer)  
[Remove-DbaRegServerGroup](http://docs.dbatools.io/Remove-DbaRegServerGroup)

### Community Tools

[Export-DbaDiagnosticQuery](http://docs.dbatools.io/Export-DbaDiagnosticQuery)  
[Get-DbaMaintenanceSolutionLog](http://docs.dbatools.io/Get-DbaMaintenanceSolutionLog)  
[Install-DbaDarlingData](http://docs.dbatools.io/Install-DbaDarlingData)  
[Install-DbaFirstResponderKit](http://docs.dbatools.io/Install-DbaFirstResponderKit)  
[Install-DbaMaintenanceSolution](http://docs.dbatools.io/Install-DbaMaintenanceSolution)  
[Install-DbaMultiTool](http://docs.dbatools.io/Install-DbaMultiTool)  
[Install-DbaSqlWatch](http://docs.dbatools.io/Install-DbaSqlWatch)  
[Install-DbaWhoIsActive](http://docs.dbatools.io/Install-DbaWhoIsActive)  
[Invoke-DbaDiagnosticQuery](http://docs.dbatools.io/Invoke-DbaDiagnosticQuery)  
[Invoke-DbaWhoisActive](http://docs.dbatools.io/Invoke-DbaWhoisActive)  
[New-DbaDiagnosticAdsNotebook](http://docs.dbatools.io/New-DbaDiagnosticAdsNotebook)  
[Save-DbaCommunitySoftware](http://docs.dbatools.io/Save-DbaCommunitySoftware)  
[Save-DbaDiagnosticQueryScript](http://docs.dbatools.io/Save-DbaDiagnosticQueryScript)  
[Uninstall-DbaSqlWatch](http://docs.dbatools.io/Uninstall-DbaSqlWatch)  
[Update-DbaMaintenanceSolution](http://docs.dbatools.io/Update-DbaMaintenanceSolution)

### dbatools Computer Management

[Get-DbaCmConnection](http://docs.dbatools.io/Get-DbaCmConnection)  
[Get-DbaCmObject](http://docs.dbatools.io/Get-DbaCmObject)  
[New-DbaCmConnection](http://docs.dbatools.io/New-DbaCmConnection)  
[Remove-DbaCmConnection](http://docs.dbatools.io/Remove-DbaCmConnection)  
[Set-DbaCmConnection](http://docs.dbatools.io/Set-DbaCmConnection)  
[Test-DbaCmConnection](http://docs.dbatools.io/Test-DbaCmConnection)

### dbatools Support tools

[Export-DbatoolsConfig](http://docs.dbatools.io/Export-DbatoolsConfig)  
[Find-DbaCommand](http://docs.dbatools.io/Find-DbaCommand)  
[Get-DbatoolsChangeLog](http://docs.dbatools.io/Get-DbatoolsChangeLog)  
[Get-DbatoolsConfig](http://docs.dbatools.io/Get-DbatoolsConfig)  
[Get-DbatoolsConfigValue](http://docs.dbatools.io/Get-DbatoolsConfigValue)  
[Get-DbatoolsError](http://docs.dbatools.io/Get-DbatoolsError)  
[Get-DbatoolsLog](http://docs.dbatools.io/Get-DbatoolsLog)  
[Get-DbatoolsPath](http://docs.dbatools.io/Get-DbatoolsPath)  
[Import-DbatoolsConfig](http://docs.dbatools.io/Import-DbatoolsConfig)  
[Invoke-DbatoolsFormatter](http://docs.dbatools.io/Invoke-DbatoolsFormatter)  
[Invoke-DbatoolsRenameHelper](http://docs.dbatools.io/Invoke-DbatoolsRenameHelper)  
[Measure-DbatoolsImport](http://docs.dbatools.io/Measure-DbatoolsImport)  
[New-DbatoolsSupportPackage](http://docs.dbatools.io/New-DbatoolsSupportPackage)  
[Register-DbatoolsConfig](http://docs.dbatools.io/Register-DbatoolsConfig)  
[Reset-DbatoolsConfig](http://docs.dbatools.io/Reset-DbatoolsConfig)  
[Set-DbatoolsConfig](http://docs.dbatools.io/Set-DbatoolsConfig)  
[Set-DbatoolsPath](http://docs.dbatools.io/Set-DbatoolsPath)  
[Unregister-DbatoolsConfig](http://docs.dbatools.io/Unregister-DbatoolsConfig)  
[Update-Dbatools](http://docs.dbatools.io/Update-Dbatools)

### dbatools update watcher

[Install-DbatoolsWatchUpdate](http://docs.dbatools.io/Install-DbatoolsWatchUpdate)  
[Uninstall-DbatoolsWatchUpdate](http://docs.dbatools.io/Uninstall-DbatoolsWatchUpdate)  
[Watch-DbatoolsUpdate](http://docs.dbatools.io/Watch-DbatoolsUpdate)

***

## Appendix: Links and References

- [[2022-08-26]]
- [[03 - AREAS/Technology/Programming/Command Line/Shell/PowerShell/PowerShell]]
- [[PowerShell Modules]]
- [[Development]]
- [[3-Resources/Tools/Developer Tools/Data Stack/Databases/_README|Databases]]
- [[SQL]]
- [[SQL Server]]
- [[Microsoft]]
- [[Windows Terminal]]
- [[CLI Tools List]]

***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | 2022

***

## Appendix: Links and References

*Note created on [[<% tp.file.creation_date("YYYY-MM-DD") %>]] and last modified on [[<% tp.file.last_modified_date("YYYY-MM-DD") %>]].*

### Internal Linked Notes

### External References

#### Backlinks

```dataview
list from [[<% tp.file.title %>]] AND -"CHANGELOG" AND -"<% tp.file.folder(true) %>/<% tp.file.title %>"
```


***

Jimmy Briggs <jimmy.briggs@jimbrig.com> | <% tp.date.now("YYYY") %>