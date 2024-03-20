#!/bin/zsh

# Sjekk om Homebrew er installert, installer hvis ikke
if ! command -v brew &> /dev/null
then
    echo "Homebrew ikke funnet. Installerer Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Oppdater Homebrew og oppgradere eventuelle allerede installerte pakker
brew update && brew upgrade

# Installer Zsh og sett den som standard skall, hvis det ikke allerede er
brew install zsh
if [ ! "$SHELL" = "/bin/zsh" ]; then
    chsh -s $(which zsh)
fi

# Installerer Oh My Zsh hvis den ikke allerede er installert
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Kopierer .zshrc fra .dotfiles til hjemmekatalogen, eller oppretter en lenke
cp ~/.dotfiles/zshrc ~/.zshrc

# Installere programmer og verktøy
brew install java
brew install git
brew install neovim
brew install tmux
brew install postgresql
brew install pgadmin4
brew install dotnet 
brew install node

# GUI-applikasjoner med 
brew install iterm2
brew install visual-studio-code
brew install discord
brew install spotify
brew install obsidian
brew install xcode
brew install brave-browser
brew install pgadmin4

xcode-select --install

# Tools for workflow, hammerspoon krever configurering
brew install --cask hammerspoon

echo "Installering fullført!"
echo "versjoner: "
dotnet --version
node --version
npm --version
nvim --version
java --version

