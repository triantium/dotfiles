#!/usr/bin/env bash

# backup.service hash: {{ include "dot_config/systemd/user/backup.service" | sha256sum }}
# backup.timer hash: {{ include "dot_config/systemd/user/backup.timer" | sha256sum }}
# timewarrior.service hash: {{ include "dot_config/systemd/user/timewarrior.service" | sha256sum }}
# timewarrior.timer hash: {{ include "dot_config/systemd/user/timewarrior.timer" | sha256sum }}

echo 'Setting up Backup Timer'

systemctl --user daemon-reload
systemctl --user enable --now backup.timer
systemctl --user enable --now timewarrior.timer
