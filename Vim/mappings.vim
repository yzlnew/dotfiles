" 快捷键 {
    let mapleader=' '
    " 窗口快速移动 {
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    " }
    noremap <M-,> :bprevious<CR>
    noremap <M-.> :bnext<CR>
    noremap <Tab> :bnext<CR>

    noremap <M-d> :bp\|bd #<CR>
    noremap <M-q> <C-w>c
    noremap <M-\> :vsplit<CR>
    noremap <M--> :split<CR>
    noremap <M-;> :vertical resize -5<CR>
    noremap <M-'> :vertical resize +5<CR>
    noremap <M-[> :resize -5<CR>
    noremap <M-/> :resize +5<CR>
    " 移动增强
    noremap <M-h> b
    noremap <M-l> w
    noremap <M-j> gj
    noremap <M-k> gk
    inoremap <M-h> <c-left>
    inoremap <M-l> <c-right>
    inoremap <M-j> <c-\><c-o>gj
    inoremap <M-k> <c-\><c-o>gk
    cnoremap <M-h> <c-left>
    cnoremap <M-l> <c-right>
    " 折行移动到显示的下一行
    noremap j gj
    noremap k gk
    nnoremap Y y$       " 从光标处复制到行尾
    nmap <silent> <leader>/ :nohlsearch<CR>

    " 进入当前文件的目录
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " 可视模式缩进不退出可视模式
    vnoremap < <gv
    vnoremap > >gv
    " 可视模式选择内容可以使用重复操作
    vnoremap . :normal .<CR>

    " 水平移动
    map zl zL
    map zh zH

    " Terminal
    tnoremap <Esc> <C-\><C-n>

    " 禁用方向键
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>

    noremap <silent>Q :confirm qall<cr>

    let g:quickfix_is_open = 0
    function! QuickfixToggle()
        if g:quickfix_is_open
            cclose
            let g:quickfix_is_open = 0
            execute g:quickfix_return_to_window . "wincmd w"
        else
            let g:quickfix_return_to_window = winnr()
            copen
            let g:quickfix_is_open = 1
        endif
    endfunction

    if OSX() && !has('nvim')
        set macmeta
    endif
" }
