" 解决 MacVim 的 python3 问题
" https://unix.stackexchange.com/questions/305415/enabling-python3-on-vim-in-fedora-24
if exists('py2') && has('python')
elseif has('python3')
endif

set shell=/bin/zsh
highlight clear SignColumn
" highlight LineNr guibg=NONE
set guifont=FuraCodeNerdFontComplete-Retina:h16
set background=light
set termguicolors
colorscheme NeoSolarized
