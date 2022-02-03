#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

FILEPATH="$HOME/.tmux/functions/publicip"
REFRESH_TIME_MIN="1"

fetch()
{
  dig @resolver4.opendns.com myip.opendns.com +short
}

linux_public_ip()
{

  if [ -f "$HOME/.hidemyass" ] ; then
      echo '13.37.13.37'
      return
  fi

  # If the file doesn't exist, create it with user only permissions.
  [ ! -f "$FILEPATH" ] && install -m 600 /dev/null "$FILEPATH" && fetch > "$FILEPATH"

  if test "$(find "$FILEPATH" -mmin +$REFRESH_TIME_MIN)"
  then
    fetch > "$FILEPATH"
  fi

  cat "$FILEPATH"
}

main()
{
  case $(uname -s) in
    # Only Linux for now since I am lazy, also I don't own a Mac.
    Linux)
      # hostname is unreliable since we cannot make assumptions about the order of addresses
      linux_public_ip
      ;;
    *)
      ;;
  esac
}

main


