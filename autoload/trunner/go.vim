function! trunner#go#list_task() abort
  let l:main_go_path = findfile('main.go', '.;')
  if l:main_go_path ==# ''
    let l:go_proj_dir = fnamemodify(findfile('go.mod', '.;'), ':p:h')
    let l:main_go_path = findfile('main.go', l:go_proj_dir . '**')
    if l:main_go_path ==# ''
      return []
    endif
  endif

  return [
  \ {'command': 'go', 'task': 'run', 'raw_command': ['go', 'run', l:main_go_path]},
  \]
endfunction