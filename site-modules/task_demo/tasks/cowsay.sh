#!/bin/sh

# shamelessly borrowed from https://unix.stackexchange.com/questions/122681/how-can-i-tell-whether-a-package-is-installed-via-yum-in-a-bash-script
function install_ifnot {
  if yum list installed "$@" >/dev/null 2>&1
  then
    yum list installed "$@" | grep "$@"
  else
    yum install -y "$@"
  fi
}

if [ $PT_cleanup == true ]
then
  yum remove -y epel-release
  yum remove -y cowsay
  yum remove -y fortune-mod
else
  install_ifnot epel-release
  install_ifnot cowsay
  install_ifnot fortune-mod

  if [ -z "$PT_message" ]
  then
        fortune | cowsay
  else
        cowsay $PT_message
  fi
fi
