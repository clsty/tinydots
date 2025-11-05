# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;33;44m'
export LESS_TERMCAP_se=$'\E[0m'

source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

if [ ! -z $STY ];then
	export LANG=C.UTF-8
	export LC_CTYPE="C.UTF-8"
	export LC_NUMERIC="C.UTF-8"
	export LC_TIME="C.UTF-8"
	export LC_COLLATE="C.UTF-8"
	export LC_MONETARY="C.UTF-8"
	export LC_MESSAGES=
	export LC_PAPER="C.UTF-8"
	export LC_NAME="C.UTF-8"
	export LC_ADDRESS="C.UTF-8"
	export LC_TELEPHONE="C.UTF-8"
	export LC_MEASUREMENT="C.UTF-8"
	export LC_IDENTIFICATION="C.UTF-8"
	export LC_ALL= 
fi

# Auto start Hyprland after login in tty1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec hyprland
fi

eval "$(starship init zsh)"
