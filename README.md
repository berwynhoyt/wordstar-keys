# Wordstar key map (Linux or Windows)

Arrow keys are the bane of keyboard life. You constantly have to lift your hands off the touch-typing home keys to move around your software file. Wordstar cursor control keys are the answer. They're easy to learn, too. They were good back in the day, and they're still the best set of cursor control keys around.

They are similar in function to the cursor control keys defined by the emacs editor, but have the following advantages:

* they are more intuitive since the arrow keys are in a key pattern you'll recognise as: up, down, left, right.
* basic cursor motion can all happen with your left hand, leaving your right-hand free to use the mouse. (Now, why would you need to do that? But it happens.)

For Linux, I recommend the [map using xremap](xremap/README.md), but there is also a [map using xkb](xkb/README.md).
There is also a [version for windows using Autohotkey](autohotkey/Wordstar%20Capslock.ahk).
Documentation on each of those scripts is linked above.

These keyboard maps defines Wordstar cursor control keys using capslock as the 'control' key.

### Primary key definitions

Note: ^ is an abbreviation for CapsLock

* ^S/^D moves left/right; ^E/^X moves up/down; ^A/^F word left/right; ^R/^C moves page Up/Down
* ^Q acts as a prefix, e.g. ^QS/^QD moves to Home/End of line; ^QR/^QC start/end of document
* ^Y/^QY = delete/cut to end of line; ^T = delete word to the right
* ^QF is find; ^L is re-find; ^QA is replace; ^QJ is goto line
* ^KB/^KK turns on block marking selection mode; ^KH hides it (unmark).
* ^KS save file
* ^KY yank (i.e. cut) block; ^KC copy block; ^KV paste block

Other non-wordstar keys are defined by the specific implementations: have a look in the docs for each.

### License

These scripts are released under the [MIT License](LICENSE.txt).
