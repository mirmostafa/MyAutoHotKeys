﻿#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

RegRead, OutputVar, HKEY_CLASSES_ROOT, http\shell\open\command 
StringReplace, OutputVar, OutputVar," 
SplitPath, OutputVar,,OutDir,,OutNameNoExt, OutDrive 

; Am I active?
^#a:: MsgBox, , Mohammad Mirmostafa HotKey Manager, Hi. I'm active, 5

; Custom Multimedia buttons
^#NumpadAdd:: Send {Volume_Up} ;ctrl+shift + numpad plus
^#NumpadSub:: Send {Volume_Down} ;ctrl+shift + numpad minus
^#NumpadMult:: Send {Volume_Mute} ;ctrl+shift + numpad multiple
^#NumpadDiv:: Send {Media_Play_Pause} ;ctrl+shift + numpad divide

; New Keep note 📝
^#n:: Run, chrome.exe, keep.new
; Google highlighted text
^#g:: 
    { 
        BlockInput, on 
        prevClipboard = %clipboard% 
        clipboard = 
        Send, ^c 
        BlockInput, off 
        ClipWait, 2 
        if ErrorLevel = 0 
        { 
            searchQuery=%clipboard% 
            StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
            Loop 
            { 
                noExtraSpaces=1 
                StringLeft, leftMost, searchQuery, 1 
                IfInString, leftMost, %A_Space% 
                { 
                    StringTrimLeft, searchQuery, searchQuery, 1 
                    noExtraSpaces=0 
                } 
                StringRight, rightMost, searchQuery, 1 
                IfInString, rightMost, %A_Space% 
                { 
                    StringTrimRight, searchQuery, searchQuery, 1 
                    noExtraSpaces=0 
                } 
                If (noExtraSpaces=1) 
                    break 
            } 
            StringReplace, searchQuery, searchQuery, \, `%5C, All 
            StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
            StringReplace, searchQuery, searchQuery, `%, `%25, All 
            IfInString, searchQuery, . 
            { 
                IfInString, searchQuery, + 
                    Run, http://www.google.com/search?q=%searchQuery% 
                else 
                    Run, %searchQuery% 
            } 
            else 
                Run, http://www.google.com/search?q=%searchQuery% 
            return
        } 
        clipboard = %prevClipboard% 
        return 
    } 


; Translate highlighted text
^#t:: 
    { 
        BlockInput, on 
        prevClipboard = %clipboard% 
        clipboard = 
        Send, ^c 
        BlockInput, off 
        ClipWait, 2 
        if ErrorLevel = 0 
        { 
            searchQuery=%clipboard% 
            StringReplace, searchQuery, searchQuery, `r`n, %A_Space%, All 
            Loop 
            { 
                noExtraSpaces=1 
                StringLeft, leftMost, searchQuery, 1 
                IfInString, leftMost, %A_Space% 
                { 
                    StringTrimLeft, searchQuery, searchQuery, 1 
                    noExtraSpaces=0 
                } 
                StringRight, rightMost, searchQuery, 1 
                IfInString, rightMost, %A_Space% 
                { 
                    StringTrimRight, searchQuery, searchQuery, 1 
                    noExtraSpaces=0 
                } 
                If (noExtraSpaces=1) 
                    break 
            } 
            StringReplace, searchQuery, searchQuery, \, `%5C, All 
            StringReplace, searchQuery, searchQuery, %A_Space%, +, All 
            StringReplace, searchQuery, searchQuery, `%, `%25, All 
            IfInString, searchQuery, . 
            { 
                IfInString, searchQuery, + 
                    Run, https://translate.google.com/?sl=auto&tl=fa&text=%searchQuery%&op=translate 
                else 
                    Run, %searchQuery% 
            } 
            else 
                Run, https://translate.google.com/?sl=auto&tl=fa&text=%searchQuery%&op=translate
            return
        } 
        clipboard = %prevClipboard% 
        return 
    }