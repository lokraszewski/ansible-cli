#  ███████╗███████╗██╗  ██╗
#  ╚══███╔╝██╔════╝██║  ██║
#    ███╔╝ ███████╗███████║
#   ███╔╝  ╚════██║██╔══██║
#  ███████╗███████║██║  ██║
#  ╚══════╝╚══════╝╚═╝  ╚═╝
# Fonts

HACK_UTL=https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
HACK_NAME="Hack Regular Nerd"
FONT_DIR=/home/$USER/.local/share/fonts

if [[ -z $(fc-list | grep "$HACK_NAME") ]]; then
	echo "Installing fonts"
	tmp_dir=$(mktemp -d)
	trap '{ rm -f -- "$tmp_dir"; }' EXIT
	[[ ! -d $FONT_DIR ]] && mkdir -p $FONT_DIR
	pushd $tmp_dir >/dev/null
	wget $HACK_UTL -q && unzip $(basename $HACK_UTL) && cp *.ttf $FONT_DIR/
	popd
fi
