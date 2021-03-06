let s:suite = themis#suite('highlight')
let s:assert = themis#helper('assert')

function! s:suite.before_each()
  hi clear
  let g:lightline = {}
  call lightline#init()
  call lightline#colorscheme()
endfunction

function! s:hi(name)
  redir => hi
    silent! exec 'hi' a:name
  redir END
  return substitute(join(split(hi, "\n"), ''), ' \+', ' ', 'g')
endfunction

function! s:pattern(xs, ...) abort
  let ys = a:0 ? a:xs[1:] : a:xs
  let zs = get(a:000, 0, a:xs)
  return 'ctermfg=' . ys[2] . ' ctermbg=' . zs[3] . '.*guifg=' . ys[0] . ' guibg=' . zs[1]
endfunction

function! s:suite.highlight()
  let palette = lightline#palette()
  call s:assert.match(s:hi('LightLineLeft_normal_0'), s:pattern(palette.normal.left[0]))
  call s:assert.match(s:hi('LightLineLeft_normal_1'), s:pattern(palette.normal.left[1]))
  call s:assert.match(s:hi('LightLineLeft_normal_2'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineRight_normal_0'), s:pattern(palette.normal.right[0]))
  call s:assert.match(s:hi('LightLineRight_normal_1'), s:pattern(palette.normal.right[1]))
  call s:assert.match(s:hi('LightLineRight_normal_2'), s:pattern(palette.normal.right[2]))
  call s:assert.match(s:hi('LightLineRight_normal_3'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineMiddle_normal'), s:pattern(palette.normal.middle[0]))
endfunction

function! s:suite.insert()
  call lightline#highlight('insert')
  let palette = lightline#palette()
  call s:assert.match(s:hi('LightLineLeft_insert_0'), s:pattern(palette.insert.left[0]))
  call s:assert.match(s:hi('LightLineLeft_insert_1'), s:pattern(palette.insert.left[1]))
  call s:assert.match(s:hi('LightLineLeft_insert_2'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineRight_insert_0'), s:pattern(palette.insert.right[0]))
  call s:assert.match(s:hi('LightLineRight_insert_1'), s:pattern(palette.insert.right[1]))
  call s:assert.match(s:hi('LightLineRight_insert_2'), s:pattern(palette.insert.right[2]))
  call s:assert.match(s:hi('LightLineRight_insert_3'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineMiddle_insert'), s:pattern(palette.insert.middle[0]))
endfunction


function! s:suite.visual()
  call lightline#highlight('visual')
  let palette = lightline#palette()
  call s:assert.match(s:hi('LightLineLeft_visual_0'), s:pattern(palette.visual.left[0]))
  call s:assert.match(s:hi('LightLineLeft_visual_1'), s:pattern(palette.visual.left[1]))
  call s:assert.match(s:hi('LightLineLeft_visual_2'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineRight_visual_0'), s:pattern(palette.normal.right[0]))
  call s:assert.match(s:hi('LightLineRight_visual_1'), s:pattern(palette.normal.right[1]))
  call s:assert.match(s:hi('LightLineRight_visual_2'), s:pattern(palette.normal.right[2]))
  call s:assert.match(s:hi('LightLineRight_visual_3'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineMiddle_normal'), s:pattern(palette.normal.middle[0]))
endfunction

function! s:suite.replace()
  call lightline#highlight('replace')
  let palette = lightline#palette()
  call s:assert.match(s:hi('LightLineLeft_replace_0'), s:pattern(palette.replace.left[0]))
  call s:assert.match(s:hi('LightLineLeft_replace_1'), s:pattern(palette.replace.left[1]))
  call s:assert.match(s:hi('LightLineLeft_replace_2'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineRight_replace_0'), s:pattern(palette.replace.right[0]))
  call s:assert.match(s:hi('LightLineRight_replace_1'), s:pattern(palette.replace.right[1]))
  call s:assert.match(s:hi('LightLineRight_replace_2'), s:pattern(palette.replace.right[2]))
  call s:assert.match(s:hi('LightLineRight_replace_3'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineMiddle_replace'), s:pattern(palette.replace.middle[0]))
endfunction

function! s:suite.left_right()
  let g:lightline = {
        \   'active': {
        \     'left': [ [ 'mode', 'paste' ], [ 'readonly' ], [ 'filename' ], [ 'modified' ] ],
        \     'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat' ], [ 'fileencoding' ], [ 'filetype' ] ]
        \   },
        \ }
  call lightline#init()
  call lightline#colorscheme()
  let palette = lightline#palette()
  call s:assert.match(s:hi('LightLineLeft_normal_0'), s:pattern(palette.normal.left[0]))
  call s:assert.match(s:hi('LightLineLeft_normal_1'), s:pattern(palette.normal.left[1]))
  call s:assert.match(s:hi('LightLineLeft_normal_2'), s:pattern(palette.normal.middle[0]))
  call s:assert.match(s:hi('LightLineLeft_normal_3'), s:pattern(palette.normal.middle[0]))
  call s:assert.match(s:hi('LightLineLeft_normal_4'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineRight_normal_0'), s:pattern(palette.normal.right[0]))
  call s:assert.match(s:hi('LightLineRight_normal_1'), s:pattern(palette.normal.right[1]))
  call s:assert.match(s:hi('LightLineRight_normal_2'), s:pattern(palette.normal.right[2]))
  call s:assert.match(s:hi('LightLineRight_normal_3'), s:pattern(palette.normal.middle[0]))
  call s:assert.match(s:hi('LightLineRight_normal_4'), s:pattern(palette.normal.middle[0]))
  call s:assert.match(s:hi('LightLineRight_normal_5'), 'E411: highlight group not found\|cleared')
  call s:assert.match(s:hi('LightLineMiddle_normal'), s:pattern(palette.normal.middle[0]))
endfunction

function! s:suite.subseparator()
  let g:lightline = {
        \   'active': {
        \     'left': [ [ 'mode', 'paste' ], [ 'readonly' ], [ 'filename' ], [ 'modified' ] ],
        \     'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat' ], [ 'fileencoding' ], [ 'filetype' ] ]
        \   },
        \ }
  call lightline#init()
  call lightline#colorscheme()
  let palette = lightline#palette()
  for i in range(4)
    for j in range(5)
      if i + 1 == j
        call s:assert.match(s:hi(printf('LightLineLeft_normal_%s_%s', i, j)), s:pattern(get(palette.normal.left, i, palette.normal.middle[0]), get(palette.normal.left, j, palette.normal.middle[0])))
      else
        call s:assert.match(s:hi(printf('LightLineLeft_normal_%s_%s', i, j)), 'E411: highlight group not found\|cleared')
      endif
    endfor
  endfor
endfunction

function! s:suite.component_type()
  let g:lightline = { 'component_type': { 'error': 'error', 'warning': 'warning' } }
  call lightline#init()
  call lightline#colorscheme()
  let palette = lightline#palette()
  for type in ['error', 'warning']
    call s:assert.match(s:hi(printf('LightLineLeft_normal_%s', type)), s:pattern(palette.normal[type][0]))
    call s:assert.match(s:hi(printf('LightLineLeft_normal_0_%s', type)), s:pattern(palette.normal.left[0], palette.normal[type][0]))
    call s:assert.match(s:hi(printf('LightLineLeft_normal_1_%s', type)), s:pattern(palette.normal.left[1], palette.normal[type][0]))
    call s:assert.match(s:hi(printf('LightLineLeft_normal_2_%s', type)), 'E411: highlight group not found\|cleared')
    call s:assert.match(s:hi(printf('LightLineLeft_normal_%s_0', type)), s:pattern(palette.normal[type][0], palette.normal.left[0]))
    call s:assert.match(s:hi(printf('LightLineLeft_normal_%s_1', type)), s:pattern(palette.normal[type][0], palette.normal.left[1]))
    call s:assert.match(s:hi(printf('LightLineLeft_normal_%s_2', type)), s:pattern(palette.normal[type][0], palette.normal.middle[0]))
    call s:assert.match(s:hi(printf('LightLineLeft_normal_%s_3', type)), 'E411: highlight group not found\|cleared')
  endfor
  for type1 in ['error', 'warning']
    for type2 in ['error', 'warning']
      call s:assert.match(s:hi(printf('LightLineLeft_normal_%s_%s', type1, type2)), s:pattern(palette.normal[type1][0], palette.normal[type2][0]))
    endfor
  endfor
endfunction
