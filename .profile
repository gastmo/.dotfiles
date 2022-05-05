# ~/.profile
#
# set environment common to both Zsh and Bash

export TERMINAL="termite"
export PAGER="less" 	# vimpager
export EDITOR="vim"
export VISUAL="vim"
export FILEMANAGER="ranger"
export BROWSER="vimb"

# nnn variables

export NNN_BMS='c:~/Configuration;d:~/Documents;D:~/Downloads;e:/etc;p:~/Pictures;m:/mnt;v:~/Videos;w:~/Working'
export NNN_USE_EDITOR=1
export DISABLE_FILE_OPEN_ON_NAV=1

# ranger variables

export RANGER_LOAD_DEFAULT_RC="TRUE"

# set CapsLock to Ctrl & Escape, and Shift_L + Shift_R to CapsLock
# check XKB options with:
# grep -E "(ctrl|caps|shift|alt|win|super):" /usr/share/X11/xkb/rules/base.lst

setxkbmap -option ctrl:nocaps,shift:both_capslock
xcape &

