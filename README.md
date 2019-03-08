### What I use

- Homebrew Bundle
- ~~spf13-vim~~
- vim
- oh-my-zsh
- tmux

### Vim

This [vimrc](https://github.com/yzlnew/dotfiles/blob/master/vimrc) is tested on macOS, gVim on Windows and Terminal Vim on WSL.

Screenshots can be found [here](https://yellow-stone.club/blog/2019-01-28-vimrc/).

#### on macOS/Linux

Copy the vimrc to your ~/.vimrc, and you're almost all set.

#### on Windows

1. Copy the vimrc to ~/\_vimrc.
2. Paste script below in PowerShell to install vim-plug.

<script src="https://gist.github.com/yzlnew/dae21e149e713662aec77ae7aa6ae90c.js"></script>

#### reminder

- I use [Sarasa-Gothic](https://github.com/be5invis/Sarasa-Gothic) on Windows and FantasqueSansMono on macOS. A Nerd-Font is needed
  to make plugin like `vim-devicons` and `vim-airline` look right.
- You need to compile YCM first, which is a pain on Windows. And make sure `python` is visible to vim on Windows.
- Use [Scoop](https://github.com/lukesampson/scoop) to install vim and anything else on Windows.
