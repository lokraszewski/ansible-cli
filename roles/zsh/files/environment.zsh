#  ███████╗███████╗██╗  ██╗
#  ╚══███╔╝██╔════╝██║  ██║
#    ███╔╝ ███████╗███████║
#   ███╔╝  ╚════██║██╔══██║
#  ███████╗███████║██║  ██║
#  ╚══════╝╚══════╝╚═╝  ╚═╝
# Misc. Environment Variables
export VIRTUAL_ENV_DISABLE_PROMPT=1
CARGO_PATH=$HOME/.cargo/bin
LOCAL_PATH=$HOME/.local/bin
export GOROOT=$HOME/.go
export GOPATH=$HOME/go

export PATH="$GOPATH/bin:$CARGO_PATH:$LOCAL_PATH:$PATH"
export TERM=xterm-256color # Fixes highlight style in tmux
