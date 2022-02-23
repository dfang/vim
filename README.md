# VIM

if you use [rcm](https://github.com/thoughtbot/dotfiles/tree/master#install) to manage dotfiles

```
brew install rcm
rcup -v -d home
```

[Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)

## [注释](https://github.com/preservim/nerdcommenter)

先选中需要操作的行 比如 v3j 然后执行相应的操作

```
<leader>cc  NERDCommenterComment
<leader>cu  NERDCommenterUncomment
<leader>ci  NERDCommenterInvert
```

## [对齐](https://github.com/junegunn/vim-easy-align)

先选中需要操作的行 vip （visually select inner paragraph）
ga = 按等号对齐

## [NerdTree](https://github.com/preservim/nerdtree)

`<leader>d`

Press `I` (Shift+i) to toggle hidden files in the NERDTree explorer window.

To enable this behavior by default, add this line to your .vimrc file:

`let NERDTreeShowHidden=1`

## [FZF](https://github.com/junegunn/fzf.vim)

`<leader>f`

## [vim-surround](https://github.com/tpope/vim-surround)

https://towardsdatascience.com/how-i-learned-to-enjoy-vim-e310e53e8d56

## 常用命令

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

## Other plugins

- https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

  > sensible defaults

- https://github.com/tpope/vim-sleuth

  > no need to set buffer options like tabstop, shiftwidth, expandtab, etc

- https://github.com/airblade/vim-gitgutter

  > display git diff markers(gutter) in the sign column

- https://github.com/mattn/emmet-vim

- https://github.com/editorconfig/editorconfig-vim

- https://github.com/pbrisbin/vim-mkdir
