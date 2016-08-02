mkdir -p ~/.vim/bundle
chown vagrant:vagrant ~/.vim
chown vagrant:vagrant ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
chown vagrant:vagrant ~/.zshrc
chown vagrant:vagrant ~/.vimrc
