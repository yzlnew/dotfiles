" 插件设定 {
    " Surround {
        nmap <leader>sw ysiw
        nmap <leader>sW ysiW
    " }
    " Signify {
        let g:signify_vsc_list = ['git']
        let g:signify_realtime = 0
        let g:signify_line_highlight = 1
        nmap <leader>gj <plug>(signify-next-hunk)
        nmap <leader>gk <plug>(signify-prev-hunk)
        nmap <leader>gJ 9999<leader>gj
        nmap <leader>gK 9999<leader>gk
    " }
    " Lightline {
        let g:lightline = {}
        let g:lightline.separator = { 'left': '', 'right': '' }
        let g:lightline.subseparator = { 'left': '', 'right': '' }
        let g:lightline.component = {
              \  'me': '@yzlnew',
              \  'lineinfo': '%3l:%-2v',
              \  'close': '%999X  '
              \  }
        let g:lightline.component_function = {
              \  'cocstatus': 'coc#status',
              \  'readonly': 'LightlineReadonly',
              \  'fugitive': 'LightlineFugitive',
              \  'filetype': 'Filetype',
              \  'fileformat': 'Fileformat',
              \  'modified': 'LightlineModified'
              \  }
        let g:lightline.component_expand = {
              \  'linter_checking': 'lightline#ale#checking',
              \  'linter_warnings': 'lightline#ale#warnings',
              \  'linter_errors': 'lightline#ale#errors',
              \  'linter_ok': 'lightline#ale#ok',
              \  'buffers': 'lightline#bufferline#buffers'
              \  }
        let g:lightline.component_type = {
              \  'linter_checking': 'left',
              \  'linter_warnings': 'warning',
              \  'linter_errors': 'error',
              \  'linter_ok': 'left',
              \  'buffers': 'tabsel',
              \  }
        let g:lightline.component_raw = {'buffers': 1}
        let g:lightline#ale#indicator_checking = ""
        let g:lightline#ale#indicator_warnings = "!"
        let g:lightline#ale#indicator_errors = "×"
        let g:lightline#ale#indicator_ok = ""
        " let g:lightline.separator = {'left': '', 'right': ''}
        " let g:lightline.subseparator = {'left': '', 'right': ''}
        let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
        let g:lightline.active = {
              \  'left': [ [ 'mode', 'paste' ],
              \            [ 'fugitive', 'readonly', 'filename', 'modified', 'me' ] ],
              \  'right': [ [ 'cocstatus' ],
              \             [ 'lineinfo', 'percent' ],
              \             [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
              \  }
        let g:lightline#bufferline#enable_devicons = 1
        let g:lightline#bufferline#unicode_symbols = 0
        let g:lightline#bufferline#clickable = 1
        function! Filetype()
          return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
        endfunction
        function! Fileformat()
          return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
        endfunction
        function! LightlineReadonly()
            return &readonly ? '' : ''
        endfunction
        function! LightlineModified()
            return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
        endfunction
        function! LightlineFugitive()
            if exists('*fugitive#head')
                let branch = fugitive#head()
                return branch !=# '' ? ' '.branch : ''
            endif
            return ''
        endfunction
        function! UpdateLightline() abort
            augroup ReloadLightline
                au!
                let colors_name = get(g:, 'colors_name', 'default')
                let g:lightline.colorscheme = colors_name
                if colors_name == 'forest-night'
                    let g:lightline.colorscheme = 'forest_night'
                endif
                if colors_name == 'darcula'
                    let g:lightline.colorscheme = 'darcula_robin'
                endif
                if colors_name == 'gruvbox-material'
                    let g:lightline.colorscheme = 'gruvbox_material'
                endif
                if colors_name == 'solarized8'
                    if &background ==# 'dark'
                        let g:lightline.colorscheme = 'solarized_flood'
                    else
                        let g:lightline.colorscheme = 'solarized'
                    endif
                endif
            augroup END
            call lightline#init()
            call lightline#colorscheme()
            call lightline#update()
        endfunction
        autocmd ColorScheme,WinEnter,BufEnter,VimEnter,TextChanged * call UpdateLightline()
    " }
    " ALE {
        nmap <leader>a <Plug>(ale_fix)
        let g:ale_enabled = 0
        let g:ale_set_highlights = 0
        let g:ale_sign_error = 'x'
        let g:ale_sign_warning = '!'
        let g:ale_echo_msg_format = "%severity%: %s  [%linter%]"
        let g:ale_echo_msg_error_str = "Error"
        let g:ale_echo_msg_info_str = "Info"
        let g:ale_echo_msg_warning_str = "Warning"
        let g:ale_writegood_use_global = 1
        let g:ale_change_sign_column_color = 0
        let g:ale_sign_column_always = 1
        let g:ale_fixers = {
        \   'python': ['black','isort','yapf'],
        \   'markdown': ['prettier','trim_whitespace'],
        \   'cpp': ['clang-format','trim_whitespace'],
        \   'tex': ['latexindent'],
        \   'json': ['prettier'],
        \   'html': ['prettier'],
        \}
        let g:ale_c_clangformat_options = '-style="{BasedOnStyle: llvm}"'
    " }
    " Markdown {
        let g:tex_conceal = ""
        let g:vim_markdown_math = 1
        let g:vim_markdown_frontmatter = 1
        let g:vim_markdown_folding_disabled = 1
        " let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
        let g:instant_markdown_autostart = 0
    " }
    " COC {
        let g:coc_global_extensions = [
                        \ 'coc-json',
                        \ 'coc-word',
                        \ 'coc-vimtex',
                        \ 'coc-lists',
                        \ 'coc-yank',
                        \ 'coc-snippets',
                        \ 'coc-python',
                        \ 'coc-ultisnips',
                        \ 'coc-tasks',
                        \ 'coc-emoji'
                    \ ]
        let g:coc_status_error_sign = '×'
        let g:coc_status_warning_sign = '!'
        " hi IncSearch gui=reverse
        hi! link HighlightedyankRegion DiffDelete
        nmap <leader>ge :CocCommand explorer<CR>

        " Use tab for trigger completion with characters ahead and navigate.
        " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction

        " Use <c-space> to trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()

        if has('patch8.1.1068')
          " Use `complete_info` if your (Neo)Vim version supports it.
          inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
        else
          imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        endif

        set signcolumn=yes
        set updatetime=100
        " Use `[c` and `]c` to navigate diagnostics
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)

        " Remap keys for gotos
        nmap <silent> <leader>gd <Plug>(coc-definition)
        nmap <silent> <leader>gy <Plug>(coc-type-definition)
        nmap <silent> <leader>gi <Plug>(coc-implementation)
        nmap <silent> <leader>gf <Plug>(coc-references)

        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction

        " Highlight symbol under cursor on CursorHold
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Remap for rename current word
        nmap <leader>cr <Plug>(coc-rename)

        " Remap for format selected region
        vmap <leader>cf  <Plug>(coc-format-selected)
        nmap <leader>cf  <Plug>(coc-format-selected)

        augroup mygroup
          autocmd!
          " Setup formatexpr specified filetype(s).
          autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
          " Update signature help on jump placeholder
          autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        augroup end

        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        vmap <leader>cs  <Plug>(coc-codeaction-selected)
        nmap <leader>cs  <Plug>(coc-codeaction-selected)

        " Remap for do codeAction of current line
        nmap <leader>ca  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>cq  <Plug>(coc-fix-current)

        " Create mappings for function text object, requires document symbols feature of languageserver.
        xmap if <Plug>(coc-funcobj-i)
        xmap af <Plug>(coc-funcobj-a)
        omap if <Plug>(coc-funcobj-i)
        omap af <Plug>(coc-funcobj-a)

        " Use `:Format` to format current buffer
        command! -nargs=0 Format :call CocAction('format')

        " Use `:Fold` to fold current buffer
        command! -nargs=? Fold :call     CocAction('fold', <f-args>)

        " Using CocList
        nnoremap <silent> <leader>cb  :<C-u>CocList buffers<cr>
        " Show maps
        nnoremap <silent> <leader>cm  :<C-u>CocList maps<cr>
        " Show all diagnostics
        nnoremap <silent> <leader>ca  :<C-u>CocList diagnostics<cr>
        " Manage extensions
        nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
        " Show commands
        nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
        " Find symbol of current document
        nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
        " Search workspace symbols
        nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
        " Tasks
        nnoremap <silent> <leader>ct  :<C-u>CocList tasks<cr>
        " Do default action for next item.
        nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
        " Resume latest coc list
        nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
        " Open CocList
        nnoremap <silent> <leader>cl  :<C-u>CocList<CR>
    " }
    " UltiSnips {
        let g:UltiSnipsExpandTrigger = '<C-j>'
        let g:UltiSnipsJumpForwardTrigger = '<C-j>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsSnippetsDir='~/.vim/usnips'
        let g:UltiSnipsSnippetDirectories=["UltiSnips", "usnips"]
    " }
    " EasyMotion {
        " map <leader><leader>L <Plug>(easymotion-bd-jk)
    " }
    " NERDTree {
        map <leader>e :NERDTreeToggle<CR>
        nmap <leader>ntf :NERDTreeFind<CR>
        let g:NERDTreeMapChangeRoot = 'l'
        let g:NERDTreeMapUpdir = 'h'

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:NERDTreeHijackNetrw=1
    " }
    " defx {
        " nmap <leader>e :Defx<CR>
        " call defx#custom#option('_', {
        "       \ 'columns': 'mark:git:indent:icons:filename',
        "       \ 'winwidth': 40,
        "       \ 'split': 'vertical',
        "       \ 'direction': 'topleft',
        "       \ 'show_ignored_files': 0,
        "       \ 'buffer_name': '',
        "       \ 'toggle': 1,
        "       \ 'resume': 1
        "       \ })
        " call defx#custom#column('icon', {
        "       \ 'directory_icon': '',
        "       \ 'opened_icon': '',
        "       \ 'root_icon': ""
        "       \ })
        " call defx#custom#column('mark', {
        "       \ 'readonly_icon': "",
        "       \ 'selected_icon': "",
        "       \ })
        " let g:defx_git#indicators = {
        "   \ 'Modified'  : '∙',
        "   \ 'Staged'    : '+',
        "   \ 'Untracked' : '*',
        "   \ 'Renamed'   : '→',
        "   \ 'Unmerged'  : '=',
        "   \ 'Ignored'   : '☒',
        "   \ 'Deleted'   : '✗',
        "   \ 'Unknown'   : '?'
        "   \ }
        " autocmd FileType defx call s:defx_my_settings()
        " function! s:defx_my_settings() abort
        "   " Define mappings
        "   nnoremap <silent><buffer><expr> <CR>
        "   \ defx#do_action('drop')
        "   nnoremap <silent><buffer><expr> c
        "   \ defx#do_action('copy')
        "   nnoremap <silent><buffer><expr> m
        "   \ defx#do_action('move')
        "   nnoremap <silent><buffer><expr> p
        "   \ defx#do_action('paste')
        "   nnoremap <silent><buffer><expr> l
        "   \ defx#do_action('open')
        "   nnoremap <silent><buffer><expr> E
        "   \ defx#do_action('open', 'vsplit')
        "   nnoremap <silent><buffer><expr> P
        "   \ defx#do_action('open', 'pedit')
        "   nnoremap <silent><buffer><expr> o
        "   \ defx#do_action('open_or_close_tree')
        "   nnoremap <silent><buffer><expr> K
        "   \ defx#do_action('new_directory')
        "   nnoremap <silent><buffer><expr> N
        "   \ defx#do_action('new_file')
        "   nnoremap <silent><buffer><expr> M
        "   \ defx#do_action('new_multiple_files')
        "   nnoremap <silent><buffer><expr> C
        "   \ defx#do_action('toggle_columns',
        "   \                'mark:indent:icon:filename:type:size:time')
        "   nnoremap <silent><buffer><expr> S
        "   \ defx#do_action('toggle_sort', 'time')
        "   nnoremap <silent><buffer><expr> d
        "   \ defx#do_action('remove')
        "   nnoremap <silent><buffer><expr> r
        "   \ defx#do_action('rename')
        "   nnoremap <silent><buffer><expr> !
        "   \ defx#do_action('execute_command')
        "   nnoremap <silent><buffer><expr> x
        "   \ defx#do_action('execute_system')
        "   nnoremap <silent><buffer><expr> yy
        "   \ defx#do_action('yank_path')
        "   nnoremap <silent><buffer><expr> .
        "   \ defx#do_action('toggle_ignored_files')
        "   nnoremap <silent><buffer><expr> ;
        "   \ defx#do_action('repeat')
        "   nnoremap <silent><buffer><expr> h
        "   \ defx#do_action('cd', ['..'])
        "   nnoremap <silent><buffer><expr> ~
        "   \ defx#do_action('cd')
        "   nnoremap <silent><buffer><expr> q
        "   \ defx#do_action('quit')
        "   nnoremap <silent><buffer><expr> <Space>
        "   \ defx#do_action('toggle_select') . 'j'
        "   nnoremap <silent><buffer><expr> *
        "   \ defx#do_action('toggle_select_all')
        "   nnoremap <silent><buffer><expr> j
        "   \ line('.') == line('$') ? 'gg' : 'j'
        "   nnoremap <silent><buffer><expr> k
        "   \ line('.') == 1 ? 'G' : 'k'
        "   nnoremap <silent><buffer><expr> <C-l>
        "   \ defx#do_action('redraw')
        "   nnoremap <silent><buffer><expr> <C-g>
        "   \ defx#do_action('print')
        "   nnoremap <silent><buffer><expr> cd
        "   \ defx#do_action('change_vim_cwd')
        " endfunction
    " }
    " startify {
        let g:startify_lists = [
              \ { 'type': 'files',     'header': ['      Files']          },
              \ { 'type': 'dir',       'header': ['      MRU '. getcwd()] },
              \ { 'type': 'sessions',  'header': ['      Sessions']       },
              \ { 'type': 'bookmarks', 'header': ['      Bookmarks']      },
              \ { 'type': 'commands',  'header': ['    גּ  Commands']       },
              \ ]
        let g:ascii = [
        \ '    |\__/,| ',
        \ '  _.|o o  |_ Hello, Robin!',
        \ ]
        " let g:startify_custom_header = g:ascii + startify#fortune#boxed()
        let g:startify_custom_header = g:ascii
        let g:startify_session_dir = '~/.vim/session'
        let g:startify_bookmarks = ['~/dotfiles',{'g':'G:/'}]
    " }
    " AutoPairs {
        " let g:AutoPairsShortcutFastWrap = '<M-i>'
        " let g:AutoPairsShortcutJump = '<M-u>'
    " }
    " Vimtex {
        nmap <leader>vr :VimtexReload<CR>
        nmap <leader>vc :update \| VimtexCompileSS<CR>
        nmap <leader>vv :VimtexView<CR>
        let g:tex_flavor = 'latex'
        let g:vimtex_syntax_enabled = 1
        let g:vimtex_compiler_latexmk = {
                \ 'executable' : 'latexmk',
                \ 'options' : [
                \   '-xelatex',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}
        if OSX()
            let g:vimtex_view_enabled = 1
            let g:vimtex_view_method = 'skim'
        endif
        " if has('nvim')
        "     let g:vimtex_compiler_progname = 'nvr'
        " endif
        if LINUX()
            let g:vimtex_view_general_viewer = 'mupdf'
            " let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
            " let g:vimtex_view_general_options_latexmk = '--unique'
            " let g:vimtex_compiler_latexmk_engines = 'xelatex'
        endif
        if WINDOWS()
            let g:vimtex_view_general_viewer = 'SumatraPDF'
            let g:vimtex_view_general_options
                \ = '-reuse-instance -forward-search @tex @line @pdf'
            let g:vimtex_view_general_options_latexmk = '-reuse-instance'
        endif
    " }
    " Smartim {
        let g:smartim_default = '1033'
    " }
    " { header
        let g:header_field_author = '@yzlnew'
        let g:header_field_author_email = 'yzlnew@gmail.com'
        let g:header_auto_add_header = 0
    " }
    " vimwiki {
      let g:vimwiki_global_ext = 0
      let g:vimwiki_list = [{'path': '~/yzlwiki/',
                           \ 'syntax': 'markdown', 'ext': '.md'}]
      let g:vimwiki_table_mappings = 0
      inoremap <F11> <Esc>:VimwikiReturn 1 5<CR>
    " }
    " which-key {
      " highlight! default link WhichKeyFloating DiffAdd
      call which_key#register(' ', "g:which_key_map")
      nnoremap <silent> <space> :WhichKey ' '<CR>
      let g:which_key_floating_opts = {}
      let g:which_key_hspace = 2
      let g:which_key_sep = '>'
      let g:which_key_use_floating_win = 1
      let g:which_key_position = 'topleft'
      let g:which_key_map =  {}
      let g:which_key_map.g = {'name' : '+Goto'}
      let g:which_key_map.f = {'name' : '+Leaderf'}
      let g:which_key_map.n = {'name' : '+Nerdtree'}
      let g:which_key_map.s = {'name' : '+Surround'}
      let g:which_key_map.t = {'name' : '+Task'}
      let g:which_key_map.v = {'name' : '+Vimtex'}
      let g:which_key_map.w = {'name' : '+Wiki'}
      let g:which_key_map.c = {'name' : '+Coc',
                  \ 'q' : 'fix current',
                  \ 'f' : 'format',
                  \ 'r' : 'rename',
                  \ 'b' : 'buffers',
                  \ 'a' : 'diagnostics',
                  \ 'c' : 'command',
                  \ 'e' : 'extensions',
                  \ 'o' : 'outline',
                  \ 'm' : 'maps',
                  \ 's' : 'symbols',
                  \ 't' : 'tasks',
                  \ 'ca' : 'codeaction',
                  \ 'cs' : 'codeaction selected',
                  \ }
      noremap <leader>ov :e ~/dotfiles/Vim/vimrc<CR>
      let g:which_key_map.o = {'name' : '+Open',
                  \ 'v' : 'vimrc',
                  \ 's' : ['Startify', 'startify'],
                  \ 'e' : ['Defx', 'explorer'],
                  \ 'c' : ['CocList', 'coc list'],
                  \}
      let g:which_key_map.p = {'name' : '+Plug',
                  \ 'u' : ['PlugUpdate', 'update'],
                  \ 'i' : ['PlugInstall', 'install'],
                  \ 'c' : ['PlugClean', 'clean'],
                  \}
      let g:which_key_map.e = 'Explorer'
      let g:which_key_map.a = 'ALEFix'
      let g:which_key_map.q = 'Quick UI'
      let g:which_key_map.d = 'Docstring'
      let g:which_key_map.j = 'Jump pairs'
      let g:which_key_map['/'] = 'No highlight'
      let g:which_key_map[' '] = 'which_key_ignore'
    " }
    " Leaderf {
      let g:Lf_HideHelp = 1
      let g:Lf_UseCache = 1
      let g:Lf_UseVersionControlTool = 0
      let g:Lf_IgnoreCurrentBufferName = 1
      let g:Lf_RootMarkers = ['.git', '.svn', '.root', '.project', '.hg']
      let g:Lf_WindowPosition = 'popup'
      let g:Lf_PreviewInPopup = 1
      let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2"}
      let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
      let g:Lf_ShortcutF = '<M-f>'
      let g:Lf_ShortcutB = '<M-b>'
      " let g:Lf_PopupColorscheme = "gruvbox_material"
      noremap <leader>ff :<C-U>Leaderf file<CR>
      noremap <leader>fb :<C-U>Leaderf buffer<CR>
      noremap <leader>fm :<C-U>Leaderf mru<CR>
      noremap <leader>fbt :<C-U>Leaderf bufTag<CR>
      noremap <leader>fl :<C-U>Leaderf line<CR>
      noremap <leader>fft :<C-U>Leaderf filetype<CR>
      noremap <leader>fr :<C-U>Leaderf rg --max-columns 300<CR>
      noremap <leader>fc :<C-U>Leaderf command<CR>
      noremap <leader>fw :<C-U>Leaderf window<CR>
      noremap <leader>ft :<C-U>Leaderf task<CR>
    " }
    " Asyncrun {
      let g:asyncrun_open = 8
      command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
      noremap <silent><f5> :AsyncTask file-run<cr>
      noremap <silent><f6> :AsyncTask file-run<cr>
      noremap <silent><f9> :AsyncTask file-build<cr>
      noremap <silent><s-f5> :AsyncTask project-run<cr>
      noremap <silent><s-f6> :AsyncTask project-test<cr>
      noremap <silent><s-f7> :AsyncTask project-init<cr>
      noremap <silent><s-f9> :AsyncTask project-build<cr>
      noremap <silent><leader>tr :AsyncTask file-run<cr>
      noremap <silent><leader>tb :AsyncTask file-build<cr>
      let g:asynctasks_extra_config = [
          \ '~/dotfiles/Vim/tasks.ini',
          \ ]
      let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
      function! s:lf_task_source(...)
          let rows = asynctasks#source(&columns * 48 / 100)
          let source = []
          for row in rows
              let name = row[0]
              let source += [name . '  ' . row[1] . '  : ' . row[2]]
          endfor
          return source
      endfunc

      function! s:lf_task_accept(line, arg)
          let pos = stridx(a:line, '<')
          if pos < 0
              return
          endif
          let name = strpart(a:line, 0, pos)
          let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
          if name != ''
              exec "AsyncTask " . name
          endif
      endfunc

      function! s:lf_task_digest(line, mode)
          let pos = stridx(a:line, '<')
          if pos < 0
              return [a:line, 0]
          endif
          let name = strpart(a:line, 0, pos)
          return [name, 0]
      endfunc

      function! s:lf_win_init(...)
          setlocal nonumber
          setlocal nowrap
      endfunc

      let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
      let g:Lf_Extensions.task = {
                  \ 'source': string(function('s:lf_task_source'))[10:-3],
                  \ 'accept': string(function('s:lf_task_accept'))[10:-3],
                  \ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
                  \ 'highlights_def': {
                  \     'Lf_hl_funcScope': '^\S\+',
                  \     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
                  \ },
              \ }
    " }
    " docstring {
      " let g:pydocstring_fomatter = 'numpy'
      " noremap <leader>ds :Pydocstring<CR>
      let g:doge_mapping='<Leader>d'
      let g:doge_mapping_comment_jump_forward='<c-j>'
      let g:doge_mapping_comment_jump_backward='<c-k>'
      let g:doge_doc_standard_python='numpy'
    " }
    " terminal-help {
      if WINDOWS()
          let g:terminal_shell='powershell -nologo'
      endif
      let g:terminal_cwd=2
    " }
    " polyglot {
      let g:python_highlight_all = 1
      let g:polyglot_disabled = ['latex']
    " }
    " quickui {
      " clear all the menus
      call quickui#menu#reset()

      let quickui_edit_basic = [
                  \ ["Copyright &Header\t", 'AddHeader', 'Insert copyright information at the beginning'],
                  \ ["Format\t", 'Format', ''],
                  \ ['--'],
                  \ ["&Align Table\t", 'Tabularize /|', ''],
                  \ ]
      let quickui_edit_win = [
                  \ ['--'],
                  \ ["Open in Terminal\t",'!wt -d .'],
                  \ ["Open in Explorer\t",'!start .'],
                  \ ]

      if WINDOWS()
          call quickui#menu#install("&Edit", quickui_edit_basic+quickui_edit_win)
      else
          call quickui#menu#install("&Edit", quickui_edit_basic)
      endif

      call quickui#menu#install("&Build", [
                  \ ["File &Execute\tF5", 'AsyncTask file-run'],
                  \ ["File &Compile\tF9", 'AsyncTask file-build'],
                  \ ['--', ''],
                  \ ["&Project Build\tShift+F9", 'AsyncTask project-build'],
                  \ ["Project &Run\tShift+F5", 'AsyncTask project-run'],
                  \ ["Project &Test\tShift+F6", 'AsyncTask project-test'],
                  \ ["Project &Init\tShift+F7", 'AsyncTask project-init'],
                  \ ['--', ''],
                  \ ['E&dit Task', 'AsyncTask -e'],
                  \ ['Edit &Global Task', 'AsyncTask -E'],
                  \ ['&Stop Building', 'AsyncStop'],
                  \ ])

      " items containing tips, tips will display in the cmdline
      call quickui#menu#install('&Plugin', [
                  \ [ "&Buffer\t﬘", 'LeaderfBuffer' ],
                  \ [ "&File\t", 'LeaderfFile' ],
                  \ [ "&Mru\t", 'LeaderfMru' ],
                  \ ['--',''],
                  \ ["Plugin &Clean\tﮁ", "PlugClean", "Clean"],
                  \ ["Plugin &Update\tﮮ", "PlugUpdate", "Update plugin"],
                  \ ['--',''],
                  \ ["&Nerdtree Find\t", "NERDTreeFind", "Update plugin"],
                  \ ])

      call quickui#menu#install("&Toggle", [
                  \ [ "Toggle &Quickfix", 'call sidebar#toggle("quickfix")' ],
                  \ [ "Toggle &Nerdtree", 'call sidebar#toggle("nerdtree")' ],
                  \ [ "Toggle &Loclist", 'call sidebar#toggle("loclist")' ],
                  \ [ "Toggle &Vista", 'call sidebar#toggle("vista")' ],
                  \ [ "Toggle &Undotree", 'call sidebar#toggle("undotree")' ],
                  \ ])

      " script inside %{...} will be evaluated and expanded in the string
      call quickui#menu#install("&Option", [
                  \ ['Set &Wrap %{&wrap? "Off":"On"}', 'set wrap!'],
                  \ ['Set &Expandtab %{&et? "Off":"On"}', 'set et!'],
                  \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
                  \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
                  \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
                  \ ])

      " register HELP menu with weight 10000
      call quickui#menu#install('H&elp', [
                  \ ["&Cheatsheet\t", 'help index', ''],
                  \ ["T&ips\tﯧ", 'help tips', ''],
                  \ ['--',''],
                  \ ["&Tutorial\t", 'help tutor', ''],
                  \ ["&Quick Reference\t", 'help quickref', ''],
                  \ ["&Summary\t", 'help summary', ''],
                  \ ], 10000)


      " enable to display tips in the cmdline
      let g:quickui_show_tip = 1
      let g:quickui_border_style = 2

      " hit space twice to open menu
      noremap <space>q :call quickui#menu#open()<cr>

      function! DisplayDefxMappings()
          let content = [
            \ ["Open\t<CR>"  , 'call defx#call_action("drop")'] ,
            \ ["Redraw\t<C-l>"     , 'call defx#call_action("redraw")'] ,
            \ ["Vsplit\tE"  , 'call defx#call_action("open","vsplit")'] ,
            \ ["Preview\tP" , 'call defx#call_action("open","pedit")'] ,
            \ ["Remove\td"  , 'call defx#call_action("remove")'] ,
            \ ["Rename\tr"  , 'call defx#call_action("rename")'] ,
            \ ["CD\tcd"     , 'call defx#call_action("change_vim_cwd")'] ,
            \ ]
          call quickui#context#open(content, {})
      endfunc
      function! DisplayFugitiveMappings()
          let content =  [
            \ ["toggle stage\t-"       , '' ] ,
            \ ["Unstage everything\tU" , '' ] ,
            \ ["Discard changes\tX"    , '' ] ,
            \ ["Inline diff\t="        , '' ] ,
            \ ["--"                    , '' ] ,
            \ ["Open file\to"          , '' ] ,
            \ ["Jump previous\t("      , '' ] ,
            \ ["Jump Next\t)"          , '' ] ,
            \ ["--"                    , '' ] ,
            \ ["Create commit\tcc"     , '' ] ,
            \ ["Amend\tca"             , '' ] ,
            \ ["Reword\tcw"            , '' ] ,
            \ ]
          call quickui#context#open(content, {})
      endfunc
      augroup UIFugitive
        au!
        au FileType fugitive noremap <silent><buffer> K :call DisplayFugitiveMappings()<cr>
      augroup END
      augroup UIDefx
        au!
        au FileType defx noremap <silent><buffer> K :call DisplayDefxMappings()<cr>
      augroup END
      augroup UIQuickfixPreview
        au!
        au FileType qf noremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
      augroup END
      let g:context_menu_k = [
                  \ ["&Search in Project\t", 'exec "silent! Leaderf rg " . expand("<cword>")'],
                  \ ["Search in &Zeal\t", 'exec "!zeal dash://" . expand("<cword>")'],
                  \ [ "--", ],
                  \ [ "Goto D&efinition\t", 'call CocAction("jumpDefinition")'],
                  \ [ "Goto &References\t", 'call CocAction("jumpReferences")'],
                  \ [ "Goto &Implementation\t", 'call CocAction("jumpImplementation")'],
                  \ ['--', ''],
                  \ [ "Toggle &Quickfix", 'call sidebar#toggle("quickfix")' ],
                  \ [ "Toggle &Nerdtree", 'call sidebar#toggle("nerdtree")' ],
                  \ [ "Toggle &Loclist", 'call sidebar#toggle("loclist")' ],
                  \ [ "Toggle &Vista", 'call sidebar#toggle("vista")' ],
                  \ [ "Toggle &Undotree", 'call sidebar#toggle("undotree")' ],
                  \ ]
      nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>
      hi! link QuickBG Normal
      hi! link QuickBorder Normal
      hi! link QuickSel PmenuSel
      hi! link QuickKey Title
      hi! link QuickOff Whitespace
      hi! link QuickHelp PmenuSBar
    " }
    " leetcode {
      let g:leetcode_browser='chrome'
      let g:leetcode_china=1
      let g:leetcode_solution_filetype='python3'
    " }
    " {
      let g:undotree_SetFocusWhenToggle = 1
      let g:undotree_SplitWidth = 40
      let g:undotree_WindowLayout = 4
    " }
    " sidebars {
      autocmd FileType qf call s:setup_quickfix_window()
      function! s:setup_quickfix_window()
          wincmd J
          10wincmd _
          setlocal wrap foldcolumn=0 colorcolumn= signcolumn=no cursorline
          nnoremap <silent> <buffer> q <C-w>q
      endfunction
      let g:sidebars = {
        \ 'nerdtree': {
        \     'position': 'left',
        \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'nerdtree'},
        \     'open': 'NERDTree',
        \     'close': 'NERDTreeClose'
        \ },
        \ 'quickfix': {
        \     'position': 'bottom',
        \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'qf' && !getwininfo(win_getid(nr))[0]['loclist']},
        \     'open': 'copen',
        \     'close': 'cclose'
        \ },
        \ 'loclist': {
        \     'position': 'bottom',
        \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'qf' && getwininfo(win_getid(nr))[0]['loclist']},
        \     'open': 'silent! lopen',
        \     'close': 'silent! lclose'
        \ },
        \ 'vista': {
        \     'position': 'left',
        \     'check_win': {nr -> bufname(winbufnr(nr)) =~ '__vista__'},
        \     'open': 'Vista',
        \     'close': 'Vista!'
        \ },
        \ 'undotree': {
        \     'position': 'right',
        \     'check_win': {nr -> getwinvar(nr, '&filetype') ==# 'undotree'},
        \     'open': 'UndotreeShow',
        \     'close': 'UndotreeHide'
        \ }
        \ }
    " }
    " Dirvish {
        " let g:loaded_netrwPlugin = 1
        " command! -nargs=? -complete=dir Explore Dirvish <args>
        " command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
        " command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
    " }
    " IndentLine {
      let g:indentLine_char_list = ['|']
      let g:indentLine_setConceal = 0
      let g:indentLine_setColors = 1
    " }
    " Cycle {
      " call AddCycleGroup(['one', 'two', 'three'])
      " call AddCycleGroup(['true', 'false'])
      " call AddCycleGroup(['True', 'False'])
    " }
    " CSV {
      let g:csv_delim = ','
    " }
" }
