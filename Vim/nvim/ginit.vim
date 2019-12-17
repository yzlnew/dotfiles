if !exists('g:fvim_loaded')
    GuiTabline 0
    GuiPopupmenu 0
    " GuiFont! Operator Mono Book:h14
    GuiFont! Sarasa Mono SC:h12
    GuiLinespace 2
endif

if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility
    set guifont=Sarasa\ Mono\ SC:h16
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
    " Background
    " FVimBackgroundComposition 'acrylic'   " 'none', 'blur' or 'acrylic'
    " FVimBackgroundOpacity 0.85            " value between 0 and 1, default bg opacity.
    " FVimBackgroundAltOpacity 0.85         " value between 0 and 1, non-default bg opacity.

    " FVimCustomTitleBar v:true             " themed with colorscheme

    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontSubpixel v:true
    FVimFontLcdRender v:true
    FVimFontHintLevel 'full'
    FVimFontAutoSnap v:true
    " FVimFontLineHeight 'default' " can be 'default', '14.0', '-1.0' etc.
    " FVimUIPopupMenu v:false      " external popup menu
endif
