#!/bin/bash

keymapping="${HOME}/.Xmodmap"
xresources="${HOME}/.Xresources"

# Use my key remappings (swap caps lock and left control)
if [[ -f $keymapping ]]; then
    xmodmap $keymapping
fi

# Load color scheme and font settings
if [[ -f $keymapping ]]; then
    xrdb -load $xresources
fi

# Start i3wm
exec i3
