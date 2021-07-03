set number " set line number
set tabstop=2" set tab size
syntax enable " enable syntax highlighting
set shiftwidth=2 "affect amount of indentation
set noshowmode



call plug#begin("~/.config/nvim/plugged")


	Plug 'itchyny/lightline.vim'  "Statusline/Tabline 

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	
	Plug 'preservim/nerdtree'
	Plug 'preservim/nerdcommenter'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'Xuyuanp/nerdtree-git-plugin' 
	Plug 'ryanoasis/vim-devicons'
	
	Plug 'ap/vim-css-color' 

	Plug 'tpope/vim-surround'

call plug#end()

"fuzzyfinder
nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}

" NERDTree
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" "	Focus
nnoremap <leader>n :NERDTreeFocus<CR>
" NERDTree
nnoremap <C-n> :NERDTree<CR>
" Toggle
nnoremap <C-b> :NERDTreeToggle<CR>
" Find
nnoremap <C-f> :NERDTreeFind<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "#905532"
let s:aqua =  "#3AFFDB"
let s:blue = "#689FB6"
let s:darkBlue = "#44788E"
let s:purple = "#834F79"
let s:lightPurple = "#834F79"
let s:red = "#AE403F"
let s:beige = "#F5C06F"
let s:yellow = "#F09F17"
let s:orange = "#D4843E"
let s:darkOrange = "#F16529"
let s:pink = "#CB6F6F"
let s:salmon = "#EE6E73"
let s:green = "#8FAA54"
let s:lightGreen = "331B53E"
let s:white = "#FFFFFF"
let s:rspec_red = '#FE405F'
let s:git_orange = '#F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


"Vim Surround
"Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

"It's easiest to explain with examples. Press cs"' inside

" "Hello world!"

"to change it to

" 'Hello world!'

"Now press cs'<q> to change it to

"<q>Hello world!</q>

"To go full circle, press cst" to get

" "Hello world!"

"To remove the delimiters entirely, press ds".

"Hello world!

"Now with the cursor on "Hello", press ysiw] (iw is a text object).

"[Hello] world!

"Let's make that braces and add some space (use } instead of { for no space): cs]{

"{ Hello } world!

"Now wrap the entire line in parentheses with yssb or yss).

"({ Hello } world!)

"Revert to the original text: ds{ds)

"Hello world!

"Emphasize hello: ysiw<em>

"<em>Hello</em> world!

"Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.

"<p class="important">
"  <em>Hello</em> world!
"</p>

"This plugin is very powerful for HTML and XML editing, a niche which currently seems underfilled in Vim land. (As opposed to HTML/XML inserting, for which many plugins are available). Adding, changing, and removing pairs of tags simultaneously is a breeze.
