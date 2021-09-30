; Minecraft Reset Script (RANDOM SEED version)
; Author:   onvo
; Edited by SLTRR, DesktopFolder, Peej, and others
; To use this script, make sure you have autohotkey installed (autohotkey.com), then right click on the script file, and click "Run Script."
; If you make any changes to the script by right clicking and clicking "Edit Script," make sure to reload the script by right clicking on the logo in your taskbar and clicking "Reload Script."

; Script Function / Help:
;  The following only apply inside the Minecraft window:
;   1) When on the title screen, the "PgUp" key will create a world.
;   2) After loading in the world, "PgUp" will exit the world and then auto create another world.
;   3) "PgDn" will do the same thing as "PgUp," but it will also delete the 6th most recent world.
;   4) To just exit the world and not create another world, press "Home" on keyboard.
;   5) To change the "PgDn" and "PgUp" and "Home", scroll down to the bottom of this script, change the character before the double colon "::", and reload the script.
;      https://www.autohotkey.com/docs/KeyList.htm Here are a list of the keys you can use.
;   6) If you want to change the difficulty, scroll down to the Options and you can change those.
;   7) If you are in a minecraft world and inside a menu or inventory, close that menu/inventory before activating the script (otherwise, the macro may not function properly).
;      The macro that creates a new world only works from the title screen or from a previous world (unpaused and not in an inventory).
;   8) There have been a lot of verification problems of the world list screen not appearing because of the lag it takes to show that screen when you have a lot of worlds, even with a long key delay.
;      This script has a feature that can counter that problem by waiting for the title screen to go away and for the world list screen to appear before proceeding with the keypresses.

; Troubleshooting:
;   There can sometimes be an issue with DirectX and the PixelSearch command. This can sometimes cause two problems:
;	1) When resetting from a previous world, the program won't register the title screen, so it will never create a new world.
;          Unfortunately, there currently isn't a workaround, so you'll just have to first go to title screen by pressing "Home," and then you can press "PgUp" or "PgDn" to create a new world.
;	2) This also messes up the WaitForWorldList function, so if you're having an issue with that, you unfortunately won't be able to use that feature.
;	   Scroll down to the Options section and change the worldListWait variable to 0 to disable that feature.
;	   If you disable this feature, make sure that your key delay is long enough to show the world list screen even with the lag that tends to happen.
;   These issues tend to happen more frequently for fullscreen users.

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
