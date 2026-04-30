#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo."
  exit 1
fi

apt-get update
apt-get install libblocksruntime0 libgnustep-base1.31 patchelf wget

wget "https://launchpad.net/ubuntu/+archive/primary/+files/libdispatch0_0~svn197-3.3ubuntu2_amd64.deb" -O "libdispatch0_0~svn197-3.3ubuntu2_amd64.deb"
wget "https://launchpad.net/ubuntu/+archive/primary/+files/libkqueue0t64_2.3.1-1.1build1_amd64.deb" -O "libkqueue0t64_2.3.1-1.1build1_amd64.deb"
wget "https://launchpad.net/ubuntu/+archive/primary/+files/libpthread-workqueue0_0.9.1-1build1_amd64.deb" -O "libpthread-workqueue0_0.9.1-1build1_amd64.deb"

apt-get install ./libdispatch0_0~svn197-3.3ubuntu2_amd64.deb ./libkqueue0t64_2.3.1-1.1build1_amd64.deb ./libpthread-workqueue0_0.9.1-1build1_amd64.deb
