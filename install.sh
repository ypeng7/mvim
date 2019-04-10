#! /bin/sh

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

cp -r ./Ultisnips ~/.vim/
