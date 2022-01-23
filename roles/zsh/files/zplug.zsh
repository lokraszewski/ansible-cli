#  ███████╗███████╗██╗  ██╗
#  ╚══███╔╝██╔════╝██║  ██║
#    ███╔╝ ███████╗███████║
#   ███╔╝  ╚════██║██╔══██║
#  ███████╗███████║██║  ██║
#  ╚══════╝╚══════╝╚═╝  ╚═╝
# zplug

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -z $ZPLUG_HOME ]]; then
    export ZPLUG_HOME=~/.zplug
fi


[ ! -f $ZPLUG_HOME/init.zsh ] && git clone https://github.com/zplug/zplug.git $ZPLUG_HOME

source $ZPLUG_HOME/init.zsh

zplug "agkozak/zsh-z"
zplug "zsh-users/zaw"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh # syntax highlight, use ccat
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh #python completions
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mafredri/zsh-async", from:"github"
zplug "romkatv/powerlevel10k", as:theme, depth:1

if ! zplug check; then
    zplug install
fi

zplug load

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh