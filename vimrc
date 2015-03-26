"basic config start
set mouse=a  " 使用鼠标
set nocompatible " 关闭vi兼容模式
set expandtab "使用space代替tab 
set number " 显示行号
set cursorline " 突出显示当前行
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set tabstop=4 " 设定 tab 长度为 4
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
"set cindent "开启新行时使用智能自动缩进
set showcmd "开启显示未执行完的命令
set autowrite "多文件编辑时自动保存
"
"basic config end

"C/C++ start
"
"taglist
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1

"WinManager
"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap wm :WMToggle<cr>

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
"
"C/C++ end

"golang start
"
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>
filetype plugin on
syntax on
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
let g:tagbar_width = 30
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"
"golang end
