#!/usr/bin/env sh

# Install utils
echo "### Installing utilities"
sudo pacman -S git man pacman-contrib arandr vim neovim htop neofetch dmenu ranger nitrogen dunst telegram-desktop xorg-xev spectacle mpv feh nodejs npm unzip ripgrep fd --noconfirm || exit 1

# Install utils
echo "### Installing language servers"
sudo pacman -S llvm llvm-libs lua-language-server ccl typescript-language-server bash-language-server --noconfirm || exit 1

# Install fonts
echo "### Installing fonts"
sudo pacman -S ttf-font-awesome otf-font-awesome ttf-firacode-nerd --noconfirm || exit 1

# Install doom emacs
echo "### Installing doom emacs"
sudo pacman -S emacs --noconfirm || exit 1
if [ ! -d $HOME/.emacs.d/bin ]; then
	git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d || exit 1
	~/.emacs.d/bin/doom install || exit 1
fi

# Setup build directory
echo "### Setup build directory"
if [ ! -d $HOME/.build ]; then
	mkdir -p $HOME/.build || exit 1
fi

# Install yay
echo "### Installing yay"
if [ ! -d $HOME/.build/yay ]; then
	cd ~/.build || exit 1
	git clone https://aur.archlinux.org/yay.git || exit 1
	cd yay || exit 1
	makepkg -si --noconfirm || exit 1
fi

# Install picom (jonaburg fork)
echo "### Installing picom (jonaburg fork)"
yay -S picom-jonaburg-git

# Install starship
echo "### Installing starship"
sudo pacman -S starship

