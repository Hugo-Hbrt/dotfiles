#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from the home directory to dotfiles in this repo

DOTFILES_DIR="$HOME/Projects/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

# Color output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory if needed
mkdir -p "$BACKUP_DIR"

# ZSH files
echo -e "\n${GREEN}=== Setting up ZSH ===${NC}"
zsh_files=(".zshrc" ".zprofile")
for file in "${zsh_files[@]}"; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo -e "${YELLOW}Backing up existing $file${NC}"
        mv "$HOME/$file" "$BACKUP_DIR/"
    elif [ -L "$HOME/$file" ]; then
        echo -e "${YELLOW}Removing existing symlink $file${NC}"
        rm "$HOME/$file"
    fi

    if [ -f "$DOTFILES_DIR/zsh/$file" ]; then
        echo -e "${GREEN}Creating symlink for $file${NC}"
        ln -sf "$DOTFILES_DIR/zsh/$file" "$HOME/$file"
    fi
done

# Git files
echo -e "\n${GREEN}=== Setting up Git ===${NC}"
if [ -f "$HOME/.gitconfig" ] && [ ! -L "$HOME/.gitconfig" ]; then
    echo -e "${YELLOW}Backing up existing .gitconfig${NC}"
    mv "$HOME/.gitconfig" "$BACKUP_DIR/"
elif [ -L "$HOME/.gitconfig" ]; then
    echo -e "${YELLOW}Removing existing .gitconfig symlink${NC}"
    rm "$HOME/.gitconfig"
fi

if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    echo -e "${GREEN}Creating symlink for .gitconfig${NC}"
    ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

# .config directory
echo -e "\n${GREEN}=== Setting up .config ===${NC}"
if [ -d "$HOME/.config" ] && [ ! -L "$HOME/.config" ]; then
    echo -e "${YELLOW}Backing up existing .config directory${NC}"
    mv "$HOME/.config" "$BACKUP_DIR/"
elif [ -L "$HOME/.config" ]; then
    echo -e "${YELLOW}Removing existing .config symlink${NC}"
    rm "$HOME/.config"
fi

if [ -d "$DOTFILES_DIR/.config" ]; then
    echo -e "${GREEN}Creating symlink for .config${NC}"
    ln -sf "$DOTFILES_DIR/.config" "$HOME/.config"
fi

# VSCode settings
echo -e "\n${GREEN}=== Setting up VSCode ===${NC}"
if [ -d "$VSCODE_USER_DIR" ]; then
    vscode_files=("settings.json" "keybindings.json" "mcp.json")
    for file in "${vscode_files[@]}"; do
        if [ -f "$VSCODE_USER_DIR/$file" ] && [ ! -L "$VSCODE_USER_DIR/$file" ]; then
            echo -e "${YELLOW}Backing up existing $file${NC}"
            mv "$VSCODE_USER_DIR/$file" "$BACKUP_DIR/"
        elif [ -L "$VSCODE_USER_DIR/$file" ]; then
            echo -e "${YELLOW}Removing existing symlink $file${NC}"
            rm "$VSCODE_USER_DIR/$file"
        fi

        if [ -f "$DOTFILES_DIR/vscode/$file" ]; then
            echo -e "${GREEN}Creating symlink for VSCode $file${NC}"
            ln -sf "$DOTFILES_DIR/vscode/$file" "$VSCODE_USER_DIR/$file"
        fi
    done
else
    echo -e "${YELLOW}VSCode User directory not found, skipping VSCode settings${NC}"
fi

# Check if backup directory is empty and remove it
if [ -z "$(ls -A $BACKUP_DIR)" ]; then
    rmdir "$BACKUP_DIR"
    echo -e "\n${GREEN}No backups needed - all files were already symlinked or didn't exist${NC}"
else
    echo -e "\n${YELLOW}Original files backed up to: $BACKUP_DIR${NC}"
fi

echo -e "\n${GREEN}Dotfiles installation complete!${NC}"
