" Skill Commands

"let g:skill_repl = 'rlwrap skill'
"let g:skill_repl = 'rlwrap dbAccess'
let g:skill_repl = get(g:, 'skill_repl', "rlwrap virtuoso -nographE")

"let g:skill_cmpl = 'dbAccess -load'
"let g:skill_cmpl = 'virtuoso -replay'
let g:skill_cmpl = get(g:, 'skill_cmpl', "virtuoso -nographE -restore")

" Skill Vim
map <F11> :call SkillRun()<CR>
map <F12> :call SkillOpen()<CR>
nnoremap <silent> <leader>l :SkillSendLine<cr>
nnoremap <silent> <leader>r :SkillSendRegion<cr>
nnoremap <silent> <leader>R :SkillReloadFile<cr>

" Make sure Job ID is stored
augroup Terminal
    au!
    au TermOpen * let g:repl_job_id = b:terminal_job_id
augroup END

" Send Lines from code to terminal
function! SkillSend(lines)
    call jobsend(g:repl_job_id, add(a:lines, ''))
endfunction

" Select a paragraph of code
function! SkillSelectRegion(linenr)
    let startline = a:linenr
    let done = 0
    while !done
        let startline = startline - 1
        if startline
            if match(getline(startline), '^\s*$') != -1
                let startline = startline + 1
                let done = 1
                break
            endif
        else
            let done = 1
            break
        endif
    endwhile
    let endline = a:linenr
    let done = 0
    while !done
        let endline = endline + 1
        if endline
            if match(getline(endline), '^\s*$') != -1
                let endline = endline - 1
                let done = 1
            endif
        else
            let done = 1
            break
        endif
    endwhile
    if startline == endline
        let lines = [getline(startline)]
    else
        let lines = getline(startline, endline)
    endif
    return lines
endfunction

" Reload file in Skill
function! SkillReload()
    call SkillSend(['(load "' . expand("%") . '")'])
endfunction

command! SkillSendLine call SkillSend([getline('.')])
command! SkillSendRegion call SkillSend(SkillSelectRegion(line('.')))
command! SkillReloadFile call SkillReload()

" Run current file (non-interactive)
function SkillRun()
    execute "!" . g:skill_cmpl . " %"
endfunction

" Start REPL and Load
function SkillOpen()
    execute "belowright vsplit"
    execute "vertical resize -15"
    execute "term " . g:skill_repl
    setlocal modifiable
    setlocal nonumber
    setlocal norelativenumber
    setlocal signcolumn=no
    setlocal nocursorline
    setlocal nocursorcolumn
    setlocal syntax=skill
    normal A
endfunction
