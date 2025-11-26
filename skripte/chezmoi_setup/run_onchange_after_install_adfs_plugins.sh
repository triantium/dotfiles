#!/usr/bin/env bash

# asdf-setup.service hash: {{ include "skripte/chezmoi_setup/run_onchange_after_install_adfs_plugins.sh.tmpl" | sha256sum }}

if [ -x "$(command -v "asdf")" ] ; then
  asdf plugin add tilt
  asdf plugin add mvnd
  asdf install
else
  echo 'asdf not installed'
fi
