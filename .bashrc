#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias vim=/usr/bin/nvim
alias config='/usr/bin/git --git-dir=/home/bzenz/.cfg/ --work-tree=/home/bzenz'
PS1='[\u@\h \W]\$ '

# Starship prompt
eval "$(starship init bash)"

# Greeting
neofetch

