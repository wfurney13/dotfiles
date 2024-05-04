;Disable LWin press and retain its combos
~LWin::vk07

;Alt+F - Maximize or restore window
!F::
  WinGet,WinState,MinMax,A
  Switch WinState
  {
    Case -1:
    ; code here for window is minimized
    WinMaximize,A

    Case 1:
    ; code here for window is maximized
    WinRestore,A

    Case 0:
    ; code here for window is neither minimized nor maximized
    WinMaximize,A
  }
return

;Alt+M - Minimize the active window
!M:: WinMinimize,A
return

;Alt+Ctrl+S - Sleep the machine
!^S::DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)

;Alt+Shift+Space - Always on top window
!+SPACE::Winset, Alwaysontop, , A 
Return

;Alt+Shift+Q - Close the window
!+Q::WinClose A
Return

;Alt+Shift+R - Reload the script
!+R::reload

;Alt+Left send ctrl+shift+tab
!Left::
IfWinActive, ahk_exe librewolf.exe
{
    SendInput ^+{Tab}
}
Return

;Alt+Right send ctrl+tab
!Right::
IfWinActive, ahk_exe librewolf.exe
{
    Send ^{Tab}
}
Return


;break keybind
Home::Send, {Break}

; Alt + Enter : Starts terminal
!Enter::Run, S:\bin\Alacritty-v0.13.2-portable.exe
return

; Alt+ R : Start browser
!r::
Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\LibreWolf\librewolf.lnk
return

^!=:: ;Ctrl + Alt + = : Hide taskbar
If WinExist("ahk_class Shell_TrayWnd")
{
	WinHide, ahk_class Shell_TrayWnd
	WinHide, ahk_class Shell_SecondaryTrayWnd
}
Else
{
	WinShow, ahk_class Shell_TrayWnd
	WinShow, ahk_class Shell_SecondaryTrayWnd
}

