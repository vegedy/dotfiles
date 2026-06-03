#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# opencode
export PATH=/home/benito/.opencode/bin:$PATH

# Android
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"

# Aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias vim=/usr/bin/nvim
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias termdown='termdown -f doh'
alias cr='coderabbit'

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
fastfetch

