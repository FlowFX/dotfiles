# load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I/home/flowfx ~/.Xresources

# load .Xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# set keyboard repeat delay and rate
xset r rate 200 30

# set right alt key as compose for é, í and ó
setxkbmap -option compose:ralt

#Generically if your HiDPI monitor is AxB pixels 4480x1600 and your regular monitor is CxD 1920x1200 and you are scaling by [ExF], the commandline for right-of is:
#xrandr --dpi 227
#xrandr --output eDP-1 --right-of HDMI-2
#xrandr --output HDMI-2 --auto --panning 1920x1200 --output eDP-1 --auto --panning 2560x1600+1920+0 --right-of HDMI-2

# Configure monitor
intern=eDP-1
extern=HDMI-2

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto --dpi 227
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi

# start i3wm
exec i3
