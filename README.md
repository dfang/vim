# VIM

- [快速使用该配置](#quickstart)
- [Leader](#leader)
- [Navigation](#navigation)
- [NerdTree](#nerdtree)
- [FZF](#fzf)
- [注释](#注释)
- [对齐](#对齐)
- [缩进](#缩进)
- [折叠](#折叠)
- [格式化JSON](#format-json-in-vim)
- [其他](#其他常用命令)

## Quickstart

```
cd ~/src
git clone https://github.com/dfang/vim.git
cd vim
./script/setup
```

```
homesick clone dfang/vim
homesick link vim
```

homesick clone will clone to ~/.homesick/repos, homesick link will create symbolic links


## 本配置中最常用的操作

### leader

`<leader>d`

### [Navigation](https://devhints.io/vim)

```
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
```

### [NerdTree](https://github.com/preservim/nerdtree)

Press `I` (Shift+i) to toggle hidden files in the NERDTree explorer window.

```
<Leader>d :NERDTreeToggle         # to toggle NERDTree
:NERDTreeFind                     # reveal file in nerdtree
```

### [FZF](https://github.com/junegunn/fzf.vim)

```
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
```

### [vim-surround](https://github.com/tpope/vim-surround)

https://towardsdatascience.com/how-i-learned-to-enjoy-vim-e310e53e8d56


### [注释](https://github.com/preservim/nerdcommenter)

先选中需要操作的行 比如 v3j 然后执行相应的操作

```
<leader>ci  NERDCommenterInvert
<leader>cc  NERDCommenterComment
<leader>cu  NERDCommenterUncomment
```

> 关于注释代码: 记住`<leader>ci`就够了，如果没有安装nerdcommenter，那就用vim原始模式: 先ctrl+v进入列选模式，I插入注释符，快速按ESC


### [对齐](https://github.com/junegunn/vim-easy-align)

先选中需要操作的行 vip （visually select inner paragraph）
ga = 按等号对齐

ga -> CTRL + X -> 输入正则

### [缩进](https://devhints.io/vim#misc)

```
set paste
```

### [折叠](https://devhints.io/vim#misc)

```
:set fdm?
:set fdm=marker

za
```

### Format JSON in vim

```
:%!jq .
:%!python -m json.tool
```

## 其他常用命令

```
ggvG
gg=G

[h jump to previous hunk
]h jump to next hunk

:Startify

:GBrowse

:GitGutterToggle
:GitGutterNextHunk
:GitGutterPrevHunk
:GitGutterStageHunk

```
# [Tips](https://github.com/dfang/vim/blob/master/docs/tips)

https://github.com/dfang/vim/blob/master/docs/tips

## Other plugins

- https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

  > sensible defaults

- https://github.com/tpope/vim-sleuth

  > no need to set buffer options like tabstop, shiftwidth, expandtab, etc

- https://github.com/airblade/vim-gitgutter

  > display git diff markers(gutter) in the sign column

- https://github.com/tpope/vim-fugitive

- https://github.com/mattn/emmet-vim

- https://github.com/editorconfig/editorconfig-vim

- https://github.com/pbrisbin/vim-mkdir
