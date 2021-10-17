#NoEnv
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
SetTimer, 5minRestart, 300000

#IfWinActive ahk_class grcWindow

;Sets a 0.05 second delay between keystrokes and a 0.05 delay during key press.
SetKeyDelay, 50, 50

;Eat 2 EgoChaser when in a mission
F1::
Send, m{down}{down}{enter}{down}{down}{enter}{down}{enter}{enter}m
return

;Equip Heavy Armor when in a mission
F2::
Send, m{down}{down}{enter}{down}{enter}{up}{up}{up}{enter}m
return

;Eat 2 EgoChaser when CEO/MC
F3::
Send, m{down}{down}{down}{enter}{down}{down}{enter}{down}{enter}{enter}m
return

;Equip Heavy Armor when CEO/MC
F4::
Send, m{down}{down}{down}{enter}{down}{enter}{up}{up}{up}{enter}m
return
;When using mavrick cheat
;To Teleport
F5::
Send, d{down}{down}{down}{enter}{up}{up}{up}{up}{up}{up}{enter}
;To Spawn a car
F6::
Send, d{down}{down}{enter}{down}{enter}{enter}{down}{down}{down}{enter}{up}{up}{up}{up}{up}{up}{enter}

;Make a solo public lobby (Resource Monitor trick- game freezes for 10 secs)
F9::
Process_Suspend("GTA5.exe")
;MsgBox, GTA5.exe suspended
Process_Suspend(Name){
    PID := (InStr(Name,".")) ? ProcExist(Name) : Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtSuspendProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}
Sleep, 10000
Process_Resume("GTA5.exe")
;MsgBox, GTA5.exe resumed
Process_Resume(Name){
    PID := (InStr(Name,".")) ? ProcExist(Name) : Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtResumeProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}
ProcExist(Name=""){
    Process, Exist, % (Name="") ? DllCall("GetCurrentProcessID") : Name
    Return Errorlevel
}
return

5minRestart: 
Reload
return

#IfWinActive