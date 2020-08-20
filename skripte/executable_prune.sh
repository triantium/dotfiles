#!/bin/bash

#doas su

export RESTIC_REPOSITORY="rest:https://triantium:***REMOVED***@triantium.ddns.net/restic/"
# export RESTIC_PASSWORD_FILE="/home/manu/.config/restic/password"
export RESTIC_PASSWORD_COMMAND="pass backup/restic"
export RESTIC_FILES="/home/manu/.config/restic/files"

restic forget \
--keep-daily 7 --keep-weekly 5 --keep-monthly 12 --keep-yearly 75 \
--prune



