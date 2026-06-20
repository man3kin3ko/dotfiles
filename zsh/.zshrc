# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.bin:$HOME/.config/rofi/scripts:$HOME/.local/bin:/usr/local/bin:$PATH
export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

# ohmyzsh
export ZSH="/usr/share/oh-my-zsh"
ZSH_THEME="af-magic"
DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX=true
plugins=()
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p $ZSH_CACHE_DIR
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf & fd
[[ -e "/usr/share/fzf/fzf-extras.zsh" ]] && source /usr/share/fzf/fzf-extras.zsh
export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --preview 'file {}' --preview-window down:1"
export FZF_COMPLETION_TRIGGER="~~"

# tilix set
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

export TERM="xterm-256color"
export EDITOR="$([[ -n $DISPLAY && $(command -v subl3) ]] && echo 'subl3' || echo 'nano')"
export BROWSER="google-chrome"
export XDG_CONFIG_HOME="$HOME/.config"
export _JAVA_AWT_WM_NONREPARENTING=1

[[ -f ~/.alias_zsh ]] && . ~/.alias_zsh

export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$PATH:$(gem env path | sed 's#[^:]\+#&/bin#g')"
export PATH="/usr/lib/jvm/java-21-openjdk/bin/java:$PATH"

# zprof
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias зщцукщаа="poweroff"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration
