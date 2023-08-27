If WScript.arguments.count > 0 Then
    Dim WshShell: Set WshShell = WScript.CreateObject("Wscript.Shell")
    strPath = "file:///" & Wscript.Arguments(0)
    strPath = Replace(strPath,"\","/")
    strPath = Replace(strPath," ","%20")
    sCmd = "%comspec% /c<nul (set/p anyvariable=" & Chr(34) & strPath & Chr(34) & ")|clip.exe"
    WshShell.Run sCmd,0,0
    Set WshShell = Nothing
End If
