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
R -e 'pak::pkg_install(c("devtools", "languageserver", "pkgdown"))'
R -e 'if (file.exists("DESCRIPTION")) remotes::install_local(dependencies = TRUE, force = TRUE)'
# disable rgl
# options(rgl.useNULL=TRUE)
# ref: https://stackoverflow.com/questions/68517734/how-to-install-the-rgl-package-in-macos-big-sur
