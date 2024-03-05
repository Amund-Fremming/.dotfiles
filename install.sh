#!/bin/zsh

# Sjekk om Homebrew er installert, installer hvis ikke
if ! command -v brew &> /dev/null
then
    echo "Homebrew ikke funnet. Installerer Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
brew install git
brew install neovim
brew install tmux
brew install postgresql
brew services start postgresql
brew install --cask dotnet-sdk
brew install node
npm install -g react-native-cli
npm install -g typescript
npm install -g expo-cli
npm install -g vite

# Mulig noe manuell interaksjon
xcode-select --install
echo "Følg med på xcode installasjonen, kan være noe manuelt!"


# GUI-applikasjoner med cask
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask discord
brew install --cask spotify
brew install --cask obsidian
brew install --cask xcode
brew install --cask brave-browser
brew install --cask pgadmin4

echo "Sjekk at riktig versjon av .NET (dotnet 8) er installert. Om nødvendig, last ned spesifikk versjon fra Microsofts offisielle nettside."
echo "Husk å åpne Xcode og last ned nødvendige simulatorer gjennom Xcode Preferences -> Components."
echo "Installering fullført!"
