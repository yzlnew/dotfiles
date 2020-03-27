" File              : ginit.vim
" Author            : @yzlnew <yzlnew@gmail.com>
" Date              : 23.03.2020
" Last Modified Date: 23.03.2020
" Last Modified By  : @yzlnew <yzlnew@gmail.com>
if !exists('g:fvim_loaded')
    GuiTabline 0
    GuiPopupmenu 0
    " GuiFont! JetBrainsMono NF:h11
    " GuiFont! Sarasa Mono SC:h12
    " GuiLinespace 2
endif

if exists('g:fvim_loaded')
    " set guifont=Sarasa\ Mono\ SC:h16
    " set guifont=Operator\ Mono\ SSm:h16
    set guifont=OperatorMonoSSm\ NF:h16
    " set guifont=Operator\ Mono:h16
    " set guifont=Dank\ Mono:h16
    " set guifont=mononoki:h16
    set guifontwide=Sarasa\ Mono\ SC:h16

    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
    " Background
    " FVimBackgroundComposition 'acrylic'   " 'none', 'blur' or 'acrylic'
    " FVimBackgroundOpacity 0.85            " value between 0 and 1, default bg opacity.
    " FVimBackgroundAltOpacity 0.85         " value between 0 and 1, non-default bg opacity.

    " FVimCustomTitleBar v:true             " themed with colorscheme
    FVimFontNormalWeight 400
    FVimFontBoldWeight 700
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    " FVimFontAntialias v:true
    " FVimFontAutohint v:true
    " FVimFontSubpixel v:true
    " FVimFontLcdRender v:true
    " FVimFontHintLevel 'full'
    " FVimFontAutoSnap v:true
    FVimUIPopupMenu v:false
    " FVimFontDrawBounds v:true
    " FVimFontLineHeight '-1.0'
    FVimFontNoBuiltinSymbols 1
endif
