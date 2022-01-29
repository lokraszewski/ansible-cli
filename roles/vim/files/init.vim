" auto-install vim-plug
if has('nvim')
    if has('win32') | let plug_path = expand('~/AppData/Local/nvim/autoload/plug.vim')
    else            | let plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
    endif
else
    if has('win32') | let plug_path = expand('~/vimfiles/autoload/plug.vim')
    else            | let plug_path = expand('~/.vim/autoload/plug.vim')
    endif
endif


let plug_remote = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

if empty(glob(plug_path))
    silent execute "!curl -fLo " . plug_path . " --create-dirs " . plug_remote
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:polyglot_disabled = ['python-ident']

call plug#begin()
    Plug 'szw/vim-maximizer'
    Plug 'kassio/neoterm'
    Plug 'tpope/vim-commentary'
    Plug 'sbdchd/neoformat'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    Plug 'mfussenegger/nvim-dap'

    Plug 'lewis6991/gitsigns.nvim'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ryanoasis/vim-devicons'

    " theme plugins
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'Mofiqul/dracula.nvim'
call plug#end()

set completeopt=menu,menuone,noselect

" lewis6991/gitsigns.nvim
lua << EOF
 require('gitsigns').setup({})
EOF

" 'hoob3rt/lualine.nvim'
lua << EOF
  require('lualine').setup({
  options = {
    theme = "dracula"
   }
  })
EOF

" sbdchd/neoformat
nnoremap <leader>F :Neoformat prettier<CR>


" nvim-telescope/telescope.nvim
lua << EOF
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end
EOF
lua << EOF
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
EOF

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist
      }
    }
  }
})
EOF

nnoremap <leader><space> :Telescope git_files<CR>
nnoremap <leader>fd :lua telescope_find_files_in_path()<CR>
nnoremap <leader>fD :lua telescope_live_grep_in_path()<CR>
nnoremap <leader>ft :lua telescope_find_files_in_path("./tests")<CR>
nnoremap <leader>fT :lua telescope_live_grep_in_path("./tests")<CR>
" nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>fo :Telescope file_browser<CR>
nnoremap <leader>fn :Telescope find_files<CR>
nnoremap <leader>fg :Telescope git_branches<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope grep_string<CR>



" neovim/nvim-lspconfig
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.tsserver.setup{}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

" 'hrsh7th/nvim-compe'
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- treesitter = true;
  };
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')



colorscheme dracula