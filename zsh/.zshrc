export VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PROJECTS_PATH="$HOME/Projects"
export PATH=$PATH:$VSCODE_PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="nicoulaj"

zstyle ':omz:update' frequency 13
plugins=(git zsh-autosuggestions zsh-syntax-highlighting) 

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cdp="cd $PROJECTS_PATH"