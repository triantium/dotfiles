#! /bin/bash

exec i3-msg 'workspace 2; exec /usr/bin/vivaldi' &
exec i3-msg 'workspace 1; exec /usr/bin/texstudio' &
exec i3-msg 'workspace 1; exec /usr/bin/atril' &
exec i3-msg 'workspace 3; exec /snap/bin/gitkraken' &
