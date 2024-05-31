#!/usr/bin/env bash

echo 'Setting up Backup Timer'

systemctl --user daemon-reload
systemctl --user enable --now backup.timer
