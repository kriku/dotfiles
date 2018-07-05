Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run Chr(34) & "C:\Users\g.krikun\emacs\bin\emacs.exe" & Chr(34) & " " & Chr(34) & "--daemon" & Chr(34), 0
Set WinScriptHost = Nothing
