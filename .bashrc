#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias vim=/usr/bin/nvim
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '

# Functions
set-bg() {
  $HOME/.scripts/set-bg.sh $@
}

# Starship prompt
eval "$(starship init bash)"

# Greeting
neofetch

