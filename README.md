# Dotfiles

This repository contains my personal dotfiles for managing my Arch Linux setup with dwm, nvim, ranger, picom and more.

## Installation

To install the dotfiles, run the following script:

```bash
git clone --bare git@github.com:vegedy/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
./scripts/install.sh
```

## Usage

The config function is a simple wrapper to manage the dotfiles:

- Check Status: ```config status```
- Add Files: ```config add <file>```
- Commit Changes: ```config commit -m "Commit message"```
- Push Changes: ```config push```

## Included Configuration

- dwm: Dynamic window manager configuration
- dwmblocks: Status bar for dwm
- dmenu: Dynamic menu configuration
- nvim: Neovim configuration
- ranger: Terminal file manager configuration
- starship: Starship prompt
- picom: Picom (jonaburg fork) configuration for compositor

## Backup and Restore

The installation script automatically backs up any pre-existing dotfiles to a .config-backup directory if there are conflicts during the checkout process.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
This project is licensed under the MIT License - see the LICENSE file for details.
