#!/bin/bash

# Install HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update
brew update
brew install tmux
brew install tor
# brew install vim
brew install zsh
brew install zsh-completions
brew install emacs
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
# brew cask install macvim
brew cask install emacs
brew cask install font-hack-nerd-font
brew cask install alfred
brew cask install istat-menus
brew cask install iterm2
brew cask install vlc
brew cask install firefox
brew cask install google-chrome
brew cask install franz
brew cask install spotify
brew cask install murus
brew cask install microsoft-office
brew cask install virtualbox
brew cask install vagrant

# Install oh-my-zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install DOOM
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom quickstart

# Dotfi†e
git clone --bare https://github.com/AlessandroMorelli96/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
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
