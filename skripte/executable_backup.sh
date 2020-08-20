#!/bin/bash

#doas su

export RESTIC_REPOSITORY="rest:https://triantium:***REMOVED***@triantium.ddns.net/restic/"
# export RESTIC_PASSWORD_FILE="/home/manu/.config/restic/password"
export RESTIC_PASSWORD_COMMAND="pass backup/restic"
export RESTIC_FILES="/home/triantium/.config/restic/files"

restic backup --files-from=$RESTIC_FILES
