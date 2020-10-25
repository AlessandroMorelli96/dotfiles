
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime configs/plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime configs/plugin-settings.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main Option
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime configs/main.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start Option
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close the last window if is useless
"function! CheckLeftBuffers()
"  if tabpagenr('$') == 1
"    let i = 1
"    while i <= winnr('$')
"      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
"          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
"          \ exists('t:NERDTreeBufName') && bufname(winbufnr(i)) == t:NERDTreeBufName ||
"          \ getbufvar(winbufnr(i), '&buftype') == 'Tagbar' ||
"          \ getbufvar(winbufnr(i), '&buftype') == 'netrw'
"        let i += 1
"      else
"        break
"      endif
"    endwhile
"    if i == winnr('$') + 1
"      qall
"    endif
"    unlet i
"  endif
"endfunction
"autocmd BufEnter * call CheckLeftBuffers()

"autocmd WinEnter * if (winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw") | q | endif
"autocmd WinEnter * if (winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "Tagbar") | q | endif
"autocmd WinEnter * if (winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "Startify") | q | endif

"autocmd VimEnter * if (!argc()) | Startify | endif

"autocmd FileType * nested :call tagbar#autoopen(0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variable
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime configs/variables.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime configs/functions.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

runtime configs/mappings.vim
