#!/bin/sh

export KDEWM=/usr/bin/i3

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout 'us,ru' -variant 'dvorak,' -option 'ctrl:nocaps,grp:toggle'
# setxkbmap -layout 'us,ru' -variant 'dvorak,' -option 'ctrl:nocaps,grp:toggle,altwin:swap_alt_win'

# clipmenu
systemctl --user import-environment DISPLAY &
clipmenud &

eval $(ssh-agent)

# feh --bg-scale /home/kpuk/Downloads/4K-Forest-Wallpaper.jpg &
unclutter &
xcape &
dunst &
picom &
nm-applet &

# export DESKTOP_SESSION=plasma-i3
# exec startplasma-x11

exec i3

# STARTS GNOME
# export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
# export GNOME_SHELL_SESSION_MODE=Classic
# exec gnome-session

