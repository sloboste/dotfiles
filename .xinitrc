#!/bin/bash

xmodmap="${HOME}/.Xmodmap"
xresources="${HOME}/.Xresources"

# Use my key remappings (swap caps lock and left control)
if [[ -f $xmodmap ]]; then
    xmodmap $xmodmap
fi

# Load color scheme and font settings
if [[ -f $xresources ]]; then
    xrdb -load $xresources
fi

# Start i3wm
exec i3
