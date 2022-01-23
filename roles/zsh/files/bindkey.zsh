#  ███████╗███████╗██╗  ██╗
#  ╚══███╔╝██╔════╝██║  ██║
#    ███╔╝ ███████╗███████║
#   ███╔╝  ╚════██║██╔══██║
#  ███████╗███████║██║  ██║
#  ╚══════╝╚══════╝╚═╝  ╚═╝
# Bindkey

bindkey -v

function my-expand-alias() { zle _expand_alias }
zle -N my-expand-alias
bindkey '^ ' my-expand-alias
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^k' sudo-command-line

# Faster esc timeout
export KEYTIMEOUT=1

# use zaw for history
bindkey '^R' zaw-history

# C-z, z but with zaw
bindkey '^z' zaw-z
