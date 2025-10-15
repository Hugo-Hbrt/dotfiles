# dotfiles

My personal configuration files for macOS development environment.

## Installation

### Quick Setup

Clone this repository and run the install script:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./install.sh
```

The script will:
- Back up any existing dotfiles to `~/dotfiles_backup_<timestamp>`
- Create symlinks from your home directory to this repository
- Set up VSCode settings symlinks

### ZSH Plugins

Install the following Oh My Zsh plugins:

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Managing Your Dotfiles

Since all files are symlinked, any changes you make to your dotfiles (whether in `~` or in this repo) will be automatically synchronized.

To update:
```bash
cd ~/Projects/dotfiles
git add -A
git commit -m "Update dotfiles"
git push```