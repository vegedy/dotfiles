#!/usr/bin/env sh

# Install xorg
echo "### Installing xorg"
sudo pacman -S xorg xorg-xev xorg-xinit --noconfirm || exit 1

# Install utils
echo "### Installing utilities"
sudo pacman -S git man base-devel pacman-contrib arandr vim neovim htop fastfetch dmenu ranger nitrogen dunst telegram-desktop spectacle mpv feh nodejs npm unzip ripgrep fd xclip python-pywal zathura zathura-pdf-mupdf pamixer --noconfirm || exit 1

# Install utils
echo "### Installing language servers"
sudo pacman -S llvm llvm-libs lua-language-server ccls typescript-language-server bash-language-server --noconfirm || exit 1

# Install fonts
echo "### Installing fonts"
sudo pacman -S fontconfig ttf-font-awesome otf-font-awesome ttf-firacode-nerd --noconfirm || exit 1

# Install yazi
echo "### Installing yazi"
sudo pacman -S yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide chafa p7zip --noconfirm || exit 1

# Install starship
echo "### Installing starship"
sudo pacman -S starship

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

# Install ueberzugpp
echo "### Installing ueberzugpp"
yay -S --noconfirm --needed ueberzugpp

# Install picom (jonaburg fork)
echo "### Installing picom (jonaburg fork)"
yay -S --noconfirm --needed picom-jonaburg-git

# Install i3lock-fancy-dualmonitors
echo "### Installing picom (jonaburg fork)"
yay -S --noconfirm --needed i3lock-fancy-dualmonitors-git

# Install dwm
echo "### Installing dwm"
if [ ! -d $HOME/.build/dwm ]; then
	cd ~/.build || exit 1
	git clone https://github.com/vegedy/dwm.git || exit 1
	cd dwm || exit 1
	./rebuild.sh || exit 1
fi

# Install dwmblocks
echo "### Installing dwmblocks"
if [ ! -d $HOME/.build/dwmblocks ]; then
	cd ~/.build || exit 1
	git clone https://github.com/vegedy/dwmblocks.git || exit 1
	cd dwmblocks || exit 1
	./rebuild.sh || exit 1
fi

# Install dwmblocks
echo "### Installing st"
if [ ! -d $HOME/.build/st ]; then
	cd ~/.build || exit 1
  git clone https://github.com/vegedy/st.git || exit 1
  cd st || exit 1
  sudo make install || exit 1
fi

# Setup language
echo "### Setup language"
sudo sed -i '/^#de_DE.UTF-8 UTF-8/s/^#//' /etc/locale.gen || exit 1 # Enable de_DE.UTF-8 UTF-8
sudo locale-gen || exit 1

# Setup default programs
echo "### Setup default programs" || exit 1
xdg-mime default zathura.desktop application/pdf || exit 1

