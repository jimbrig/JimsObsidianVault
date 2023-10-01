Attribute VB_NAME = "modGlobals"

Option Explicit

Private Const MODULE_NAME As String = "modGlobals"

Public Enum eConfigFileType
    cfgTXT = 0
    cfgYAML = 1
    cfgJSON = 2
    cfgINI = 3
    cfgCSV = 4
    cfgXLSX = 5
    cfgOTHER = 99
End Enum

Public Const PROJECT_NAME As String = "MyProject"
Public Const APP_NAME As String = "MyApp"
Public Const APP_VERSION As String = "0.1.0"
Public Const CONFIG_FILE_PATH As String = "\"
Public Const CONFIG_FILE_NAME As String = "config.yml"
Public Const CONFIG_FILE_TYPE As eConfigFileType = cfgYAML
