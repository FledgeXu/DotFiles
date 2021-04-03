" let g:lightline = {
"             \ 'colorscheme': 'Tomorrow',
"             \ 'component_function': {
"             \   'filename': 'LightlineFilename',
"             \ }
"             \ }
let g:lightline = {
            \ 'colorscheme': 'Tomorrow',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified' ],
            \             ['branch']    ]
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFilename',
            \   'branch' : 'GetGitBranch'
            \ },
            \ }

function! GetGitBranch()
    let branch = get(g:, 'coc_git_status', '')
    return branch
endfunction

function! LightlineFilename()
    let root = fnamemodify(get(b:, 'git_dir'), ':h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunction
