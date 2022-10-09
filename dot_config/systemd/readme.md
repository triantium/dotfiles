# User Timers and Services

Save these files as `~/.config/systemd/user/some-service-name.*`

Run this now and after any modifications: `systemctl --user daemon-reload`

Try out the service (oneshot): `systemctl --user start some-service-name`

Check logs if something is wrong: `journalctl -u --user-unit some-service-name`

Start the timer after this user logs in: `systemctl --user enable --now some-service-name.timer`
