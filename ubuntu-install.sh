#!/bin/bash

# Oppdaterer pakkelister og oppgraderer eksisterende pakker
sudo apt update && sudo apt upgrade -y

# Installerer nødvendige programmer og verktøy
sudo snap install obsidian --classic
sudo apt install -y git
sudo apt install -y tmux
sudo apt install -y postgresql postgresql-contrib
sudo systemctl enable postgresql.service
sudo systemctl start postgresql.service
sudo apt install flameshot

# For .NET SDK, må vi legge til Microsofts pakkekilde og importere nøkkelen
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update
sudo apt install -y apt-transport-https
sudo apt install -y dotnet-sdk-6.0 # Juster versjonen etter behov

# Installerer Node.js og NPM
sudo snap install node --classic
sudo npm i -g react-native-cli
sudo npm i -g typescript


echo "Installering fullført!"
echo "Sjekk at alle versjoner er riktige!"

dotnet --version
node --version
tsc -- version
react-native --version

echo "Remember to set keyboard shortcut for flameshot!"
