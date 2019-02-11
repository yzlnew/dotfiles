" 简介 {
" 设置本文档的默认折叠模式为标记
" 参考：http://vim.wikia.com/wiki/Modeline_magic
" vim: foldmethod=marker foldlevel=0 foldmarker={,}
" 自己使用的 Vim 配置
" 主要平台：macOS / 终端：iTerm2 / 主题：Solarized-Light / 推荐字体：Nerd Fonts
" Copyright 2019 @yzlnew
" }

" 插件管理 {
" 使用 vim-plug 进行插件管理
" 参考：https://github.com/junegunn/vim-plug
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    call plug#begin('~/.vim/plugged')
        Plug 'scrooloose/nerdtree'              " 目录树
        Plug 'ryanoasis/vim-devicons'           " 文件图标
        Plug 'mhinz/vim-startify'               " 启动页
        Plug 'CodeFalling/fcitx-vim-osx'        " 正常模式使用英文输入法
        Plug 'cespare/vim-toml'                 " 支持 TOML
        Plug 'junegunn/fzf.vim'                 " fzf 文件模糊搜索
        Plug 'wakatime/vim-wakatime'            " Wakatime 编程记录
        Plug 'w0rp/ale'                         " 代码分析和自动修正
        Plug 'junegunn/vim-emoji'               " Emoji
        Plug 'airblade/vim-gitgutter'           " Git 标记
        Plug 'iCyMind/NeoSolarized'             " 支持 True Color 的主题
        Plug 'altercation/vim-colors-solarized' " Solarized 主题
        Plug 'godlygeek/tabular'                " 对齐文本
        Plug 'plasticboy/vim-markdown'          " 支持 Markdown
        Plug 'suan/vim-instant-markdown'        " Markdown 预览
        Plug 'skywind3000/asyncrun.vim'         " 异步执行命令行指令
        Plug 'vim-airline/vim-airline'          " Airline 状态栏
        Plug 'vim-airline/vim-airline-themes'   " Airline 主题
        Plug 'Valloric/YouCompleteMe'           " 代码补全
        Plug 'SirVer/ultisnips'                 " 代码片段引擎
        Plug 'honza/vim-snippets'               " 代码片段
        Plug 'tpope/vim-fugitive'               " Git
        Plug 'tpope/vim-surround'               " 更改包裹
        Plug 'scrooloose/nerdcommenter'         " 注释
        Plug 'jiangmiao/auto-pairs'             " 括号自动配对
        Plug 'luochen1990/rainbow'              " 彩虹括号
        Plug 'easymotion/vim-easymotion'        " 快速跳转
        Plug 'junegunn/goyo.vim'                " 专注模式
        Plug 'amix/vim-zenroom2'                " 禅模式
    call plug#end()
" }

" 基础设置 {
    set nocompatible        " 不兼容 Vi
    set history=500             " 历史指令数量
    filetype plugin indent on   " 文件类型
    syntax enable               " 支持语法高亮
    set mouse=a                 " 使用鼠标
    set mousehide               " 输入时隐藏鼠标指针
    set encoding=utf-8
    scriptencoding utf-8        " UTF-8 文件编码
    set clipboard=unnamed       " 系统剪贴板使用匿名寄存器
    set shortmess+=filmnrxoOtT  " 减少和缩写消息提示
    set viewoptions=folds,options,cursor,unix,slash
    set virtualedit=onemore     " 允许光标移动到超过行尾的位置
    set nospell                 " 禁用拼写检查
    set hidden                  " 隐藏缓冲区
    " 自动切换到当前缓冲区文件目录
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h |
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
        set backup
        if !isdirectory($HOME . '/.vim/files')
            call mkdir($HOME . '/.vim/files')
            call mkdir($HOME . '/.vim/files/backup')
            call mkdir($HOME . '/.vim/files/swap')
            call mkdir($HOME . '/.vim/files/undo')
        endif
        set backupdir=$HOME/.vim/files/backup/
        set backupext=-vimbackup
        set backupskip=
        set directory=$HOME/.vim/files/swap//
        if has('persistent_undo')
            set undofile
            set undodir=$HOME/.vim/files/undo/
            set undolevels=1000
            set undoreload=10000
        endif
    " }
" }

" UI 设定 {
    " 主题 {
    " 由于 macOS 的终端不支持 True Color，建议使用 iTerm2
    " 另支持正常和插入模式不同的光标样式
        set background=light    " 浅色背景
        if $TERM_PROGRAM == 'Apple_Terminal'
            colorscheme solarized
            let &t_SI.="\e[5 q"
            let &t_SR.="\e[4 q"
            let &t_EI.="\e[1 q"
        endif
        if $TERM_PROGRAM == 'iTerm.app'
            set termguicolors
            colorscheme NeoSolarized
            let &t_SI = "\<Esc>]50;CursorShape=1\x7"
            let &t_SR = "\<Esc>]50;CursorShape=2\x7"
            let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        endif
        if has('gui_running')
            set guifont=FantasqueSansMono\ Nerd\ Font:h18
            set guifontwide=Noto\ Sans\ CJK\ SC:h16
            set shell=/bin/zsh
            highlight clear SignColumn
            " highlight LineNr guibg=NONE
            set background=light
            set termguicolors
            colorscheme NeoSolarized
            highlight Comment gui=italic
        endif
    " }
    set noshowmode              " 不显示当前模式，使用 Airline
    set colorcolumn=81
    if has('cmdline_info')
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set showcmd
    endif

    if has('statusline')
        set laststatus=2

        set statusline=%<%f\
        set statusline+=%w%h%m%r
        if !exists('g:override_spf13_bundles')
            set statusline+=%{fugitive#statusline()}
        endif
        set statusline+=\ [%{&ff}/%Y]
        set statusline+=\ [%{getcwd()}]
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%
    endif
    set number                  " 显示行号
    set cursorline              " 高亮当前行
    highlight clear SignColumn  " 去除标志列背景
    " highlight clear LineNr      " 去除行号背景
    highlight LineNr guibg=NONE
    set backspace=indent,eol,start
    set showmatch               " 括号匹配
    set incsearch               " 同步搜索
    set hlsearch                " 高亮搜索
    set winminheight=0          " 允许窗口高度为0
    set ignorecase              " 大小写不敏感
    set smartcase               " 使用大写字符时开启大小写敏感
    set wildmenu                " Tab 补全候选
    set wildmode=list:longest,full
    set whichwrap=b,s,<,>,[,]   " 在行首行尾可以移动到另一行
    set scrolljump=5            " 光标离开屏幕时滚动的行数
    set scrolloff=3             " 收尾留的行数
    set foldenable              " 打开代码折叠
    set list                    " 显示可能引起的空白字符
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
" }

" 格式化 {
    set conceallevel=2                   " Markdown 用到此项做语法隐藏
    set nowrap
    set autoindent
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

" 快捷键 {
    let mapleader=','
    " 窗口快速移动 {
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    " }
    " 折行移动到显示的下一行
    noremap j gj
    noremap k gk
    nnoremap Y y$       " 从光标处复制到行尾
    " 折叠选项 {
        nmap <leader>f0 :set foldlevel=0<CR>
        nmap <leader>f1 :set foldlevel=1<CR>
        nmap <leader>f2 :set foldlevel=2<CR>
        nmap <leader>f3 :set foldlevel=3<CR>
        nmap <leader>f4 :set foldlevel=4<CR>
        nmap <leader>f5 :set foldlevel=5<CR>
        nmap <leader>f6 :set foldlevel=6<CR>
        nmap <leader>f7 :set foldlevel=7<CR>
        nmap <leader>f8 :set foldlevel=8<CR>
        nmap <leader>f9 :set foldlevel=9<CR>
    " }
    nmap <silent> <leader>/ :nohlsearch<CR>    " 清除搜索结果高亮

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

" }

" 插件设定 {
    " Airline {
        let g:airline_powerline_fonts = 1
        let g:airline_solarized_bg='light'
        let g:airline_theme='solarized'
        let g:airline#extensions#ale#enabled = 1
        let g:airline#extensions#ale#error_symbol = "\uE00A"
        let g:airline#extensions#ale#warning_symbol = "\uE009"
        let g:airline#extensions#tabline#enabled = 1
    " }
    " ALE {
        let g:ale_set_highlights = 0
        let g:ale_sign_error = 'x'
        let g:ale_sign_warning = '•'
        let g:ale_echo_msg_format = "%severity% \uF101 %s \uF101 %linter%"
        let g:ale_echo_msg_error_str = "\uF2D3 Error"
        let g:ale_echo_msg_info_str = "\uF05A Info"
        let g:ale_echo_msg_warning_str = "\uF071 Warning"
        let g:ale_writegood_use_global = 1
        let g:ale_change_sign_column_color = 0
        let g:ale_sign_column_always = 1
        let g:ale_fixers = {
        \   'python': ['autopep8','isort','yapf',
        \              'add_blank_lines_for_python_control_statements'],
        \   'markdown': ['prettier','trim_whitespace'],
        \    'cpp': ['clang-format','trim_whitespace'],
        \}
    " }
    " Gitgutter {
        highlight GitGutterAdd ctermfg=green
        highlight GitGutterChange ctermfg=yellow
        highlight GitGutterDelete ctermfg=red
        highlight GitGutterChangeDelete ctermfg=yellow
    " }
    " Markdown {
        let g:tex_conceal = ""
        let g:vim_markdown_math = 1
        let g:vim_markdown_frontmatter = 1
        let g:vim_markdown_folding_disabled = 1
        " let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
        let g:instant_markdown_autostart = 0
    " }
    " fzf {
        set rtp+=/usr/local/opt/fzf
        let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
          \ 'bg':      ['bg', 'Normal'],
          \ 'hl':      ['fg', 'Comment'],
          \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \ 'hl+':     ['fg', 'Statement'],
          \ 'info':    ['fg', 'PreProc'],
          \ 'border':  ['fg', 'Ignore'],
          \ 'prompt':  ['fg', 'Conditional'],
          \ 'pointer': ['fg', 'Exception'],
          \ 'marker':  ['fg', 'Keyword'],
          \ 'spinner': ['fg', 'Label'],
          \ 'header':  ['fg', 'Comment'] }
    " }
    " YCM {
        let g:ycm_autoclose_preview_window_after_completion=1
        let g:ycm_collect_identifiers_from_tags_files = 1
        nmap <leader>gt :YcmCompleter GoTo<CR>
        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    " }
    " UltiSnips {
        let g:UltiSnipsExpandTrigger = '<C-j>'
        let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsSnippetsDir='~/.vim/my-snippets'
        let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]
    " }
    " EasyMotion {
        map <Leader>L <Plug>(easymotion-bd-jk)
    " }
    " NERDTree {
        map <leader>nt :NERDTreeToggle<CR>
        nmap <leader>ntf :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }
    " NERDCommenter {
    let g:NERDSpaceDelims=1
    " }
    " startify {
        let g:ascii = [
        \ '    |\__/,| ',
        \ '  _.|o o  |_ Hello, Robin!',
        \ ]
        let g:startify_custom_header = g:ascii + startify#fortune#boxed()
    " }
" }
