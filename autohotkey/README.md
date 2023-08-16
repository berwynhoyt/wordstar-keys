# Wordstar key map for AutoHotkey (Windows)

Arrow keys are the bane of keyboard life. You constantly have to lift your hands off the home keys to move around your software file. Wordstar cursor control keys are the answer. This Windows key map defines Wordstar cursor control keys using capslock as the 'control' key. It uses [AutoHotkey v1](https://www.autohotkey.com/) to do so.

### Primary key definitions

* ^S/^D moves left/right; ^E/^X moves up/down; ^A/^F word left/right; ^R/^C moves page Up/Down; ^U undo
* ^Q acts as a prefix, e.g. ^QS/^QD moves to Home/End of line; ^QR/^QC start/end of document
* ^Y/^QY = delete/cut to end of line; ^T = delete word to the right
* ^QF is find; ^L is re-find; ^QA is replace; ^QJ is goto line
* ^KB/^KK turns on block marking selection mode; ^KH hides it (unmark).
* ^KS save file
* ^KY yank (i.e. cut) block; ^KC copy block; ^KV paste block

#### Extra non-wordstar keys defined:

Note: ^ is an abbreviation for CapsLock

* ^N insert line break to the right
* ^Y instead of delete whole line, it deletes to end of line; if pressed again, it deletes the newline
* ^Backspace is delete word to the right
* ^B is bold (=ctrl-B)
* ^I is italic (=ctrl-I)
* ^QJ goto line number (issue Ctrl-G - works in some editors)

## Implementation quirks

There are several tweaks for specific applications to make this work consistently for them: OpenOffice, MSOffice, Google docs, SciTE editor, cmd, notepad, Eclipse, and the nano editor when invoked via putty. Look at the .ahk file for details. Note that due to the way AutoHotkey works, all the exceptions have to be listed first, and the main generic wordstar key bindings are defined at the end of the .ahk file.


## Installation

Download and install [AutoHotkey v1](https://www.autohotkey.com/)
Double-click wordstar.ahk. An icon will appear in your system tray showing that the key map is in operation.

