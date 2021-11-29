#!/bin/dash
set -e

spool=/tmp/spool/airline

[ -d "$spool" ] && rm -rf $spool/*
[ -d "$spool" ] || mkdir -p "$spool"

cp -r home dockerfile "$spool"

cd "$spool"
mkdir -p home/.vim/autoload
curl -LSso home/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p home/.vim/bundle
cd home/.vim/bundle
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes

cd "$spool"
docker build -t udemierik/airline .
docker run --rm -it udemierik/airline

