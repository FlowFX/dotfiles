# Escape mapping. We want caps lock to act as Escape when tapped, and as
# Control when pressed down.
#
# This is OS dependant. For macOS, I use Karabiner.
# cf. https://stackoverflow.com/a/8597411
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  setxkbmap -option "caps:ctrl_modifier"
  xcape -e "Caps_Lock=Escape"
fi
