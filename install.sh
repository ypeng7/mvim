#! /bin/sh

# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# sh ./installer.sh ~/.cache/dein
# git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -r ./UltiSnips ~/.vim/
