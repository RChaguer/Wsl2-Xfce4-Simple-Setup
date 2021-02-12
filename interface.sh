#!/usr/bin/env bash

usage() {
  echo "Usage :" $0 " {start|stop|status|restart|try-restart|force-reload}"
}

if [[ $# -ne 1 ]]; then
  usage;
else
  sudo /etc/init.d/xrdp $1 > 2;
  if [[ $? -ne "0" ]]; then
    usage;
  fi
fi
