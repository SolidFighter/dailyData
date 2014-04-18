set mouse=a  " 使用鼠标

set nocompatible " 关闭vi兼容模式

syntax enable "语法高量

syntax on "语法高量

set expandtab "使用space代替tab 

filetype on
filetype indent on
filetype plugin on

set number " 显示行号

set cursorline " 突出显示当前行

set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4

set tabstop=4 " 设定 tab 长度为 4

set incsearch " 输入搜索内容时就显示搜索结果

set hlsearch " 搜索时高亮显示被找到的文本

set cindent "开启新行时使用智能自动缩进

set showcmd "开启显示未执行完的命令

set autowrite "多文件编辑时自动保存

"设置代码折叠
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
"set foldclose=all " 设置为自动关闭折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠

"taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" --- OmniCppComplete ---
"set nocp 			" non vi compatible mode
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
"let OmniCpp_MayCompleteDot = 1 		" autocomplete with .
"let OmniCpp_MayCompleteArrow = 1 	" autocomplete with ->
"let OmniCpp_MayCompleteScope = 1 	" autocomplete with ::
"let OmniCpp_SelectFirstItem = 2 	" select first item (but don't insert)
"let OmniCpp_NamespaceSearch = 2 	" search namespaces in this and included files
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup

"F8头文件切换
nnoremap <silent> <F8> :A<CR>

"F9打开或者关闭quickfix
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
	if exists("g:qfix_win") && a:forced == 0
		cclose
		unlet g:qfix_win
	else
		copen 10
		let g:qfix_win = bufnr("$")
	endif
endfunction
nmap <silent> <F9> :QFix<CR> "F9 to open or close quickfix 

"ctags调用
"ctags --c++-kinds=+p  --fields=+iaS  --extra=+q --language-force=C++ -a -R .
"ctags --go-kinds=+p  --fields=+iaS  --extra=+q --language-force=go -a -R .
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -a . <CR>

"cscope调用
"find . -name "*.h" -o -name "*.cpp" -o -name "*.c" > cscope.files
"cscope -b
"c: 查找调用该函数的函数
"d:查找该函数调用过的函数
"e:查找这个egrep pattern
"f:查找这个文件
"g:查找这个定义
"i:查找include 中文件包含它的地方
"s:查找这个C符号
"t:查找给它赋值的地方

"golang start
set rtp+=$GOROOT/misc/vim
"golang end
