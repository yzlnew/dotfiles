" 基础设置 {
    set encoding=utf-8
    if WINDOWS()                " gVim 菜单乱码
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
    endif
    set ttyfast
    set lazyredraw
    set history=500             " 历史指令数量
    filetype plugin indent on   " 文件类型
    syntax enable               " 支持语法高亮
    set mouse=a                 " 使用鼠标
    set mousehide               " 输入时隐藏鼠标指针
    scriptencoding utf-8        " UTF-8 文件编码
    set clipboard=unnamed       " 系统剪贴板使用匿名寄存器
    set shortmess+=cfilmnrxoOtT " 减少和缩写消息提示
    set viewoptions=folds,options,cursor,unix,slash
    set virtualedit=onemore     " 允许光标移动到超过行尾的位置
    set nospell                 " 禁用拼写检查
    set hidden                  " 隐藏缓冲区
    set cmdheight=2
    set tags=./.tags;,.tags
    " 自动切换到当前缓冲区文件目录
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! lcd %:p:h |
    " 编辑 git commit 时光标指向第一行
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
    " 光标回到之前位置
    function! ResCur()
        if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            silent normal! g`"
            return 1
        endif
    endfunction
    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
    " 备份 {
        set nobackup
        set nowritebackup
        if !isdirectory($HOME . '/.vim/files')
            call mkdir($HOME . '/.vim/files')
            " call mkdir($HOME . '/.vim/files/backup')
            call mkdir($HOME . '/.vim/files/swap')
            call mkdir($HOME . '/.vim/files/undo')
        endif
        " set backupdir=$HOME/.vim/files/backup/
        " set backupext=-vimbackup
        " set backupskip=
        set directory=$HOME/.vim/files/swap//
        if has('persistent_undo')
            set undofile
            set undodir=$HOME/.vim/files/undo/
            set undolevels=1000
            set undoreload=10000
        endif
    " }
" }

" 格式化 {
    set fo+=mB
    set sidescroll=1
    set conceallevel=2                   " Markdown 用到此项做语法隐藏
    set nowrap
    set autoindent
    set smartindent
    set shiftwidth=4
    set expandtab
    set tabstop=4
    set softtabstop=4
    set nojoinspaces
    set splitright
    set splitbelow
    set pastetoggle=<F12>                " 进入粘贴模式
    autocmd BufWritePre * %s/\s\+$//e    " 保存时清除行末空格
" }

