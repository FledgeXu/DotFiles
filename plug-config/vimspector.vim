let g:vimspector_enable_mappings = 'HUMAN'
nnoremap <leader>dgd :call vimspector#Launch()<CR>
nnoremap <leader>dge :call vimspector#Reset()<CR>

nnoremap <leader>dgc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dgt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap <leader>dgv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader>dgw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader>dgs :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader>dgo :call GotoWindow(g:vimspector_session_windows.output)<CR>
" 
" nmap <leader>dl <Plug>VimspectorStepInto
" nmap <leader>dj <Plug>VimspectorStepOver
" nmap <leader>dk <Plug>VimspectorStepOut
" nmap <leader>dr <Plug>VimspectorRestart
" nnoremap <leader>d<space> :call vimspector#Continue()<CR>
" 
" nmap <leader>dsrc <Plug>VimspectorRunToCursor
" nmap <leader>dsbp <Plug>VimspectorToggleBreakpoint
" nmap <leader>dscbp <Plug>VimspectorToggleConditionalBreakpoint
