Attribute VB_NAME = "modStartUp"

Option Explicit

Private Const MODULE_NAME As String = "modStartUp"

Public Function AppInitialize() As Boolean

    Const PROC_NAME As String = "AppInitialize"

    Dim UserName As String
    Dim Response As String

    On Error GoTo ErrorHandler

    Terminate

    Application.DisplayFullScreen = True
    Application.DisplayStatusBar = True
    Application.StatusBar = "Initializing...Reading Configuration..."

    If Not ReadConfigFile Then Err.Raise HANDLED_ERROR

    Application.StatusBar = "Connecting to Database..."

    If Not modDatabase.ConnectToDatabase Then Err.Raise HANDLED_ERROR


End Function

Public Function ReadConfigFile() As Boolean

    Const PROC_NAME As String = "ReadConfigFile"

    Dim ConfigFile As String

    Dim DebugMode As String
    Dim DevMode As String
    Dim TestMode As String

    Dim EnablePrint As String
    Dim SendEmails As String

    Dim DatabasePath As String
    Dim DatabaseFileName As String

    On Error GoTo ErrorHandler

    ConfigFile = ThisWorkbook.Path & CONFIG_FILE_PATH & CONFIG_FILE_NAME

    If Dir(ConfigFile) = "" Then Err.Raise NO_CONFIG_FILE

    Open ConfigFile For Input As #CfgFile

    Line Input #CfgFile, DevMode
    Line Input #CfgFile, DebugMode
    Line Input #CfgFile, TestMode

    Line Input #CfgFile, DatabasePath
    Line Input #CfgFile, DatabaseFileName

    Line Input #CfgFile, EnablePrint
    Line Input #CfgFile, SendEmails

    Close #CfgFile

    DEBUG_MODE = CBool(DebugMode)
    TEST_MODE = CBool(TestMode)
    DEV_MODE = CBool(DevMode)

    If STOP_FLAG = True Then Stop
