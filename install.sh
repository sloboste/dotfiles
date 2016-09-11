#!/usr/bin/env bash

set -e

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
g_dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting default editor to vim..."
g_term_files=(".profile" ".bashrc")
for filename in "${g_term_files[@]}"
do
    if [[ -f "${HOME}/$filename" ]]; then
        echo "" >> "${HOME}/$filename"
        echo "export EDITOR=vim" >> "${HOME}/$filename"
    fi
done

# Setup powerline fonts
echo "Installing Powerline fonts..."
g_font_dir="${g_dotfiles_dir}/fonts"
git clone https://github.com/powerline/fonts.git $g_font_dir
bash $g_font_dir/install.sh

# Setup solarized dircolors
echo "Installing solarized dark dircolors..."
g_dircolors_dir="${g_dotfiles_dir}/dircolors-solarized"
git clone https://github.com/seebi/dircolors-solarized.git $g_dircolors_dir
ln -s "${g_dircolors_dir}/dircolors.256dark" "${HOME}/.dircolors"

g_xresources=".Xresources"
g_xinitrc=".xinitrc"
g_xserverrc=".xserverrc"
g_xmodmap=".Xmodmap"
g_inputrc=".inputrc"

g_config_files=($g_xresources $g_xinitrc $g_xserverrc $g_inputrc $g_xmodmap)

# Make symlinks for config files
for filename in "${g_config_files[@]}"
do
    echo "Installing $filename..."
    ln -s "${g_dotfiles_dir}/$filename" "${HOME}/$filename"
done

# Success!
echo ""
echo "Successfully installed!"
echo "Restart X for changes to take effect."
