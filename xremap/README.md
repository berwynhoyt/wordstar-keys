# Wordstar key map for xremap (Linux)

Arrow keys are the bane of keyboard life. You constantly have to lift your hands off the home keys to move around your software file. Wordstar cursor control keys are the answer. This Linux key map defines Wordstar cursor control keys using capslock as the 'control' key.

The advantages of this map using using **[xremap](https://github.com/k0kubun/xremap)** (as compared with xkb) are:

* it lets you output multiple keystrokes for one input key
* allows you to define application-specific keys
* lets you run an external program on a keypress (e.g. scroll can be implemented using xdotool)
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

As of September 2022 this is a generic wordstar mapping that works for all applications. I expect that some keys won't work perfectly with some applications, so throughout 2022 I will be updating this mapping with any application-specific tweaks that I identify.

### App-specific key tweaks

Most of these keys will "just work" on your system. But a few keys work slightly better if xremap can detect which app you're currently typing in. You may find additional apps that need these specific tweaks. You can add your own to the wordstar.yml file. You'll see them listed near the beginning of the file. You can find the correct window title names for your own apps as [specified by xremap](https://github.com/k0kubun/xremap#x11-1).

If you are using Gnome Wayland or Sway (rather than X11), your window titles might differ from mine, I'm not sure. If they are constant between systems, they could be worth contributing to my .yml file as follows.

### Send me your tweaks

Please contribute your app tweaks (as above) for the benefit of others. This is relatively easy to do. Even if you're not up with git, you can contribute using github's online editor:

1. Simply sign up to github and you should see an edit pencil icon for [wordstar.yml](https://github.com/berwynhoyt/wordstar-keys/blob/main/xremap/wordstar.yml). 
2. Make your changes and it will create a 'fork' of my repository in your github account. 
3. Click the "Pull Requests" menu and the "New Pull Request" button. 
4. Check that it looks like it's merging your fork into mine and click the "Create pull request" button. 
5. That should about do it.

Please make sure you've thoroughly tested your change first.

## Installation

Simply start a terminal and type the following:

```
    git clone https://github.com/berwynhoyt/wordstar-keys.git
    cd wordstar-keys/xremap
    ./install
```

If you use [Gnome Wayland](https://github.com/k0kubun/xremap#gnome-wayland) (I don't), xremap may need this extra installation step provided in that link.

I have tested this installer on Linux Mint, and I expect it will work on most desktop Linux distributions. If it doesn't work for your Linux and you can fix it, then please create a pull request. For other Linux operating systems, more tweaks are required: see the installation notes at [xremap](https://github.com/k0kubun/xremap).
