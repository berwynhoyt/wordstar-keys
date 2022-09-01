# Wordstar key map (Linux or Windows)

Arrow keys are the bane of keyboard life. You constantly have to lift your hands off the home keys to move around your software file. Wordstar cursor control keys are the answer.

For Linux, I recommend the [map using xremap](xremap/README.md), but there is also a [map using xkb](xkb/README.md).
There is also a [version for windows using Autohotkey](autohotkey/Wordstar Capslock.ahk).
Documentation on each of those scripts is linked above.

These keyboard maps defines Wordstar cursor control keys using capslock as the 'control' key.


### Primary key definitions

* ^S/^D moves left/right; ^E/^X moves up/down; ^A/^F word left/right; ^R/^C moves page Up/Down
* ^Q acts as a prefix, e.g. ^QS/^QD moves to Home/End of line; ^QR/^QC start/end of document
* ^Y/^QY = delete/cut to end of line
* ^QF is find; ^L is re-find; ^QA is replace; ^QJ is goto line
* ^KB/^KK turns on block marking selection mode; ^KH hides it (unmark).
* ^KS save file
* ^KY yank (i.e. cut) block; ^KC copy block; ^KV paste block

Other non-wordstar keys are defined by the specific implementations: have a look in the docs for each.

### License

These scripts are released under the [MIT License](LICENSE.txt).
