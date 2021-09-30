; My RSG Script
; Author:   onvo
; Edited by SLTRR, DesktopFolder, Peej, and others
; Edited by Relacibo

#NoEnv
SetWorkingDir %A_ScriptDir%

; Options:
global difficulty := "Easy" ; Set difficulty here. Options: "Peaceful" "Easy" "Normal" "Hard" "Hardcore"
global keyDelay := 70 ; Change this value to increase/decrease delay between key presses. For your run to be verifiable, each of the three screens of world creation must be shown.
		      ; An input delay of 70 ms is recommended to ensure this. To remove delay, set this value to 0. Warning: Doing so will likely make your runs unverifiable.
			  
global state := "Undefined"

withKeyDelay() {
  SetKeyDelay %keyDelay%
}

noKeyDelay() {
  SetKeyDelay 0
}

lowKeyDelay() {
  SetKeyDelay 1
}

CreateNewWorld()
{
Send, `t
Send, {enter}
Sleep, 100
Send, `t
Send, `t
Send, `t
Send, {enter}
Send, `t
Send, {enter}
Send, {enter}
Send, `t
Send, `t
Send, `t
Send, `t
Send, `t
Send, `t
Send, {enter}
state := "Scout"
}

RecreateLastWorld()
{
Send, `t
Send, {enter}
Sleep, 100
Send, `t
Send, `t
Send, `t
Send, `t
Send, `t
Send, `t
Send, {enter}
Sleep, 50
Send, `t
Send, {enter}
Send, `t
Send, {enter}
Send, {enter}
Send, {enter}
Send, `t
Send, {enter}
Send, `t
Send, `t
Send, `t
Send, `t
Send, {enter}
state := "Route"
}

withKeyDelay()

ExitWorld()
{
   send {Esc}+{Tab}{Enter} 
   Send, !{Numpad3}
}

#IfWinActive, Minecraft ; Ensure Minecraft is the active window.
{
PgUp:: ; This is where the keybind for creating an RSG world is set.
	CreateNewWorld()
return

PgDn:: ; This is where the keybind for creating an RSG world and deleting the 6th most recent one is set.
	RecreateLastWorld()
return

Home::
   ExitWorld()
   state := "Undefined"
return
}

*y::
lowKeyDelay()
Send {LShift down}{F3 down}{f down}
withKeyDelay()
return

*y Up::
noKeyDelay()
Send {f up}{F3 up}{LShift up}
withKeyDelay()
return

*x::
noKeyDelay()
Send {F3 down}{f down}
withKeyDelay()
return

*x Up::
noKeyDelay()
Send {f up}{F3 up}
withKeyDelay()
return

*g::
noKeyDelay()
Send {F3 down}g{F3 up}
withKeyDelay()
return

*b::
noKeyDelay()
Send {F3 down}b{F3 up}
withKeyDelay()
return

*v::F3

*c::F5
	
F6::
	if (state == "Scout") {
		Send, t
		SetKeyDelay , 0
		Send, /locate buried_treasure
		SetKeyDelay , %keyDelay%
		Sleep, 100
		Send, {Enter}
	}
	return

F7::
	if (state == "Scout") {
		Send, t
		SetKeyDelay , 0
		Send, /locate shipwreck
		SetKeyDelay , %keyDelay%
		Sleep, 100
		Send, {Enter}
	}
	return
	
F8::
if (state == "Scout") {
	Send, t
	SetKeyDelay , 0
	Send, /locate ruined_portal
	SetKeyDelay , %keyDelay%
	Sleep, 100
	Send, {Enter}
}
return

F9::
	if (state == "Scout") {
		Send, t
		SetKeyDelay , 0
		Send, /locate bastion_remnant
		SetKeyDelay , %keyDelay%
		Sleep, 100
		Send, {Enter}
	}
	return

F10::
	if (state == "Scout") {
		Send, t
		SetKeyDelay , 0
		Send, /locate fortress
		SetKeyDelay , %keyDelay%
		Sleep, 100
		Send, {Enter}
	}
	return

F12::
	if (state == "Scout") {
		Send, t
		SetKeyDelay , 0
		Send, /locate stronghold
		SetKeyDelay , %keyDelay%
		Sleep, 100
		Send, {Enter}
	}
	return

m::
	if (state == "Scout") {
		Send, t
		SetKeyDelay , 0
		Send, /setblock ~ ~ ~ nether_portal
		SetKeyDelay , %keyDelay%
		Sleep, 100
		Send, {Enter}
	}
	return

+F6::
	state := "Scout"
	return

+F7::
	state := "Route"
	return
