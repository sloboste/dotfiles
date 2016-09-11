#!/usr/bin/env bash

set -e

g_xresources=".Xresources"
g_xinitrc=".xinitrc"
g_xserverrc=".xserverrc"
g_inputrc=".inputrc"
g_xmodmap=".Xmodmap"

g_config_files=($g_xresources $g_xinitrc $g_xserverrc $g_inputrc $g_xmodmap)

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
g_dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make symlinks for config files
for filename in "${g_config_files[@]}"
do
    echo "Creating symlink for $filename"
    ln -s "${g_dotfiles_dir}/$filename" "${HOME}/$filename"
done

# Success!
echo "Successfully installed!"
echo "Restart X for changes to take effect."
