#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

main()
{
  case $(uname -s) in
    # Only Linux for now since I am lazy, also I don't own a Mac.
    Linux)
      # hostname is unreliable since we cannot make assumptions about the order of addresses
      ip route get 1 | awk '{print $(NF-2);exit}'
      ;;

    *)
      ;;
  esac
}

main
