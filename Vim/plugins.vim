" 插件管理 {
" 使用 vim-plug 进行插件管理
    if !WINDOWS()
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
    endif

    call plug#begin('~/.vim/plugged')
        Plug 'yzlnew/lightline-theme-robin'                   " 自己的一些主题
        if has('nvim')
            Plug 'nvim-treesitter/nvim-treesitter'
        endif
        if WINDOWS() && has('nvim')
            Plug 'yzlnew/smartim'
        endif
        if OSX()
            Plug 'dangxuandev/fcitx-vim-osx'                  " 正常模式使用英文输入法
        endif
        if LINUX()
            Plug 'brglng/vim-im-select', {'on': [] }
        endif
        Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
        Plug 'lervag/vimtex', {'for': 'tex'}                  " LaTeX
        Plug 'alpertuna/vim-header', {'on': 'AddHeader'}      " 头部信息生成
        Plug 'vimwiki/vimwiki'
        Plug 'tpope/vim-unimpaired'                           " 一些有用的快捷键
        Plug 'liuchengxu/vista.vim', {'on': 'Vista'}
        Plug 'junegunn/vim-easy-align'                        " 文本对齐
        Plug 'mhinz/vim-startify'                             " 启动页
        Plug 'cespare/vim-toml', {'for': 'toml'}              " 支持 TOML
        Plug 'wakatime/vim-wakatime'                          " Wakatime 编程记录
        Plug 'w0rp/ale'                                       " 代码分析和自动修正
        Plug 'junegunn/vim-emoji'                             " Emoji
        Plug 'mhinz/vim-signify'                              " Git 标记
        Plug 'godlygeek/tabular'                              " 对齐文本
        Plug 'plasticboy/vim-markdown', {'for': ['markdown','vimwiki']}
        Plug 'suan/vim-instant-markdown', {'for': ['markdown','vimwiki']}
        Plug 'mzlogin/vim-markdown-toc', {'for': ['markdown','vimwiki']}
        Plug 'skywind3000/asynctasks.vim'
        Plug 'skywind3000/asyncrun.vim'                       " 异步执行命令行指令
        Plug 'skywind3000/vim-quickui'                        " 右键和菜单 UI
        Plug 'skywind3000/vim-terminal-help'
        Plug 'itchyny/lightline.vim'                          " Lightline
        Plug 'mengelbrecht/lightline-bufferline'
        Plug 'maximbaz/lightline-ale'
        Plug 'SirVer/ultisnips'                               " 代码片段引擎
        Plug 'honza/vim-snippets'                             " 代码片段
        Plug 'tpope/vim-fugitive'                             " Git
        Plug 'tpope/vim-surround'                             " 更改包裹
        Plug 'tpope/vim-commentary'                           " 快速注释 `gcc`
        Plug 'tpope/vim-repeat'                               " 重复
        Plug 'Krasjet/auto.pairs'                             " 括号自动配对
        Plug 'luochen1990/rainbow'                            " 彩虹括号
        Plug 'easymotion/vim-easymotion'                      " 快速跳转
        Plug 'wellle/targets.vim'                             " 额外的文本对象
        Plug 'lilydjwg/colorizer'                             " RGB 颜色显示
        Plug 'liuchengxu/vim-which-key'                       " 快捷键提示
        Plug 'brglng/vim-sidebar-manager'                     " 边栏管理
        Plug 'mbbill/undotree'
        Plug 'inkarkat/vim-ReplaceWithRegister'               " 粘贴并替换 `gr`
        Plug 'kkoomen/vim-doge'                               " 文档生成
        Plug 'ryanoasis/vim-devicons'                         " 文件图标
        Plug 'Yggdroot/LeaderF'                               " 模糊匹配
        Plug 'Yggdroot/indentLine'
        Plug 'yianwillis/vimcdoc'                             " 中文文档
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        Plug 'kana/vim-textobj-user'                          " 文本对象套餐
        Plug 'kana/vim-textobj-entire'                        " ae(ntire)
        Plug 'kana/vim-textobj-indent'
        Plug 'kana/vim-textobj-function'                      " a(function)
        Plug 'bps/vim-textobj-python'
        Plug 'ianding1/leetcode.vim'
        Plug 'zef/vim-cycle'
        Plug 'chrisbra/csv.vim', {'for': ['csv']}
        Plug 'dstein64/vim-startuptime'
        " 以下都是一些主题
        Plug 'sonph/onehalf', {'rtp': 'vim/'}
        Plug 'NLKNguyen/papercolor-theme'
        Plug 'chuling/ci_dark'
        Plug 'ayu-theme/ayu-vim'
        Plug 'patstockwell/vim-monokai-tasty'
        Plug 'arcticicestudio/nord-vim'
        Plug 'iCyMind/NeoSolarized'
        Plug 'lifepillar/vim-solarized8'
        Plug 'joshdick/onedark.vim'
        Plug 'rakr/vim-one'
        Plug 'rakr/vim-two-firewatch'
        Plug 'kaicataldo/material.vim'
        Plug 'crusoexia/vim-monokai'
        Plug 'dikiaap/minimalist'
        Plug 'hzchirs/vim-material'
        Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
        Plug 'cormacrelf/vim-colors-github'
        Plug 'sainnhe/vim-color-forest-night'
        Plug 'Rigellute/shades-of-purple.vim'
        Plug 'doums/darcula'
        Plug 'sheerun/vim-polyglot'                           " 语法高亮等
        if WINDOWS()
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
        else
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
        endif
    call plug#end()
" }
