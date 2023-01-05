-- Vapour Settings
Vapour.plugins.packer.init.max_jobs = 60
Vapour.settings.colorscheme = 'dracula'
Vapour.settings.lualine_colorscheme = 'dracula'
Vapour.settings.transparent_bg = true
Vapour.settings.always_force_write = true

-- Vapour plugins
Vapour.plugins.telescope.enabled = true
Vapour.plugins.dashboard.enabled = true
Vapour.plugins.toggleterm.enabled = true
Vapour.plugins.treesitter.enabled = true
Vapour.plugins.autopairs.enabled = true
Vapour.plugins.lsp.enabled = true
Vapour.plugins.staline.enabled = true
Vapour.plugins.gitsigns.enabled = true
Vapour.plugins.colorizer.enabled = true
Vapour.plugins.null_ls.enabled = false -- Overriding the configuration that comes with Vapour


Vapour.plugins.treesitter = {
  enabled = true,
  ensure_installed = "all",
  ignore_install = {},
  indent = { enable = false },
  autotag = { enable = true },
  rainbow = { enable = true, extended_mode = false, disable = { "html" } },
  highlight = {
    enable = true,
    disable = { 'latex', 'haskell', 'python' },
  },
  endwise = {
    enable = true,
  },
  textsubjects = {
    enable = true,
    prev_selection = ',',
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },
  playground = {
    enable = true,
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<leader>r",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        [']m'] = '@function.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
      },
    },
  },
}

-- Vapour Keybindgs -- via "Which-key"
Vapour.plugins.which_key.user_defined.r = {
  name = "Run",
  e = {":!ruby %<CR>", "Execute Ruby"},
  b = {":terminal bundle exec rspec %<CR>", "Bundle exec"},
  r = {":terminal rspec . --color --format doc<CR>", "Rspec"},
  f = {":Format<CR>", "Format"},
  i = {"m'gg=G''", "Indent"}
}
Vapour.plugins.which_key.user_defined.Z = {":source $MYVIMRC<CR>", "Reload Neovim Config"}
Vapour.plugins.which_key.user_defined.D = {
  name = "DAP Debugger",
  b = {":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint"}
}

-- User Plugins
Vapour.plugins.user = {
  -- Theme
  {'Mofiqul/dracula.nvim'}, --
  --
  -- Classic File Tree
  {'preservim/nerdtree'}, --
  --
  -- To swap two textobjects, target1 and target2, use 'cx' on target1 and 'cx' again (or '.') on target2
  --
  {'tommcdo/vim-exchange'},--
  --
  -- Yank Highlight
  {'machakann/vim-highlightedyank'}, --
  --
  -- Ruby stuff
  {'vim-ruby/vim-ruby'}, {'tpope/vim-rails'}, {'tpope/vim-bundler'}, {'tpope/vim-rake'},--
  --
  -- Tim Pop classicj
  {'tpope/vim-repeat'}, {'tpope/vim-surround'}, {'tpope/vim-fugitive'}, {'tpope/vim-unimpaired'},
  {'tpope/vim-projectionist'}, --
  --
  -- Tmux.conf syntax
  {'tmux-plugins/vim-tmux'}, --
  --
  -- CamelCase and snake_case word jumping
  {'bkad/CamelCaseMotion'}, --
  -- IntelliJ-style Expand
  {'terryma/vim-expand-region'}, --
  --
  -- Tags
  {'ludovicchabant/vim-gutentags'}, --
  --
  -- Useful plugsin from a Rubyist
  {'andrewradev/splitjoin.vim'}, {'AndrewRadev/sideways.vim'}, {'AndrewRadev/switch.vim'},
  {'AndrewRadev/tagalong.vim'}, -- changing the name of <start> tag, also changes its </start> tag
  --
  -- Collection of Snippets
  {'rafamadriz/friendly-snippets'}, --
  --
  -- Text custom_text_objects
  --{'kana/vim-textobj-user'},
  --{'kana/vim-textobj-line'}, 
  --{'kana/vim-textobj-entire'},
  --{'kana/vim-textobj-function'}, 
  --{'kana/vim-textobj-indent'},
  --{'vim-scripts/argtextobj.vim'}, --
  --{'thinca/vim-textobj-comment'}, 
  --{'thinca/vim-textobj-function-javascript'},
  --{'rhysd/vim-textobj-ruby'}, 
  --{'nelstrom/vim-textobj-rubyblock', requires = {'adelarsq/vim-matchit'}},
  --{'whatyouhide/vim-textobj-erb'}, --
  --{'coachshea/vim-textobj-markdown'}, --

  { 'RRethy/nvim-align' },
  { 'RRethy/nvim-base16' },
  { 'RRethy/nvim-hotline' },
  --{ 'RRethy/nvim-shopify-dev' },
  --{ 'RRethy/nvim-treesitter-endwise' },
  { 'RRethy/vim-eunuch' },
  { 'RRethy/vim-illuminate' },
  { 'RRethy/vim-lacklustertab' },
  { 'RRethy/vim-tranquille' },
  --{ 'RRethy/nvim-treesitter-textsubjects' },
  --{ 'editorconfig/editorconfig-vim' },
  --{ 'hashivim/vim-terraform' },
  --{ 'justinmk/vim-dirvish' },
  --{ 'kyazdani42/nvim-web-devicons' },
  --{ 'lukas-reineke/indent-blankline.nvim' },
  { 'mfussenegger/nvim-lint' },
  --{ 'neovim/nvim-lspconfig' },
  { 'numToStr/Comment.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-lua/popup.nvim' },
  --{ 'nvim-treesitter/nvim-treesitter' },
  { 'rcarriga/nvim-notify' }, -- bug with quickfix line,
  --{ 'romainl/vim-cool' },
  --{ 'shopify/vim-repoify' },
  { 'tpope/vim-abolish' },
  --{ 'tpope/vim-fugitive' },
  --{ 'tpope/vim-projectionist' },
  --{ 'tpope/vim-repeat' },
  --{ 'tpope/vim-rhubarb' },
  --{ 'tpope/vim-surround' },
  --{ 'vim-test/vim-test' },
  --{ 'williamboman/nvim-lsp-installer' },
  --{ 'windwp/nvim-autopairs' },
  --
  -- Debugger
  {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
}

-- Quy's custom null-ls config (used for formatting/beautifying code)
-- ** Disabled by Quy ** I need to tighten-up / generalize how different languages get cormatted, and the rules for their formatting.
-- require('vapour.user-config.null-ls-config')

-- Quy's custom LSP config
require('vapour.user-config.lsp-config')

-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost init.lua source <afile> | PackerSync 
-- augroup end
vim.cmd([[


map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

noremap * :set hlsearch<CR>:nohlsearch<CR>*
noremap / :set hlsearch<CR>:nohlsearch<CR>/
noremap ? :set hlsearch<CR>:nohlsearch<CR>?
nnoremap <F4> :set invhlsearch<CR>
inoremap <F4> <ESC>:set invhlsearch<CR>gi
nnoremap <CR> :set nohlsearch<CR>

nnoremap <S-H> :SidewaysLeft<cr>
nnoremap <S-L> :SidewaysRight<cr>


" Top 5 vimrc remaps from this crazy mofo
" https://www.youtube.coim/watch?v=hSHATqh8svM
"================================================================================================ 
" Capital "D", and Capital "C" effects from the cursor to the end of the line.
" Yet, Capital "Y" yanks the entire line.  Why?  Make "Y" yank from the cursor
" until the end of the line
nnoremap Y y$

" When the cursor jumps during finds or joins, have the screen/camera track
" the cursor, keeping the cursor in the middle.  This is a like the David
" Fincher camera think, or keeping the subject centered in frame, even if the
" subject is moving ever so slightly
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" This is a helpful ditty to undo just a phrase, or sentence, rather than a whole line.
" Create undo-breakss for a comma, period, exclamation, or question mark; whatever really.
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

noremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

"================================================================================================
" Required for Ruby-block 
" https://github.com/nelstrom/vim-textobj-rubyblock 
"================================================================================================
runtime macros/matchit.vim

"================================================================================================
" Enable framework snippets
"================================================================================================
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.ruby = ['rails']

"================================================================================================
" vim-expand.git settings
" https://github.com/terryma/vim-expand-region/ 
"================================================================================================

"================================================================================================
" Misc stuff that I should propbably delate"
"================================================================================================

set t_ZH=^[[3m
set t_ZR=^[[23m

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

highlight Comment cterm=italic

set termguicolors
]])

-- vim.cmd[[
-- let g:expand_region_text_objects = {
--   \ 'iw'  :0,
--   \ 'iW'  :0,
--   \ 'i"'  :0,
--   \ 'i''' :0,
--   \ 'i]'  :1,
--   \ 'ib'  :1,
--   \ 'iB'  :1,
--   \ 'il'  :0,
--   \ 'ip'  :0,
--   \ 'ie'  :0,
--   \ }
-- 
-- call expand_region#custom_text_objects({
--   \ "\/\\n\\n\<CR>": 1,
--   \ 'a]' :1,
--   \ 'ab' :1,
--   \ 'aB' :1,
--   \ 'i>' :1,
--   \ 'a>' :1,
--   \ 'it' :1,
--   \ 'at' :1,
--   \ 'ic' :0,
--   \ 'ac' :0,
--   \ 'ii' :0,
--   \ 'ai' :0,
--   \ 'if' :0,
--   \ 'af' :0,
--   \ 'im' :0,
--   \ 'am' :0,
--   \ 'ir' :0,
--   \ 'ar' :0,
--   \ })
-- 
-- let g:textobj_ruby_more_mappings = 1
-- let g:expand_region_text_objects_ruby = {
--   \ 'im' :0, 
--   \ 'am' :0, 
--   \ }
-- ]]
