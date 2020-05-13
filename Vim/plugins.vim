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
        Plug 'yzlnew/vim-im-select', { 'on': [] }
        Plug 'yzlnew/lightline-theme-robin'
        if WINDOWS() && has('nvim')
            Plug 'yzlnew/smartim'
        endif
        if OSX()
            Plug 'dangxuandev/fcitx-vim-osx'    " 正常模式使用英文输入法
        endif
        if LINUX()
            Plug 'brglng/vim-im-select', {'on': [] }
        endif
        Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
        if has('nvim')
          Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
        else
          Plug 'Shougo/defx.nvim'
          Plug 'roxma/nvim-yarp'
          Plug 'roxma/vim-hug-neovim-rpc'
        endif
        Plug 'lervag/vimtex'                    " LaTeX
        Plug 'sheerun/vim-polyglot'             " 语法高亮等
        Plug 'alpertuna/vim-header'             " 头部信息生成
        Plug 'kristijanhusak/defx-icons'
        Plug 'kristijanhusak/defx-git'
        Plug 'vimwiki/vimwiki', {'on': ['VimwikiIndex','VimwikiDiaryIndex']}
        Plug 'tpope/vim-unimpaired'             " 一些有用的快捷键
        Plug 'liuchengxu/vista.vim'             " tags, symbols
        Plug 'junegunn/vim-easy-align'          " 文本对齐
        Plug 'mhinz/vim-startify'               " 启动页
        Plug 'cespare/vim-toml'                 " 支持 TOML
        Plug 'wakatime/vim-wakatime'            " Wakatime 编程记录
        Plug 'w0rp/ale'                         " 代码分析和自动修正
        Plug 'junegunn/vim-emoji'               " Emoji
        Plug 'mhinz/vim-signify'                " Git 标记
        Plug 'godlygeek/tabular'                " 对齐文本
        Plug 'plasticboy/vim-markdown'          " 支持 Markdown
        Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
        Plug 'skywind3000/asynctasks.vim'
        Plug 'skywind3000/asyncrun.vim'         " 异步执行命令行指令
        Plug 'itchyny/lightline.vim'            " Lightline
        Plug 'mengelbrecht/lightline-bufferline'
        Plug 'maximbaz/lightline-ale'
        Plug 'SirVer/ultisnips'                 " 代码片段引擎
        Plug 'honza/vim-snippets'               " 代码片段
        Plug 'tpope/vim-fugitive'               " Git
        Plug 'tpope/vim-surround'               " 更改包裹
        Plug 'tpope/vim-commentary'             " 快速注释 `gcc`
        Plug 'tpope/vim-repeat'                 " 重复
        Plug 'Krasjet/auto.pairs'               " 括号自动配对
        Plug 'luochen1990/rainbow'              " 彩虹括号
        Plug 'easymotion/vim-easymotion'        " 快速跳转
        Plug 'wellle/targets.vim'               " 额外的文本对象
        Plug 'lilydjwg/colorizer'               " RGB 颜色显示
        Plug 'mzlogin/vim-markdown-toc'         " Markdown 目录生成
        Plug 'liuchengxu/vim-which-key'
        Plug 'brglng/vim-sidebar-manager'
        Plug 'mbbill/undotree'
        Plug 'inkarkat/vim-ReplaceWithRegister'  " 粘贴并替换 `gr`
        Plug 'kkoomen/vim-doge'
        Plug 'skywind3000/vim-quickui'
        Plug 'ryanoasis/vim-devicons'           " 文件图标
        Plug 'Yggdroot/LeaderF'
        Plug 'yianwillis/vimcdoc'               " 中文文档
        Plug 'skywind3000/vim-terminal-help'
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-entire'
        Plug 'kana/vim-textobj-indent'
        Plug 'kana/vim-textobj-function'
        Plug 'bps/vim-textobj-python'
        Plug 'ianding1/leetcode.vim'
        Plug 'zef/vim-cycle'
        Plug 'patstockwell/vim-monokai-tasty'   " 以下都是一些主题
        Plug 'arcticicestudio/nord-vim'         " 暗色主题
        Plug 'iCyMind/NeoSolarized'             " 支持 True Color 的主题
        Plug 'lifepillar/vim-solarized8'        " 支持 nvim 的主题
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
        Plug 'dstein64/vim-startuptime'
        if WINDOWS()
            Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.cmd'}
        else
            Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
        endif
    call plug#end()
" }
