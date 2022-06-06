-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'ggandor/lightspeed.nvim'
  use "tpope/vim-repeat"
  use 'Mofiqul/dracula.nvim'
  use 'simrat39/rust-tools.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'mfussenegger/nvim-jdtls'
  use {'nvim-telescope/telescope-ui-select.nvim' }
  use { "folke/which-key.nvim"}
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })
end)

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

vim.o.guifont = "Azeret Mono,Hack Nerd Font Mono,Noto Color Emoji,NotoEmoji Nerd Font:h16"
vim.o.laststatus = 3
--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.o.termguicolors = true

vim.g.catppuccin_flavor = "dusk"
vim.cmd [[colorscheme catppuccin]]
require("catppuccin").setup{}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

require "lightspeed".setup {
    ignore_case = true,
    labels = { "s", "f", "n", "j", "k", "l", "o", "d", "w", "e", "h", "m", "v", "g", "u", "c", ".", "z", "/", "F", "L", "N", "H", "G", "M", "U", "?", "Z" }
}
vim.api.nvim_exec(
[[
nmap r <Plug>Lightspeed_omni_s
nmap t <Plug>Lightspeed_s
nmap T <Plug>Lightspeed_S
silent! unmap s
silent! unmap S
silent! unmap x
silent! unmap X
]], 0
)
--Set statusbar
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
  },
}

--Enable Comment.nvim
require('Comment').setup()

--Remap space as leader key
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.autowriteall = true
vim.o.clipboard = "unnamedplus"

function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<left>", "0")
vim.keymap.set("n", "<right>", "$")
vim.keymap.set("n", "<up>", "kkkkkkk")
vim.keymap.set("n", "<down>", "jjjjjjj")
vim.keymap.set("v", "<up>", "kkkkkkk")
vim.keymap.set("v", "<down>", "jjjjjjj")
vim.keymap.set("n", "<leader>nh", "<esc>: ")
vim.keymap.set("n", "<leader>nn", "<esc>/")
vim.keymap.set("n", "<leader>w", ":w!<cr>")
vim.keymap.set("n", "<leader><leader>w", ":wq!<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader><leader>q", ":qa!<cr>")
-- map('n', '<leader><leader>e', ':q!<cr>')

vim.keymap.set("n", "<leader>j", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>k", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>h", "<C-w>h<CR>0")
-- map('n', '<leader>hh', '<C-w>h<CR>0')
vim.keymap.set("n", "<leader>l", "<C-w>l<CR>0")
-- map('n', '<leader>t', ':BufferPick<CR>')
vim.keymap.set("n", "tt", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>e", ":lua require('core/utils').close_buffer() <CR>")
vim.keymap.set("n", "<leader><leader>e", ":bdelete!<CR>")
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit")
vim.keymap.set("n", "<leader>gw", ":Gw<cr>")
vim.keymap.set("n", "<leader>gg", ":Gw<cr><esc>:sleep 100m<cr><esc>:Git commit<cr>")
vim.keymap.set("n", "<leader>gc", ":Git commit<cr>")
vim.keymap.set("n", "<leader>gs", ":! git status<cr>")
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<cr>")
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files follow=true<cr>")
vim.keymap.set("n", "<leader>fy", ":Telescope find_files follow=true<cr>")
vim.keymap.set("n", "<leader>fc", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope command_history<CR>")
vim.keymap.set("n", "gd","<cmd>lua vim.lsp.buf.definition()<CR>" )

-- map("i", "<A-A>", "<esc>:<space><backspace>")
-- map("i", "<A-S>", "<esc>/<backspace>")
-- map("n", "<A-A>", "<esc>:<space><backspace>")
-- map("n", "<A-S>", "<esc>/<backspace>")

map("n", "<leader>n", ":NvimTreeToggle<cr>")

require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Indent blankline
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader><leader><space>', ":Telescope buffers<cr>")
vim.keymap.set('n', '<leader>sf', ":Telescope find_files<cr>")
vim.keymap.set('n', '<leader>sb', ":Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set('n', '<leader>sh', ':Telescope command_history<cr>')
vim.keymap.set('n', '<leader>st', ':Telescope<cr>')
vim.keymap.set('n', '<leader>sc', ':Telescope commands<cr>')
vim.keymap.set('n', '<leader>?', ':Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader><leader>h', ":Telescope help_tags<cr>")
-- vim.keymap.set('n', '<leader>sw', ':WhichKey<cr>')

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader><leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader><leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader><leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local sumneko_binary_path = vim.fn.exepath('lua-language-server')
lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary_path},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local luasnip = require 'luasnip'
require("bufferline").setup{
  options = { offsets = {{ filetype = "NvimTree", text = "", padding = 1 }}}
}
local nvimtreeopts = {
   filters = {
      dotfiles = false,
      exclude = { "custom" },
   },
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = false,
   hijack_cursor = false,
   hijack_unnamed_buffer_when_opening = false,
   update_cwd = true,
   update_focused_file = {
      enable = true,
      update_cwd = false,
   },
   view = {
      side = "left",
      width = 25,
      hide_root_folder = true,
   },
   git = {
      enable = false,
      ignore = true,
   },
   actions = {
      open_file = {
         resize_window = true,
      },
   },
   renderer = {
      indent_markers = {
         enable = false,
      },
   },
}
require("nvim-tree").setup{nvimtreeopts}

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
-- jdtls setup
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local jdtls_jar = vim.loop.os_homedir() .. "/bin/jdt-language-server/plugins/org.eclipse.equinox.launcher_*.jar"
local jdtls_config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'start-jdtls',
    -- 'java',
    -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    -- '-Dosgi.bundles.defaultStartLevel=4',
    -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
    -- '-Dlog.protocol=true',
    -- '-Dlog.level=ALL',
    -- '-Xms1g',
    -- '-jar', jdtls_jar,
    -- '--add-modules=ALL-SYSTEM',
    -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    -- '-data',
    vim.loop.os_homedir() .. '/.local/share/jdtls_workspace/' .. project_name,
    -- '-data', vim.fn.getcwd(),
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
vim.api.nvim_create_autocmd({'BufEnter'}, { pattern = {"*.java"}, callback = function() require('jdtls').start_or_attach(jdtls_config) end })
-- vim.cmd [[autocmd BufEnter *.java  lua  ]]
-- vim.cmd [[
-- if has('nvim-0.5')
--    augroup lsp
--      au!
--      au FileType java lua require('jdtls').start_or_attach(jdtls_config)
--    augroup end
--  endif
-- ]]
