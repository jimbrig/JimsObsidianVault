' This script backs up the Windows Services startup configuration to Batch & REG files.

Option Explicit

Dim objShell : Set objShell = CreateObject("Shell.Application")
Dim WshShell, objFSO, objFile, sNow, iSvcType, iStartupType, iSvcCnt, iPerUserSvcCnt
Dim sREGFile, sBATFile, r, b, objWMIService, colListOfServices, objService, sSvcKey
Dim sStartState, sSvcName, sSkippedSvc

Set WshShell = CreateObject("Wscript.Shell")
Set objFSO = Wscript.CreateObject("Scripting.FilesystemObject")
Set objFile = objFSO.GetFile(WScript.ScriptFullName)

' Set files names for REG and Batch files
sNow = FormatDateTime(Now, 2)
sREGFile = objFSO.GetParentFolderName(objFile) & "\svc_curr_state_" & sNow & ".reg"
sBATFile = objFSO.GetParentFolderName(objFile) & "\svc_curr_state_" & sNow & ".bat"
sSvcKey = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\"

Set r = objFSO.CreateTextFile(sREGFile, True)
r.WriteLine "Windows Registry Editor Version 5.00"
r.WriteBlankLines 1
r.WriteLine ";Services Startup Configuration Backup " & Now
r.WriteBlankLines 1

Set b = objFSO.CreateTextFile(sBATFile, True)
b.WriteLine "@echo Restore Service Startup State saved at " & Now

' Get the WMI Service object
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
' Get the list of services
Set colListOfServices = objWMIService.ExecQuery("Select * from Win32_Service")
