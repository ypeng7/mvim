#! /bin/sh

# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# sh ./installer.sh ~/.cache/dein
# git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

npm install -g typescript typescript-language-server
npm i -g bash-language-server

cp -r ./UltiSnips ~/.vim/
cp ./colors/* ~/.vim/
cp ./coc-settings.json ~/.vim

# brew tap caskroom/fonts
# brew cask install font-fira-code
# brew cask install font-roboto-mono-for-powerline
