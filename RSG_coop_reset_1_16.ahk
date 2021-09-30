; My RSG coop Script
; Author:   onvo
; Edited by SLTRR, DesktopFolder, Peej, and others
; Edited by Relacibo

#NoEnv
SetWorkingDir %A_ScriptDir%

; Options:
global difficulty := "Easy" ; Set difficulty here. Options: "Peaceful" "Easy" "Normal" "Hard" "Hardcore"
global keyDelay := 70 ; Change this value to increase/decrease delay between key presses. For your run to be verifiable, each of the three screens of world creation must be shown.
		      ; An input delay of 70 ms is recommended to ensure this. To remove delay, set this value to 0. Warning: Doing so will likely make your runs unverifiable.
			  
withKeyDelay() {
  SetKeyDelay %keyDelay%
}

noKeyDelay() {
  SetKeyDelay 0
}

lowKeyDelay() {
  SetKeyDelay 1
}

WaitForWorldList(W, H)
{
   Sleep, 100
}

CreateWorld(W, H)
{
Send, `t
Send, {enter}
WaitForWorldList(W, H)
CreateNewWorld()
}

DeleteAndCreateWorld(W, H)
{
Send, `t
Send, {enter}
WaitForWorldList(W, H)
Send, `t
Send, {Down}
Send, {Down}
Send, {Down}
Send, {Down}
Send, {Down}
Send, `t
Send, `t
Send, `t
Send, `t
Send, {enter}
Send, `t
Send, {enter}
CreateNewWorld()
}

Publish()
{
Send, t
SendInput, /publish 5000
Sleep, 200
Send, {enter}
Send, t
SendInput, /time set 0
}

CreateNewWorld()
{
Send, `t
Send, `t
Send, `t
Send, {enter}
Send, `t
if (difficulty = "Hardcore")
{
  Send, {enter}
}
Send, `t
if ((difficulty != "Normal") && (difficulty != "Hardcore")) ; Hard, Peaceful, or Easy
{
  Send, {enter}
  if (difficulty != "Hard") ; Peaceful or Easy
  {
    Send, {enter}
    if (difficulty != "Peaceful") ; Easy
    {
      Send, {enter}
      if (difficulty != "Easy") ; invalid difficulty
      {
        MsgBox, Difficulty entered is invalid. Please check your spelling and enter a valid difficulty. Options are "Peaceful" "Easy" "Normal" "Hard" or "Hardcore"
	ExitApp
      }
    }
  }
}
if (difficulty != "Hardcore")
{
  Send, `t
  Send, {enter}
  Send, `t
}
Send, `t
Send, `t
Send, `t
Send, `t
Send, `t
Send, {enter}
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
   CreateWorld(W, H)
return

PgDn:: ; This is where the keybind for creating an RSG world and deleting the 6th most recent one is set.
   DeleteAndCreateWorld(W, H)
return

Home::
   ExitWorld()
return
}

F9::
   IfWinActive, Minecraft 
   {
      Sleep, 100
      Publish()
   }
   return

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

o:: 
   SetKeyDelay , 0
   Send, {Enter}
   Send, !{Numpad1}
   SetKeyDelay , %keyDelay%
   return
F4:: F8
F8:: F4
