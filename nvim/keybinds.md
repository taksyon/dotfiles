# Keybindings

## Basic

### Modes
  - `<Esc>` - *Enter normal mode*
  - `<Space>` - *Leader key*
  - `i` - *Enter insert mode (before cursor)*
  - `a` - *Enter append mode (after cursor)*
  - `v` - *Enter visual mode (can select/hl text)*
  - `r` - *Enter replace mode (replace one or more character)*
  - `/` - *Enter find mode (search for text)*
  - `:` - *Enter command mode*
  
### Navigation
Cursor
  - `j` - *Move cursor down one line*
  - `k` - *Move cursor up one line*
  - `h` - *Move cursor left one character*
  - `l` - *Move cursor right one character* 

Words
  - `w` — *Next word*
  - `e` — *End of word*
  - `q` — *Beginning of previous word*  
  - `Q` — *Macro recording (moved here)*

Paragraphs
  - `{` — *Previous paragraph*
  - `}` — *Next paragraph*

Line movement
  - `0` — *Start of line*
  - `^` — *First non-whitespace character*
  - `$` — *End of line*

File movement
  - `gg` — *Start of file*
  - `G` — *End of file*

Buffers
  - `<Leader>bn` — *Next buffer*
  - `<Leader>bp` — *Previous buffer*  

### Faster Navigation
Move cursor faster with leader + direction (This uses hydra plugin, see util.lua)
  - `<Leader>j` — *Move down 5 lines*
  - `<Leader>k` — *Move up 5 lines*
  - `<Leader>h` — *Move left 5 characters*
  - `<Leader>l` — *Move right 5 characters*

Window navigation
  - `H` — *Cycle windows (next window, this moves the cursor to the file explorer)*
  - `L` — *Move to window on the right*

### Clipboard
Copy
  - `<Leader>c` — *Copy selection to system clipboard*
  - `<C-c>` — *Copy selection to clipboard (Ctrl+Shift+C style)*
  - `<Leader>y` — *Copy current line to system clipboard*

Paste
  - `<Leader>p` — *Paste after cursor from system clipboard*
  - `<Leader>P` — *Paste before cursor from system clipboard*
  - `<C-v>` — *Paste from system clipboard*

### Editing
  - `x` — *Delete character*
  - `yy` — *Yank (copy) entire line*
  - `Y` — *Yank from cursor to end of line*
  - `dd` — *Cut entire line*
  - `p` — *Paste after cursor*
  - `P` — *Paste before cursor*
  - `u` — *Undo*
  - `<C-r>` — *Redo*
  - `J` — *Move selected lines down*
  - `K` — *Move selected lines up*
  - `<Leader>o` — *Insert newline below without entering insert mode*
  - `<Leader>O` — *Insert newline above without entering insert mode*

### Save & Quit
  - `<Leader>w` — *Save file*
  - `<Leader>q` — *Quit all*
  - `<Leader>x` — *Save & quit all*
  - `<Leader>r` — *Reload config (`:so $MYVIMRC`)*

### Search & Replace
Search
  - `/` — *Search forward*
  - `?` — *Search backward*
  - `n` — *Next match (centered)*
  - `N` — *Previous match (centered)*

Replace
  - `<Leader>s` — *Search & replace (opens `:%s//g` prompt)*
  - `<Leader>sw` — *Search & replace word under cursor*

Other
  - `<Leader>.` — *Clear search highlighting*


---
## Plugin
### comment.nvim
Automatically comment out a line
  - `gcc` - *Comment out line under cursor*
  - `gc` - *Comment out selected text with single-line comments*
  - `gb` - *Comment out selected text with block comment* 
### hydra.nvim
  - `<Leader>` - *Activates hydra plugin*
  - `<Esc>` or `q` - *Deactivates hydra plugin*

### mini.surround
Highlight text in visual mode, then use below keybinds to surround text with [], {}, "", or ()
  - ` sa ` - *Add surrounding, visual mode or on motion*
  - ` sd ` - *Delete surrounding*
  - ` sr ` - *Replace surrounding*
  - ` sh ` - *Highlight surrounding*
  - ` sf ` or ` sF ` - *Find surrounding (move cursor right or left)*
### multicursors.nvim
Creates multiple cursors so you can edit multiple lines at once
  - ` <Leader>m ` - *Activate multicursors on either selected text or single cursor*
    - Other keybinds for multicursors pop up in a menu after activating this one

### snacks.nvim

#### Explorer (file tree)
  - `<Leader>n` - *Toggle open file picker tree*
  - `H` - *Move cursor from editor to file tree if it is open*
  - `L` - *Move cursor from file tree to editor*
  - `j` & `k` - *Move up and down through file tree*
  - `l` - *Open directories and files in file tree*
  - `h` - *Open/close directories in file tree*

#### Terminal
  - `<Leader>z` - *Toggle terminal at bottom of editor*
---

