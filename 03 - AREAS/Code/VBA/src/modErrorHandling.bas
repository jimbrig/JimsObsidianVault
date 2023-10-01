Attribute VB_NAME = "modErrorHandling"

' --------------------------------------------------------------------------------
' Name         : modErrorHandling
' Kind         : Standard Module
' Purpose      : Error Handling
' Author       : Jimmy Briggs
' Date         : 2023-10-01
' --------------------------------------------------------------------------------

' --------------------------------------------------------------------------------
' OPTIONS
' --------------------------------------------------------------------------------
Option Explicit

' --------------------------------------------------------------------------------
' DECLARATIONS
' --------------------------------------------------------------------------------
Private Const MODULE_NAME As String = "modErrorHandling"

Dim AlreadyUsed As Boolean

' --------------------------------------------------------------------------------
' PROCEDURES & FUNCTIONS
' --------------------------------------------------------------------------------

' --------------------------------------------------------------------------------
' Procedure Name   : RaiseError
' Purpose          : Re-Raises an Error and Adds Line Number and Current
'                    Module + Procedure Name to the Error Message
' Procedure Kind   : Sub
' Procedure Access : Public
' Author           : Jimmy Briggs
' Date             : 2023-10-01
' Return Type      : None
' --------------------------------------------------------------------------------
Sub RaiseError( _
    ByVal ErrorNumber As Long, _
    ByVal Source As String, _
    ByVal Procedure As String, _
    ByVal Description As String _
)

    Dim Src As String

    If AlreadyUsed = False Then
        ' If Error Called for First Time then Add Line # and Module + Procedure Name
        Src = Source & "." & Procedure
        AlreadyUsed = True
    Else
        ' If Error Already Raised Simply Add on Procedure Name
        Src = Source & "." & Procedure & " -> " & MODULE_NAME & ".RaiseError"
    End If

    ' Pause Code Execution when Debugging
    ' Using Conditional Compilation Argument to Prevent from Running in Production: "Debug=1"
    #If Debug = 1 Then Debug.Assert False #End If

    ' Re-Raise Error so it can be Caught in the Caller's Procedure
    Err.Raise ErrorNumber, Src, Description

End Sub
