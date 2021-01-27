#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

^Numpad0::
    if WinActive("ahk_exe devenv.exe") {
        Send, ^k^e
        Send, ^e^d
        return
    }

    if WinActive("ahk_exe Code.exe") {
        Send, !+f
        return
    }