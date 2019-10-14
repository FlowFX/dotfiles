# Escape mapping. We want caps lock to act as Escape when tapped, and as
# Control when pressed down.
#
# This is OS dependant. For macOS, I use Karabiner.
# cf. https://stackoverflow.com/a/8597411
#
# On Arch, I don't use X at all.
if [ -f /etc/os-release ]; then
  . /etc/os-release

  if [[ "$OSTYPE" == "linux-gnu" ]] && [[ "$ID" == "debian" ]]; then
    setxkbmap -option "caps:ctrl_modifier"
    xcape -e "Caps_Lock=Escape"
  fi
fi
