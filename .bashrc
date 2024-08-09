#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load environment variables
export $(envsubst < .env)

# Aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias vim=/usr/bin/nvim
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '

# yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Starship prompt
eval "$(starship init bash)"

# Greeting
neofetch

