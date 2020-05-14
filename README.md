### What I use

- Homebrew Bundle
- Vim/NeoVim
- oh-my-zsh
- tmux
- Windows Terminal/PowerShell

### Vim

This [vimrc](https://github.com/yzlnew/dotfiles/blob/master/vimrc) is tested on macOS and Windows.

#### Prerequisites

- Nodejs (for coc.nvim)
- Python3

**Recommend** using `Scoop` to install all kinds of this stuff on Windows.

Clone this repo to your home directory.

#### macOS/Linux

Copy or link the `vimrc` to your `~/.vimrc`, and you're almost all set.

```
vim +PlugInstall
```

Enjoy!

#### Windows

1. Copy or link the vimrc to `~/_vimrc.`
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

3. Edit the `_vimrc` to point to your `Python` installation.
4. `pip3 install --user pynvim` if using Neovim.

#### Reminder

- A Nerd-Font is needed to make plugin like `vim-devicons` and `vim-airline` look right.
- Life is short, use coc.nvim. And make sure `python` is visible to vim on Windows.
- Use [Scoop](https://github.com/lukesampson/scoop) to install vim and anything else on Windows.
