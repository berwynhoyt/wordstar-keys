# Wordstar cursor control keys with CAPS LOCK in Linux

Arrow keys are the bane of keyboard life. You constantly have to lift your hands off the home keys to move around your software file. Wordstar cursor control keys are the answer.

This Linux tool defines Wordstar cursor control keys in xkb using capslock as the 'control' shift key. I also have an autohotkey file that my Dad made that does this in Windows: contact me/him if you're interested.


### Key Definitions

* ^S/^D moves left/right; ^E/^X moves up/down; ^A/^F word left/right; ^R/^C moves page Up/Down
* ^Q acts as a prefix, e.g. ^QS/^QD moves to Home/End of line; ^QR/^QC start/end of document
* ^Y/^QY = delete to end of line (end of paragraph in a word processor - linux quirk)
* ^QF is find; ^L is re-find; ^QA is replace
* ^KB/^KK turns on block marking selection mode; ^KH hides (releases) it.
* ^KS block_save file
* ^KY yank (i.e. cut) block; ^KC copy block
* ^KP block_paste -- not wordstar standard which doesn't have paste


### Implementation quirks

It really is a shame that xkb doesn't let me issue two keystrokes or I could do a lot better.
With two keystrokes I could implement:

* ^Y (delete to end of line) issues ctrl-Shift-Delete which deletes to end of paragraph in a word processor
* ^N (insert line) issues <Enter> key. There is no way to issue a second Left key afterward to make it stay on the same line like it should
* ^QE/^QX (top/bottom of page): there is no standard function to do this in linux
* ^W/^Z (scroll up/down) issues ctrl-Up/Down which works in my editor but in few other apps.
* ^KX/^KC automatically exit block mode afterward

Consequently, it's not quite perfect. But given XKB's limitations, it's pretty good. Let me know if you know how to make XKB send multiple keystrokes from one key.


## Installation

```
    git clone <this_repository> wskeys
    cd wskeys
    ./install
```

### Gotchas

#### Weyland / Ubuntu

If you use the Wayland Display Server (which I think is now the **Ubuntu** default), then wskeys will not work because Weyland does not listen to the setxkbmap or xkbcomp commands. It is possible to get xkb key layouts working with Weyland at startup, but it requires that a rules file be created to map wskeys to a key layout option, and it requires wskeys files to be installed into the xkb system folder. This has yet to be implemented.

For now, just run switch to X Server instead of Weyland, or implement it yourself.


### Helpful XKB docs

If things go wrong, Damiano Venturin has a great little article on [making key map changes in xkb](https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450). For more detailed stuff, I'm afraid the X Keyboard file format is poorly documented in far too many places. I found the following to be most useful.

Ivan Pascal's documentation is most in-depth and therefore most useful for this kind of thing. But most of it is no longer available except on the [wayback machine here](https://web.archive.org/web/20021213091011/http://www.tsu.ru/~pascal/en/xkb/). He has an introductory [article here](https://www.x.org/archive/X11R7.6/doc/xorg-docs/input/XKB-Enhancing.html); its links are rotten but you can find them again in the wayback machine link. You could also check out [Doug Palmer's docs](https://www.charvolant.org/doug/xkb/html/xkb.html) with particularly useful tables of [what can go into key action statements](https://www.charvolant.org/doug/xkb/html/node5.html#SECTION00055000000000000000) and some [Archlinux docs](https://wiki.archlinux.org/title/X_keyboard_extension), but I think they're less helpful. Martin Krafft also has a [nice article](https://www.linux.com/news/extending-x-keyboard-map-xkb/) about the process he went through to learn how to load key maps with xkbcomp, which is what got me started; but again, his [repository links](https://git.madduck.net/) have all changed (you can only track them down if you look into the git history around the same dates as the articles).
