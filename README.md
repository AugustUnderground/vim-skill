# vim-skill

SKILL / SKILL++ syntax highlighting for vim,
based on [vim-hy](https://github.com/hylang/vim-hy).

SKILL / Virtuoso REPL integration (**only NeoVim**).

## Installation

Any vim plugin approach should work.
For [Vim-Plug](https://github.com/junegunn/vim-plug) just put
```
Plug 'augustunderground/vim-skill'
```
in your `init.vim` and then run
```
:PlugInstall
```

## Usage

Open any skill/skill++ file and press `F12` to launch a Skill REPL
with the command defined in `g:skill_repl`.
To (re)load the file in the current buffer press `<leader>R`.
Where `<leader>` is bound to `\` by default.

`<leader>l` will send the current line to the Skill REPL, and
`<leader>r` will send the paragraph in which the cursor is.
A paragraph in this case means a block of code without empty lines
inbetween.

Pressing `F11` will run/execute the script in the current buffer
non-interactively with the command defined in `g:skill_cmpl`

## Settings

Default key mappings are:

```{vim}
map <F11> :call SkillRun()<CR>
map <F12> :call SkillOpen()<CR>
nnoremap <silent> <leader>l :SkillSendLine<cr>
nnoremap <silent> <leader>r :SkillSendRegion<cr>
nnoremap <silent> <leader>R :SkillReloadFile<cr>
```

When calling `SkillOpen` a new 
[neovim terminal](https://neovim.io/doc/user/nvim_terminal_emulator.html)
is opened and a SKILL REPL is launched.
Set `g:skill_repl` to the appropriate SKILL Interpreter.

```{vim}
let g:skill_repl = 'rlwrap virtuoso -nographE'
```

Calling `SkillRun` executes the script in the current buffer
with the command defined in `g:skill_cmpl`.

```{vim}
let g:skill_cmpl = 'virtuoso -nographE -restore'
```

They can be overwritten in your `init.vim`.
