#!/usr/bin/env bash
linux_acpi() {
  arg=$1
  BAT=$(find /sys/class/power_supply -name "BAT*" | head -1)
  if [ ! -x "$(which acpi 2> /dev/null)" ];then
    case "$arg" in
      status)
        cat $BAT/status
        ;;

      percent)
        cat $BAT/capacity
        ;;

      *)
        ;;
    esac
  else
    case "$arg" in
      status)
        acpi | cut -d: -f2- | cut -d, -f1 | tr -d ' '
        ;;
      percent)
        acpi | cut -d: -f2- | cut -d, -f2 | tr -d '% '
        ;;
      *)
        ;;
    esac
  fi
}

bat_percent()
{
  # Check OS
  case $(uname -s) in
    Linux)
      bat_percent=$(linux_acpi percent)
      [ -n "$bat_percent" ] && echo " $bat_percent"
      ;;

    *)
      ;;
  esac
}

bat_status()
{
  # Check OS
  case $(uname -s) in
    Linux)
      status=$(linux_acpi status)
      ;;

    *)
      ;;
  esac

  case $status in
    discharging|Discharging)
      echo ''
      ;;
    high)
      echo ''
      ;;
    charging)
      echo ' '
      ;;
    *)
      echo 'ﮣ '
      ;;
  esac
}

main()
{
  bat_stat=$(bat_status)
  bat_perc=$(bat_percent)

  if [ -z "$bat_stat" ]; then
    echo "$bat_perc"
  elif [ -z "$bat_perc" ]; then
    echo "$bat_stat"
  else
    echo "$bat_stat $bat_perc"
  fi
}

main

