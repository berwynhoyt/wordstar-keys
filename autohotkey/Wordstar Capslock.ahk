;Wordstar key map designed by Bruce Hoyt

; Makes CapsLock act like WordStar 'Ctrl', but leaves Ctrl alone
; Simply install Autohotkey, then double-click this file or
; put it in the windows startup folder to run on startup

#MaxHotkeysPerInterval 150  ; keyboard repeat can be bigger than this otherwise

; -------------------------------
; Define the window classes in the MS Office group to use the special MS Office key overrides down below
; -------------------------------
GroupAdd,MSWord,ahk_class OpusApp		; Word

GroupAdd,MSOffice,ahk_group MSWord
GroupAdd,MSOffice,ahk_class XLMAIN  		; Excel 2007

;GroupAdd,WordProcessors,- Google Docs - Google Chrome
GroupAdd,WordProcessors,ahk_group MSWord

GroupAdd,Eclipse,Eclipse SDK
Groupadd,Eclipse,Code Composer Studio

GroupAdd,Unix,ahk_class PuTTY			; putty
GroupAdd,Unix,NX ahk_class cygwin/xfree86 rl	; NX Nomachine

GroupAdd,kicad,Ahk_class wxWindowNR

; Chrome except Google Drive (i.e. Google Docs)
GroupAdd,Chrome,ahk_class Chrome_WidgetWin_1,,,Google Drive

; -------------------------------
; Setup
; -------------------------------
#SingleInstance force
SetCapsLockState,AlwaysOff
Menu, TRAY, Icon,%ProgramFiles%\AutoHotkey\AutoHotkey.exe,2,1
;#NoTrayIcon  ; don't want an icon in the tray
SetTitleMatchMode, 2  ; match anywhere in title


; Make shift-capslock act like the old capslock
;+CapsLock::
;  GetKeyState,caps,CapsLock,T
;  if caps = D
;    SetCapsLockState,AlwaysOff
;  else
;    SetCapsLockState,On
;return

; Also make RAlt act like the old capslock
RAlt::
  GetKeyState,caps,CapsLock,T
  if caps = D
    SetCapsLockState,AlwaysOff
  else
    SetCapsLockState,AlwaysOn
return


; -------------------------------
;Find-Windows that get auto-closed when you push <Enter>
; -------------------------------
GroupAdd,FindWindow,Find ahk_class bosa_sdm_Microsoft Office Word 12.0	; Word 2007 find window
GroupAdd,FindWindow,Find ahk_class #32770				; Notepad find window

#IfWinActive ahk_group FindWindow		; one of the find windows
$Enter::
  Send {Enter}{Esc}		                ; Escape out of find window
return



; -------------------------------
; NOTE: Put exceptions to wordstar keys under specific apps below, but above main wordstar settings at EOF
; -------------------------------


; -------------------------------
; For Google Chrome except Google Drive
; -------------------------------

#IfWinActive ahk_group Chrome
CapsLock & BS::
  Send ^+{Right}{Del}  ; Delete word right
  k1 =
  Marking =
return

; -------------------------------
; For SciTE
; -------------------------------

#ifWinActive SciTE

F3::^o

XButton1::Send ^{F3}
XButton2::Send ^+{F3}

CapsLock & w::
  Send ^{Up}
return

CapsLock & z::
  Send ^{Down}
return

!x::
  ; exit all windows
  Send ^w  ; Window close
return

!n::Send !n
!p::Send !p

^q::Send ^q

CapsLock & j::
  if A_PriorHotKey = CapsLock & q
    Send ^g
  else if k1
    {
    Send {F2}
    k1 =
    }
return

; Ctrl+h does backspace and ^k^h remove marking
CapsLock & m::
  if k1
    {
    Send ^{F2}
    k1 =
    }
return

CapsLock & d::
  if k1
    {
      Send ^c{Right}  ; Duplicate selection
      Marking =
    }
  else if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send +{End}  ; Extend selection end of line
    else
      Send {End}  ; End of line
    }
  else if Marking
    Send +{Right}  ; Extend selection right
  else
    Send {Right}  ; Char right
  k1 =
return

; -------------------------------
; For ?
; -------------------------------

#ifWinActive ahk_class PX_WINDOW_CLASS

F3::Send ^o


; -------------------------------
; For Xilinx
; -------------------------------
#IfWinActive Xilinx - ISE

; next edit window
!n::
  Send ^{Tab}
return


; -------------------------------
; For FE, just translate CapsLock to Ctrl
; -------------------------------
#IfWinActive Edit ahk_class ConsoleWindowClass
$*CapsLock::Send {LControl Down}
$*CapsLock Up::Send {LControl Up}


; -------------------------------
; Cmd.exe
; -------------------------------
#IfWinActive ahk_class ConsoleWindowClass

sendn(key, times) {
  Loop %times% {
    Send %key%
  }
}

; Scroll page up
+PgUp::
  sendn("{WheelUp}", 25)
return

; Scroll page down
+PgDn::
  sendn("{WheelDown}", 25)
return


; -------------------------------
; Notepad
; -------------------------------

#IfWinActive ahk_class Notepad
CapsLock & j::
  if A_PriorHotKey = CapsLock & q
    Send ^g
return


; -------------------------------
; OpenOffice.org key mapping
;
; Some key mappings must be defined in OOo
;  ^0  -> Default paragraph style
;  ^+0 -> Text body paragraph style
; -------------------------------

#IfWinActive ahk_class SALFRAME  ; OpenOffice.org

CapsLock & b::
  Send ^b{Esc}  ; Bold
  k1 =
  Marking =
return

!b::
  Send ^+0{Esc}  ; Text body style
  k1 =
  Marking =
return

; Ctrl+h does backspace and ^k^h remove marking
CapsLock & h::
  if k1
    {
    Marking =
    Send {Left}{Right}{Esc}	; Esc is for open office
    k1 =
    }
return

; Ctrl+k prefix
CapsLock & k::
  if Marking
    {
    if k1
      {
      Marking =
      Send {Esc}
      k1 =
      }
    else
      k1 = 1
    }
  else
    {
    if k1
      {
      Marking = 1
      Send {F8}
      k1 =
      }
    else
      k1 = 1
    }
return

CapsLock & l::
  Send ^+F  ; Repeat search
  k1 =
  Marking =
return

; Increment leading
!l::
; There is probably a faster way to do this
  Send {Esc}^+o
  MouseGetPos xcur, ycur
  MouseMove 66, 36, 0
  Sleep 10
  Click
  Send ^{Tab}
  MouseMove 64, 53, 0
  Click
  MouseMove 342, 239, 0
  Click
  Click
  MouseMove xcur, ycur, 0
  Send {Enter}
  k1 =
  Marking =
return

; Decrement leading
!+l::
; There is probably a faster way to do this
  Send {Esc}^+o
  MouseGetPos xcur, ycur
  MouseMove 66, 36, 0
  Click
  Send ^{Tab}
  MouseMove 64, 53, 0
  Click
  MouseMove 342, 247, 0
  Click
  Click
  MouseMove xcur, ycur, 0
  Send {Enter}
  k1 =
  Marking =
return

CapsLock & m::
  Send {F2}
return

CapsLock & n::
  Send {Esc}{Enter}{Home}{Left}  ; New line	; Esc for open office; Home is for auto-indent editors
  k1 =
return

!n::
  Send ^0{Esc}  ; Default or normal style
  k1 =
  Marking =
return

CapsLock & t::
  if GetKeyState("Shift") {
    Send !e!g!r
  } else {
    Send {F4}!o!a!f-1.27{Enter}  ; Hanging indent
    k1 =
    Marking =
  }
return

Capslock & u::
  Send ^u{Esc}  ; Underline
  Marking =
  k1 =
return

; exit all OOo windows
!x::
  Send ^q
  k1 =
return

CapsLock & y::
  if k1
    Send {Home}+{End}+{Right}{Del}
  else
  {
    saveclip := ClipboardAll
    Clipboard =
    Send +{End}+{Del}	; Select to eol
    Sleep, 40		; Wait for data to enter clipboard
    if not Clipboard
      Send +{Right}{Del}	; For some reason just {Del} doesn't do it
    Clipboard := saveclip
  }
  k1 =
  Marking =
return

$Esc::
  if Marking
    {
    Marking =
    Send {Esc}		;Esc for open office
    }
else
    Send {Esc}
return


; -------------------------------
; Eclipse IDE
; -------------------------------

#IfWinActive ahk_group Eclipse

CapsLock & d::
  if k1
    {
      Send ^c{Right}
      Marking =
    }
  else if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send +{End}  ; Extend selection end of line
    else
      Send {End}   ; End of line
    }
  else if Marking
    Send +{Right}  ; Extend selection right
  else
    Send {Right}   ; Char right
  k1 =
return

CapsLock & l::
  Send ^k
  k1 =
  Marking =
return

$!p:: Send {Alt Down}p

$Esc::
  if Marking {
    Marking =
    Send {Right}{Esc}
  } else
    Send {Esc}
return


; -------------------------------
; Putty (nano)
; -------------------------------

#IfWinActive ahk_group Unix

F3::Send {F5}

CapsLock & a::
  if A_PriorHotKey = CapsLock & q
    Send !r
  else
    Send !{Space}
return

CapsLock & c::
  if A_PriorHotKey = CapsLock & q
    Send !g100000{Enter}
  else if k1
    Send ^k
  else
    Send {PgDn}
  k1 =
return

CapsLock & d::
  if A_PriorHotKey = CapsLock & q
    Send {End}  ; End of line
  else if k1
    Send ^k^u
  else
    Send {Right}  ; Char right
  k1 =
return

CapsLock & f::
  if A_PriorHotKey = CapsLock & q
    Send ^w
  else
    Send ^{Space}
return

CapsLock & h::
  if k1
    Send !a
  else
    Send ^h
  k1 =
return

CapsLock & i::
  if k1
    Send !{}}
  else
    Send ^i
  k1 =
return

CapsLock & k::
  if k1 {
    Send !a
    k1 =
  } else {
    k1 = 1
  }
return

CapsLock & r::
  if A_PriorHotKey = CapsLock & q
    Send !g1{Enter}
  else if k1
    Send ^R
  else
    Send {PgUp}
  k1 =
return

CapsLock & s::
  if k1
    Send ^o{Enter}  ; File save
  else if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send +{Home}  ; Extend selection start of line
    else
      Send {Home}  ; Start of line
    }
  else if Marking
    send +{Left}  ; Extend selection left
  else
    Send {Left}  ; Char left
  k1 =
return

CapsLock & j::
  if A_PriorHotKey = CapsLock & q
    Send !g
return

CapsLock & l::
  Send ^w{Enter}
return

CapsLock & p::
  if k1
    Send ^u
  k1 =
return

CapsLock & u::
  if k1
    Send !{{}
  else
    Send ^u
  k1 =
return

CapsLock & w::
  Send !_{Down}
return

CapsLock & y::
  if A_PriorHotKey = CapsLock & q
    Send !a{End}^k
  else
    Send !a{End}{Right}^k
return

CapsLock & z::
  Send !+={Up}
return

; open file (have to then push alt-m to open in a new buffer -- no way to switch automatically once for all
^o::
  Send ^r
return

^s::
  Send ^o{Enter}
return

!n::
  Send !.
return

!x::
  Send ^xy{Enter}
return

!q::
  Send ^xn{BS}
return


; -------------------------------
; Notepad
; -------------------------------

#IfWinActive Find ahk_class #32770		; Notepad find window
$Enter::
  Send {Enter}{Esc}		                ; Escape out of find window
return


; -------------------------------
; Microsoft Office - MS Office
; -------------------------------

#IfWinActive ahk_group MSOffice

CapsLock & l::
  Send +{F4}
  k1 =
  Marking =
return


; -------------------------------
; Word processors (they act slightly differently to text editors)
; -------------------------------

#ifWinActive ahk_group WordProcessors

CapsLock & d::
  if k1
    {
      Send ^c{Left}{Right}  ; Duplicate selection
      Marking =
    }
  else if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send +{End}+{Left}  ; Extend selection end of line
    else
      Send {End}  ; End of line
    }
  else if Marking
    Send +{Right}  ; Extend selection right
  else
    Send {Right}  ; Char right
  k1 =
return

CapsLock & y::
  if k1
    Send {Home}+{End}{Del}  ; Delete line
  else
    Send +{End}+{Left}{Del}  ; Delete to eol
  k1 =
  Marking =
return


; -------------------------------
; Kicad
; -------------------------------

#ifWinActive ahk_group kicad

CapsLock & l::Send ^f{Enter}{Esc}


; -------------------------------
; Generic Wordstar key mapping
; Note: this must go last after all overrides for specific apps
; -------------------------------

;#IfWinActive						; For everything else
#IfWinNotActive Edit ahk_class ConsoleWindowClass	; For everything except FE

CapsLock & a::
  if k1
    {
    Send ^a  ; Select all
    Marking = 1
    }
  else if A_PriorHotKey = CapsLock & q
    Send ^h        ; Replace
  else if Marking
    Send ^+{Left}  ; Extend selection word left
  else
    Send ^{Left}   ; Word left
  k1 =
return

CapsLock & b::Send ^b

CapsLock & c::
  if k1
    {
    Send +{Del}  ; Edit cut
    Marking =
    }
  else if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send ^+{End}  ; Extend selection end of document
    else
      Send ^{End}  ; End of document
    }
  else if Marking
    Send +{PgDn}
  else
    Send {PgDn}  ; Page down
  k1 =
return

CapsLock & d::
  if k1
    {
      Send ^c{Left}{Right}  ; Duplicate selection
      Marking =
    }
  else if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send +{End}  ; Extend selection end of line
    else
      Send {End}  ; End of line
    }
  else if Marking
    Send +{Right}  ; Extend selection right
  else
    Send {Right}  ; Char right
  k1 =
return

CapsLock & e::
  if A_PriorHotKey = CapsLock & q
    if Marking
      Send +^{Up}  ; Extend selection line up
    else
      Send ^{Up}  ; Line up
  else if Marking
      Send +{Up}  ; Extend selection line up
  else
    Send {Up}  ; Line up
  k1 =
return

CapsLock & f::
  if A_PriorHotKey = CapsLock & q
    {
    Send ^f  ; Edit find
    Marking =
    }
  else if Marking
    Send ^+{Right}  ; Extend selection word right
  else
    Send ^{Right}  ; Word right
  k1 =
return

CapsLock & g::
  Send {Del}  ; Delete char right
  k1 =
  Marking =
return

; Ctrl+h does backspace and ^k^h remove marking
CapsLock & h::
  if k1
    {
    Marking =
    Send {Right}
    k1 =
    }
return

CapsLock & i::Send ^i

; Ctrl+k prefix, ^k^k toggles marking
CapsLock & k::
  if Marking
    {
    if k1
      {
      Marking =
      Send {Left}{Right}
      k1 =
      }
    else
      k1 = 1
    }
  else
    {
    if k1
      {
      Marking = 1
      k1 =
      }
    else
      k1 = 1
    }
return

CapsLock & l::
  if GetKeyState("Shift") {
    Send +{F3}   ; Find previous
  } else {
    Send {F3}    ; Find again
  }
  k1 =
  Marking =
return

CapsLock & n::
  Send {Enter}{Home}{Left}  ; New line	; Home is for auto-indent editors
  k1 =
return

; next previous window
!p::Send +^{Tab}

CapsLock & p::
  if k1
    Send +{Ins}  ; Edit paste
  else
    Send ^p  ; Print
  k1 =
return

; dummy hotkey so that A_PriorHotKey can detect it
CapsLock & q::
return

CapsLock & r::
  if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send ^+{Home}  ; Extend selection start of document
    else
      Send ^{Home}  ; Start of document
    }
  else if Marking
    Send +{PgUp}  ; Extend selection page up
  else
    Send {PgUp}  ; Page up
  k1 =
return

CapsLock & s::
  if k1
    Send ^s  ; File save
  else if A_PriorHotKey = CapsLock & q
    {
    if Marking
      Send +{Home}  ; Extend selection start of line
    else
      Send {Home}  ; Start of line
    }
  else if Marking
    send +{Left}  ; Extend selection left
  else
    Send {Left}  ; Char left
  k1 =
return

CapsLock & t::
  Send ^+{Right}{Del}  ; Delete word right
  k1 =
  Marking =
return

Capslock & u::
  Send ^u  ; Underline
  Marking =
  k1 =
return

CapsLock & BS::
  Send ^+{Right}{Del}  ; Delete word right
  k1 =
  Marking =
return

CapsLock & w::
  Send {WheelUp}  ; Scroll down
  k1 =
return

CapsLock & x::
  if k1 {
;     Send !{F4}  ; Window close
  } else if A_PriorHotKey = CapsLock & q
    if Marking
      Send +^{Down}  ; Extend selection line down
    else
      Send ^{Down}  ; Bottom of file
  else if Marking
    Send +{Down}  ; Extend selection line down
  else
    Send {Down}  ; Bottom of file
  k1 =
return

; exit all windows
!x::
  Send !{F4}  ; Window close
  k1 =
return

CapsLock & y::
  if k1
    Send {Home}+{End}{Del}  ; Delete line
  else
    Send +{End}{Del}  ; Delete to eol
  k1 =
  Marking =
return

CapsLock & z::
  Send {WheelDown}  ; Scroll up
  k1 =
return

$BS::
  Send {BS}  ; Delete left char
  k1 =
  Marking =
return

!BS::
  Send ^z  ; Undo
  k1 =
  Marking =
return

!+BS::
  Send ^y  ; Redo
  k1 =
  Marking =
return

$Del::
  Send {Del}  ; Delete char right
  k1 =
  Marking =
return

$Esc::
  if Marking
    {
    Marking =
    Send {Left}{Right}{Esc}
    }
else
    Send {Esc}
return

;---------- Other berwyn keys -----------

;Do not close in case I get mixed up and press ^q instead of Caps-q
^q::
return
