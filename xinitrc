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
# Disable screen saver
xset s off

# Disable touchpad
# Show current settings: xinput list-props 10
xinput set-prop 10 166 0

# Lock screen on suspend
xss-lock -- i3lock -i dotfiles-local/ioki-logo_white.png --color=1d1f22 &
exec i3
