### What I use

- Homebrew Bundle
- ~~spf13-vim~~
- vim/NeoVim
- oh-my-zsh
- tmux

### Vim

This [vimrc](https://github.com/yzlnew/dotfiles/blob/master/vimrc) is tested on macOS, gVim on Windows and Terminal Vim on WSL.

Screenshots can be found [here](https://yellow-stone.club/blog/2019-01-28-vimrc/).

#### macOS/Linux

Copy the vimrc to your ~/.vimrc, and you're almost all set.

#### Windows

1. Copy the vimrc to ~/\_vimrc.
2. Paste script below in PowerShell to install vim-plug.

```PowerShell
md ~\.vim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\.vim\autoload\plug.vim"
  )
)
```

3. Add `Python3.dll` to `$PATH`
4. `pip3 install --user pynvim` if using Neovim

#### Reminder

- I use [Sarasa-Gothic](https://github.com/be5invis/Sarasa-Gothic) on Windows and FantasqueSansMono on macOS. A Nerd-Font is needed
  to make plugin like `vim-devicons` and `vim-airline` look right.
- ~~You need to compile YCM first, which is a pain on Windows.~~ Life is short, use coc.nvim. And make sure `python` is visible to vim on Windows.
- Use [Scoop](https://github.com/lukesampson/scoop) to install vim and anything else on Windows.
