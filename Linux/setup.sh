cd ~

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# z.lua
curl https://raw.githubusercontent.com/skywind3000/z.lua/master/z.lua -o ~/z.lua

# dotfiles
git clone https://github.com/yzlnew/dotfiles.git ~/dotfiles

# Link
ln -s ~/dotfiles/Vim/vimrc ~/.vimrc
ln -s ~/dotfiles/IDEA/ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/Linux/zshrc ~/.zshrc
ln -s ~/dotfiles/MacOS/powerlevel9k.config ~/powerlevel9k.config
