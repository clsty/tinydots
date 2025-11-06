# vim:fileencoding=utf-8:ft=config:fdm=marker foldlevel=0
# In vim/neovim, press `z' `a' to toggle folding.

# {{{ ========== p10k-instant-prompt ==========
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}EndOf ===== p10k-instant-prompt

# {{{ ========== Basic-envvars ==========

export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;33;44m'
export LESS_TERMCAP_se=$'\E[0m'

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
# }}}EndOf ===== Basic-envvars

# {{{ ========== Home-manager ==========
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
# }}}EndOf ===== Home-manager

# {{{ ========== Oh-my-zsh ==========
ZSH="$HOME/.nix-profile/share/oh-my-zsh"
ZSH_CACHE_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir -p $ZSH_CACHE_DIR
fi
plugins=(git)
zstyle ':omz:update' mode disabled
source $ZSH/oh-my-zsh.sh
# }}}EndOf ===== Oh-my-zsh

# {{{ ========== Powerlevel10k ==========
P10K_THEME_PATH="$HOME/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
if [[ -f "$P10K_THEME_PATH" ]]; then
  source "$P10K_THEME_PATH"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# }}}EndOf ===== Powerlevel10k

# Auto start Hyprland after login in tty1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec hyprland
fi
