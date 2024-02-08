<!--toc:start-->
- [Default shortcuts](#default-shortcuts)
  - [Visual mode](#visual-mode)
  - [Neo-tree](#neo-tree)
<!--toc:end-->

### Default shortcuts
- `Ctrl+h` - select file tree
- `Ctrl+l` - select file editor
- `Shift+h` - left editor tab
- `Shift+l` - right editor tab
- `Alt+j` - move current line up
- `Alt+k` - move current line down
- `double space` - filename search(telescope) - `Ctrl+d` and `Ctrl+u` to scroll preview
- `gg=G` - reindent - gg goes to the top of the file, = fixes the indentation and G to perform to the end
- `gc` - comment selected(`gcgc` no select to uncomment block)
- `%` - jump to other bracket of the current block
- `_` - jump to the first non blank char on the line
- `$` - jump to the last non blank char on the line
- `0` - jump to the start of the line
- `\text` - seach for text, `n` for next occurence, `N` for previous
- `f"` - find first `"`, jump to it with right arrow
- `ci"` - delete and start editing inside of the next string literal
- `vi"` - select inside of the next string literal
- `viw` - select current word
- `di"` - delete inside of the next string literal
- `u` - undo
- `Ctrl+r` - redo
- `ma` - set local mark `a`
- `mA` - set global mark `A`
- `` ` `` - list marks
- `` `a`` - go to mark `a`

#### Visual mode
- Character mode - `v`
- Line mode - `V`
- Block mode - `Ctrl+v`

- `u`- lowercase
- `U`- uppercase
- `d`- delete
- `c`- change
- `y`- yank
- `>`- indent
- `<`- dedent

#### Neo-tree
- `r` - rename
- `m` - move
- `o` - order by
- `i` - file details
- `v` - available shortcuts 
- `Ctrl+rarrow` - expand tree to right
- `Shift+h` - Toggle show hidden files
