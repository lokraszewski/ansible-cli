# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#  ███████╗███████╗██╗  ██╗██████╗  ██████╗
#  ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#    ███╔╝ ███████╗███████║██████╔╝██║
#   ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#  ███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

autoload -Uz is-at-least; is-at-least
autoload -Uz colors; colors

if [[ "$ZPROF" = true ]]; then
    zmodload zsh/zprof
fi
CONFIG_DIR="$HOME/.zsh.d"

typeset -a sources
sources+="$CONFIG_DIR/environment.zsh"
sources+="$CONFIG_DIR/setopt.zsh"
sources+="$CONFIG_DIR/functions.zsh"
sources+="$CONFIG_DIR/zplug.zsh"
sources+="$CONFIG_DIR/alias.zsh"
sources+="$CONFIG_DIR/bindkey.zsh"
sources+="$CONFIG_DIR/colors.zsh"
sources+="$CONFIG_DIR/history.zsh"
sources+="$CONFIG_DIR/zaw.zsh"
sources+="$CONFIG_DIR/completion.zsh"

for file in $sources[@]; do
    if [[ -a $file ]]; then
       source $file
    else
        echo "config file not found: $file"
    fi
done

if [[ "$ZPROF" = true ]]; then
    zprof
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(pyenv init -)"