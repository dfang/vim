# VIM

- [快速使用该配置](#quickstart)
- [NerdTree](#nerdtree)
- [FZF](#fzf)
- [注释](#注释)
- [对齐](#对齐)
- [缩进](#缩进)
- [折叠](#折叠)
- [Navigation](#navigation)

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

### [NerdTree](https://github.com/preservim/nerdtree)

`<leader>d`

Press `I` (Shift+i) to toggle hidden files in the NERDTree explorer window.

To enable this behavior by default, add this line to your .vimrc file:

`let NERDTreeShowHidden=1`

### [FZF](https://github.com/junegunn/fzf.vim)

`<leader>f`

### [vim-surround](https://github.com/tpope/vim-surround)

https://towardsdatascience.com/how-i-learned-to-enjoy-vim-e310e53e8d56


### [注释](https://github.com/preservim/nerdcommenter)

先选中需要操作的行 比如 v3j 然后执行相应的操作

```
<leader>cc  NERDCommenterComment
<leader>cu  NERDCommenterUncomment
<leader>ci  NERDCommenterInvert
```

### [对齐](https://github.com/junegunn/vim-easy-align)

先选中需要操作的行 vip （visually select inner paragraph）
ga = 按等号对齐

### [缩进](https://devhints.io/vim#misc)

### [折叠](https://devhints.io/vim#misc)

### [Navigation](https://devhints.io/vim)

## 其他常用命令

```
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
