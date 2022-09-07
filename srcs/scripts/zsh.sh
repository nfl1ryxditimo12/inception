#!/bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo sed -i "s/plugins=(git)/plugins=(git zsh-autosuggestions)/g" $HOME/.zshrc
source $HOME/.zshrc
