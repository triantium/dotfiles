#!/bin/bash

#doas su

export RESTIC_REPOSITORY="rest:https://triantium:***REMOVED***@triantium.ddns.net/restic/"
# export RESTIC_PASSWORD_FILE="/home/manu/.config/restic/password"
export RESTIC_PASSWORD_COMMAND="pass backup/restic"
export RESTIC_FILES="/home/triantium/.config/restic/files"

rm backup.log

restic backup --files-from=$RESTIC_FILES &>> backup.log

# cat backup.log | \
#        sendEmail -f valkyrie@triantium.de \
#            -t triantium@mailbox.org   \
#            -s smtp.mailbox.org:465 \
#            -xu triantium@mailbox.org      \
#            -xp `pass accounts/mailbox.org | head -n 1`       \
#            -u "Backup Valkyrie"


