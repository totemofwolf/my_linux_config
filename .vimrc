" Use Vim defaults, not Vi
    set nocompatible

" Set terminal and vim encoding
    set termencoding=utf-8
    "set termencoding=gbk
    set encoding=utf-8
    "set encoding=gbk
    set fileencodings=ucs-bom,utf-8,cp936,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1
    set langmenu=zh_CN.UTF-8
    "set helplang=cn
    language message zh_CN.UTF-8

" Tab setting
    set tabstop=4
    set shiftwidth=4
    "set expandtab	" turn the tab to space
    set smarttab

" Insert mode setting
    set backspace=indent,eol,start  " allow backspacing over everything in insert mode
    set mouse=
    set keymodel=startsel
	" set paste

" Display setting
    set hlsearch    " 寻找匹配是高亮度显示的
    set ruler   " show the cursor position all the time
    set showmode
    "set background=light
    set background=dark
    "set number
    syntax enable
    syntax on
    set linebreak   " 不在单词中间断行
    set fo+=mB  " 打开断行模块对亚洲语言支持

" Syntax setting
    set smartindent
    set autoindent
    set cindent
    set foldmethod=indent

    set incsearch
    set wildmenu
    "set spell
    set ignorecase
    colorscheme desert
    "colorscheme murphy
    "colorscheme evening

" Write force
	map wf :w !sudo tee % > /dev/null

" Highlight WhiteSpace in the end of a row
    highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
    match WhiteSpaceEOL /\s*\ \s*$/
    autocmd WinEnter * match WhiteSpaceEOL /\s*\ \s*$/

" Omni completion
    filetype plugin on
    set omnifunc=syntaxcomplete#Complete
    "set completeopt=longest,menu

" 状态栏
    set laststatus=2      " 总是显示状态栏
    highlight StatusLine cterm=bold ctermfg=lightgreen ctermbg=darkgray
    " 获取当前路径，将$HOME转化为~
    function! CurDir()
        let curdir = substitute(getcwd(), $HOME, "~", "g")
        return curdir
    endfunction
    set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}@\%{hostname()}\ \|

" cvim to enable additional tools
    let g:C_UseTool_cmake    = 'yes'
    let g:C_UseTool_doxygen  = 'yes'

" indentLine
    map <leader>il :IndentLinesToggle<CR>

" DoxygenToolkit
 map fg : Dox<cr>
	let g:DoxygenToolkit_authorName="dantezhu"
    let g:DoxygenToolkit_licenseTag="My own license\<enter>"
    let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
    let g:DoxygenToolkit_briefTag_pre = "@brief\t"
    let g:DoxygenToolkit_paramTag_pre = "@param\t"
    let g:DoxygenToolkit_returnTag = "@return\t"
    let g:DoxygenToolkit_briefTag_funcName = "no"
    let g:DoxygenToolkit_maxFunctionProtoLines = 30

" 手动显示对齐线
    let g:indent_guides_guide_size=1
    " Hight Light Column
    map ,ch :call SetColorColumn()<CR>
    function! SetColorColumn()
        let col_num = virtcol(".")
        let cc_list = split(&cc, ',')
        if count(cc_list, string(col_num)) <= 0
            execute "set cc+=".col_num
        else
            execute "set cc-=".col_num
        endif
    endfunction

" TagList setting
    let Tlist_Show_One_File=1   " 让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
    let Tlist_Exit_OnlyWindow=1     " 如果taglist窗口是最后一个分割窗口，则退出vim
    let Tlist_Use_Left_Window=1    " 在左侧窗口中显示taglist窗口, 0显示在右边
    let Tlist_File_Fold_Auto_Close=1    " 非当前文件，函数列表折叠隐藏

" MiniBufExplorer
    let g:miniBufExplMapCTabSwitchBufs= 1   " <C-Tab> and <C-S-Tab> switch buffer
    "let g:miniBufExplMapWindowNavVim = 1   " use <C-h,j,k,l> switch window
    "let g:miniBufExplMapWindowNavArrows = 1    " use <C-箭头键> switch window

" WinManager setting
nmap wm :WMToggle<cr>
    nmap <C-W><C-F> :FirstExplorerWindow<cr>
    nmap <C-W><C-B> :BottomExplorerWindow<cr>
    "nmap <silent> <leader>wm :WMToggle<cr>
    "let g:winManagerWindowLayout = "FileExplorer|TagList"
    let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
    let g:winManagerWidth = 30
    let g:defaultExplorer = 0

" cscope
" cscope -Rbq
" :cs add cscope.out ./
" use quickfix display result
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    nmap <F7> :cs find s <C-R>=expand("<cword>")<CR><CR>
    " go to declare
    nmap <F12> :cs find g <C-R>=expand("<cword>")<CR><CR>
    " go to define
    nmap <F10> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-T> :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-E> :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-F> :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-I> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-D> :cs find d <C-R>=expand("<cword>")<CR><CR>

