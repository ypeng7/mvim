#! /bin/sh

# git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

npm install -g typescript typescript-language-server
npm i -g bash-language-server
npm install -g yaml-language-server
npm install --global vscode-html-languageserver-bin
npm install -g json-language-server

cp -r ./UltiSnips ~/.vim/
# install nerd fonts
cp -r ./RobotoMono ~/.fonts/
fc-cache -fv

ln -s ./vimrc ~/.vimrc

# brew tap caskroom/fonts
# brew cask install font-fira-code
# brew cask install font-roboto-mono-for-powerline
