#  ███████╗███████╗██╗  ██╗
#  ╚══███╔╝██╔════╝██║  ██║
#    ███╔╝ ███████╗███████║
#   ███╔╝  ╚════██║██╔══██║
#  ███████╗███████║██║  ██║
#  ╚══════╝╚══════╝╚═╝  ╚═╝
# Misc. Environment Variables
export VIRTUAL_ENV_DISABLE_PROMPT=1
CARGO_PATH=$HOME/.cargo/bin
export PATH="$CARGO_PATH:$PATH"
export TERM=xterm-256color # Fixes highlight style in tmux
