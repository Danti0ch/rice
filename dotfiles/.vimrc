function! HighlightFilenames() abort
  if wordcount().chars < 20000
    let path = expand('%:h')
    let filenames = []
    for line in getline('1', '$')
      call substitute(line, '\f\+', '\=add(filenames, submatch(0))', 'g')
    endfor
    call filter(filenames, 'filereadable(v:val) || filereadable(path .. "/" .. trim(v:val, "/"))')
    call map(filenames, 'matchadd("ErrorMsg", v:val)')
  endif
endfunction

augroup CustomHighlight
  autocmd!
  autocmd BufRead * call HighlightFilenames()
augroup end

set nu
set relativenumber
set cursorline
" set cursorcolumn
" highlight CursorColumn ctermbg=236
set smartindent
