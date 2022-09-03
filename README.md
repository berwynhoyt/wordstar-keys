# Wordstar key map (Linux or Windows)

Arrow keys are the bane of keyboard life. You constantly have to lift your hands off the touch-typing home keys to move around your software file. Wordstar cursor control keys are the answer. They let you move your cursor all around your file using intuitive motion keys that are activated simply by holding down capslock while you press them. They were good back in the day, and they're still the best set of cursor control keys around.

The great thing about this implementation is that it works for every program in your operating system. It's like defining special keyboard shortcuts in your word processor -- except they work in all your editors and even at the command line, and in web browser apps.

By way of comparison, the wordstar keys have a similar purpose to the emacs editor keys, but with the following advantages:

* they are more intuitive since the arrow keys are in a key pattern you'll recognise as: up, down, left, right.
* basic cursor motion can all happen with your left hand, leaving your right-hand free to use the mouse (now, why use the mouse? ... but it happens.)

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

These are the most-useful wordstar keys, though there are many others of arguable value. For a full list see this page on [wordstar.org](http://www.wordstar.org/index.php/wsemu-documentation/wsemu-commands-and-menus/1-wordstar-emulator-full-version-command-list).

I have included a few other non-wordstar keys in the specific implementations for xremap, xkb, and AutoHotkey. Check their docs for specifics.

### License

These scripts are released under the [MIT License](LICENSE.txt).
