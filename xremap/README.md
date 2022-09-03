# Wordstar key map for xremap (Linux)

Arrow keys are the bane of keyboard life. You constantly have to lift your hands off the home keys to move around your software file. Wordstar cursor control keys are the answer. This Linux key map defines Wordstar cursor control keys using capslock as the 'control' key.

The advantages of this map using using **[xremap](https://github.com/k0kubun/xremap)** (as compared with xkb) are:

* it lets you output multiple keystrokes for one input key
* allows you to define application-specific keys
* it has a simpler definition file

The disadvantage is that the installation process requires root access.

### Primary key definitions

Note: ^ is an abbreviation for CapsLock

* ^S/^D moves left/right; ^E/^X moves up/down; ^A/^F word left/right; ^R/^C moves page Up/Down; ^U undo
* ^Q acts as a prefix, e.g. ^QS/^QD moves to Home/End of line; ^QR/^QC start/end of document
* ^Y/^QY = delete/cut to end of line; ^T = delete word to the right
* ^QF is find; ^L is re-find; ^QA is replace; ^QJ is goto line
* ^KB/^KK turns on block marking selection mode; ^KH hides it (unmark).
* ^KS save file
* ^KY yank (i.e. cut) block; ^KC copy block; ^KV paste block
* ^PB bold; ^PI italic

#### Extra non-wordstar keys defined:
* ^N insert line break to the right
* ^Y instead of delete whole line, it deletes to end of line; if pressed again, it deletes the newline
* ^Backspace is delete word to the right
* ^B is bold (=ctrl-B)
* ^I is italic (=ctrl-I)
* ^QJ goto line numberImplementation quirks


## Installation

```
    git clone <this_repository> wskeys
    cd wskeys/xremap
    ./install
```

This install works for Ubuntu/Mint. For other Linux operating systems more tweaks are required: see the installation notes at [xremap](https://github.com/k0kubun/xremap).

