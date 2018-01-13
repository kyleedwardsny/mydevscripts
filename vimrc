"""""""""""""""""""""""""""""""""
" BEGIN .vimrc by kyleedwardsny "
"""""""""""""""""""""""""""""""""

" This is absolutely essential for programming
set number

function TryVimrcLocal(path)
  let filename = a:path . "/.vimrc.local"
  if filereadable(filename)
    execute "source " . fnameescape(filename)
  endif
endfunction

function RecursiveVimrcLocal()
  let absolute = expand("%:p")
  if absolute[0] != "/"
    return
  endif

  let path_components = split(absolute, "/")[:-2]

  let search_path = ""
  " Not sure why you'd have this in the root, but whatever
  call TryVimrcLocal(search_path)
  for component in path_components
    let search_path .= "/" . component
    call TryVimrcLocal(search_path)
  endfor
endfunction

autocmd BufNewFile,BufRead * call RecursiveVimrcLocal()

"""""""""""""""""""""""""""""""
" END .vimrc by kyleedwardsny "
"""""""""""""""""""""""""""""""
