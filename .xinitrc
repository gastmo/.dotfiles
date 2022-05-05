#!/bin/sh

# this script is executed when calling startx
#    startx ~/.xinitrc WM


# Session to run if none passed via startx
session=${1:-bspwm}

# set environment wm for use in scripts
export WM="$session"

# Default Arch xinit scripts
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*.sh; do
        [ -x "$f" ] && . "$f"
    done
fi

# user init scripts and settings
[ -f /etc/X11/xinit/.Xmodmap ] && xmodmap /etc/X11/xinit/.Xmodmap
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -f ~/.xprofile ] && source ~/.xprofile

# keyring for storing passwords
if hash gnome-keyring &>/dev/null; then
    gnome-keyring-daemon --start --components=pkcs11 &
fi
# gnome polkit
if [[ -x /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]]; then
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

# display timeout and sleep
xset s 3600 3600
xset dpms 3600 3700 4000

# keyboard repeat rate
xset r rate 400 50
kbdrate -d 400 -r 50

# simulate Alt+F1 with just pressing Super
if hash ksuperkey &>/dev/null; then
    ksuperkey -e 'Super_L=Alt_L|F1' &
    ksuperkey -e 'Super_R=Alt_L|F1' &
fi

# 1/1 mouse acceleration
xset m 1/1

# set CapsLock to Ctrl & Escape, and Shift_L + Shift_R to CapsLock
# check XKB options with:
# grep -E "(ctrl|caps|shift|alt|win|super):" /usr/share/X11/xkb/rules/base.lst
setxkbmap -option ctrl:nocaps,shift:both_capslock
xcape &

# Startup udiskie to auto-mount media.
udiskie -at &

# Do NOT put commands below the exec lines
case $session in
    i3|i3wm) exec i3 ;;
    bsp|bspwm) exec bspwm ;;
    xfce|xfce4) exec startxfce4 ;;
    openbox) exec openbox-session ;;
    awesome) exec awesome ;;
    *) exec "$1" # Unknown, try running it
esac

