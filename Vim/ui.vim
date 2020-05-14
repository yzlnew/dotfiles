" UI 设定 {
    " 主题 {
    " 由于 macOS 的终端不支持 True Color，建议使用 iTerm2
    " 另支持正常和插入模式不同的光标样式
        set termguicolors
        hi! clear
        let darkmode = 1
        let g:forest_night_enable_italic = 1
        let g:vim_monokai_tasty_italic = 1
        let g:solarized_term_italics=1
        let g:neosolarized_italic=1
        let g:onedark_terminal_italics=1
        let g:material_terminal_italics = 1
        let g:material_theme_style = 'default'
        let g:nord_italic = 1
        let g:nord_cursor_line_number_background = 1
        let g:monokai_term_italic = 1
        let g:monokai_gui_italic = 1

        if OSX()
            let iterm_profile = $ITERM_PROFILE
            if iterm_profile == "robin_dark"
                set background=dark
                colorscheme forest-night
            else
                set background=light
                colorscheme github
            endif

            if $TERM_PROGRAM == 'Apple_Terminal'
                let g:solarized_use16 = 0
                let &t_SI.="\e[5 q"
                let &t_SR.="\e[4 q"
                let &t_EI.="\e[1 q"
            endif
            if $TERM_PROGRAM == 'iTerm.app'
                set termguicolors
                let &t_SI = "\<Esc>]50;CursorShape=1\x7"
                let &t_SR = "\<Esc>]50;CursorShape=2\x7"
                let &t_EI = "\<Esc>]50;CursorShape=0\x7"
            endif
        endif

        if LINUX()
            if darkmode == 1
                set background=dark
                colorscheme forest-night
            else
                set background=light
                colorscheme github
            endif
        endif

        if WINDOWS()
            if darkmode == 1
                set background=dark
                colorscheme darcula
            else
                set background=light
                colorscheme gruvbox-material
            endif
            let &t_SI.="\e[5 q"
            let &t_SR.="\e[4 q"
            let &t_EI.="\e[1 q"
        endif

        if has('gui_running')
            if WINDOWS()
                " set guifont=SF_Mono:h10
                set guifont=JetBrainsMono_NF:h11,Sarasa\ Mono\ SC:h11
                " set guifont=SFMono_NF:h11,Sarasa\ Mono\ SC:h11
                " set guifont=Operator_Mono_Book:h12,Sarasa\ Mono\ SC:h12
                " set guifont=FiraCode_NF:h11
                set guifontwide=Sarasa\ Mono\ SC:h12
            else
                set guifont=OperatorMonoSSm\ NF:h14
            endif
            " set go-=m
            set go-=e
            set go-=T
            set go-=r
            set go-=i
            set go-=L
            set go-=R
            set renderoptions=type:directx
            set lines=50 columns=100
            " highlight clear LineNr
            " highlight clear SignColumn
            " highlight LineNr guibg=NONE
            " highlight Comment gui=italic
        endif
        hi Cursor gui=reverse guibg=NONE guifg=NONE
        highlight Keyword cterm=italic gui=italic
        highlight Comment cterm=italic gui=italic
    " }
    set noshowmode
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
        set statusline+=\ [%{&ff}/%Y]
        set statusline+=\ [%{getcwd()}]
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%
    endif
    set showtabline=2
    set number                  " 显示行号
    set relativenumber
    set cursorline              " 高亮当前行
    " highlight clear SignColumn  " 去除标志列背景
    " highlight clear LineNr      " 去除行号背景
    " hi Normal     ctermbg=NONE guibg=NONE
    hi LineNr     ctermbg=NONE guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    set backspace=indent,eol,start
    set showmatch               " 括号匹配
    set incsearch               " 同步搜索
    set hlsearch                " 高亮搜索
    set winminheight=0          " 允许窗口高度为0
    set ignorecase              " 大小写不敏感
    set smartcase               " 使用大写字符时开启大小写敏感
    set wildmenu                " Tab 补全候选
    " set wildmode=list:longest,full
    set whichwrap=b,s,<,>,[,]   " 在行首行尾可以移动到另一行
    set scrolljump=5            " 光标离开屏幕时滚动的行数
    set scrolloff=3             " 收尾留的行数
    set nofoldenable            " 关闭代码折叠
    set list                    " 显示可能引起的空白字符
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
    set fillchars+=vert:│
" }
