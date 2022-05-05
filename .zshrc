

#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh# Zshrc

# not running interactively then bail
[[ $- != *i* ]] && return

# shell opts
setopt auto_cd
setopt bang_hist
setopt completealiases
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt inc_append_history
setopt share_history

# alias
alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias ls='ls --color=auto'
alias upd='sudo pacman -Syyu'
alias pac='sudo pacman --color auto'
alias merge='xrdb -merge ~/.Xresources'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirrors='sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias tclshi='rlwrap tclsh'
alias n='nnn -deoU'

# al-info
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# nvm
export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# java
export CLASSPATH=''
