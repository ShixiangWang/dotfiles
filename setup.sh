#!/usr/bin/env bash
# This file is used for setting up GitHub CodeSpace

# ------------------------------
# Set up R devtools environment
# ------------------------------
sudo apt install libxml2 -y

# https://github.com/r-lib/rig
# works for debian releases
curl -Ls https://github.com/gaborcsardi/rim/releases/download/v0.3.0/rim-linux-0.3.0.tar.gz |
  sudo tar xz -C /usr/local

rim add release

pip3 install -U radian
R -e 'pak::pkg_install(c("devtools", "languageserver"))'
R -e 'if (file.exists("DESCRIPTION")) pak::pkg_install(".")'
