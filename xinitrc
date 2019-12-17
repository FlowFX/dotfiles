#!/bin/sh

if [ -f ~/.Xresources ]; then
    xrdb -merge -I$HOME ~/.Xresources
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Turn off beep
xset -b
exec i3
