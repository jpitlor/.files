git clone https://github.com/piticent123/.files ~/.files
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -S ~/.gitconfig ~/.files/dotfiles/.gitconfig
ln -S ~/.tmux.conf ~/.files/dotfiles/.tmux.conf
ln -S ~/.p10k.zsh ~/.files/dotfiles/.p10k.zsh
ln -S ~/.gitconfig ~/.files/dotfiles/.gitconfig
ln -S ~/.zshrc ~/.files/dotfiles/.zshrc

vim +PluginInstall +qall
