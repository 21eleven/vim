-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost',
--     { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

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
    use 'nvim-treesitter/nvim-treesitter-context'
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
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'mfussenegger/nvim-jdtls'
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { "folke/which-key.nvim" }
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })
    use 'Shatur/neovim-session-manager'
    use 'Darazaki/indent-o-matic'
    use('mrjones2014/smart-splits.nvim')
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'stevearc/aerial.nvim'
    use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
        require("toggleterm").setup()
    end }
    -- use {
    --     "max397574/better-escape.nvim",
    --     config = function()
    --         require("better_escape").setup()
    --     end,
    -- }
    use 'famiu/bufdelete.nvim'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                's1n7ax/nvim-window-picker',
                tag = "1.*",
                config = function()
                    require 'window-picker'.setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify", "quickfix" },

                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal' },
                            },
                        },
                        other_win_hl_color = '#e35e4f',
                    })
                end,
            }
        },
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'MrcJkb/haskell-tools.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
    }
    use { 'ThePrimeagen/harpoon' }
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
vim.wo.relativenumber = true
vim.o.cursorline = true

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
require("catppuccin").setup {}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.g.python_host_prog = "python"

require "lightspeed".setup {
    ignore_case = true,
    labels = { "s", "f", "n", "j", "k", "l", "o", "d", "w", "e", "h", "m", "v", "g", "u", "c", ".", "z", "/", "F", "L",
        "N", "H", "G", "M", "U", "?", "Z" }
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
]]   , 0
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

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function smart_dd()
    if vim.api.nvim_get_current_line():match("^%s*$") then
        return "\"_dd"
    else
        return "dd"
    end
end

vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })

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
vim.keymap.set("n", "<leader>j", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>k", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>h", "<C-w>h<CR>0")
-- map('n', '<leader>hh', '<C-w>h<CR>0')
vim.keymap.set("n", "<leader>l", "<C-w>l<CR>0")
-- map('n', '<leader>t', ':BufferPick<CR>')
vim.keymap.set("n", "tt", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>x", ":Bd<cr>")
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<cr>")
vim.keymap.set("n", "<leader>gw", ":Gw<cr>")
vim.keymap.set("n", "<leader>gg", ":Gw<cr><esc>:sleep 100m<cr><esc>:Git commit<cr>")
vim.keymap.set("n", "<leader>gc", ":Git commit<cr>")
vim.keymap.set("n", "<leader>gs", ":! git status<cr>")
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<cr>")
SelectGitModified = function()
    vim.ui.select(
        vim.fn.split(
            vim.fn.system('git diff --name-only'),
            '\n'
        ),
        { prompt = "unstaged files" },
        function(f) vim.api.nvim_command("e " .. f) end
    )
end

Harpoon = require('harpoon.ui')
vim.keymap.set("n", "<leader>gm", SelectGitModified)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fw", ":Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files follow=true<cr>")
vim.keymap.set("n", "<leader>fy", ":Telescope find_files follow=true<cr>")
vim.keymap.set("n", "<leader>fc", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope command_history<CR>")
vim.keymap.set("n", "<leader>ft", ":Telescope<cr>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "zh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
vim.keymap.set("n", "zm", "<cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set("n", "zk", Harpoon.nav_next);
vim.keymap.set("n", "zj", Harpoon.nav_prev);

-- map("i", "<A-A>", "<esc>:<space><backspace>")
-- map("i", "<A-S>", "<esc>/<backspace>")
-- map("n", "<A-A>", "<esc>:<space><backspace>")
-- map("n", "<A-S>", "<esc>/<backspace>")

map("n", "<leader>n", ":NvimTreeToggle<cr>")

-- leader command
vim.keymap.set("n", "<leader>cs", ":PackerSync<cr>")

-- r section

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
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
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
        wrap_results = true,
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
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'hls' }
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        -- settings = {
        --     languageServerHaskell = {
        --         formattingProvider = "stylish-haskell";
        --     };
        -- };
    }
end
local ht = require('haskell-tools')
local def_opts = { noremap = true, silent = true, }
ht.setup {
    hls = {
        -- See nvim-lspconfig's  suggested configuration for keymaps, etc.
        on_attach = function(client, bufnr)
            local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
            -- haskell-language-server relies heavily on codeLenses,
            -- so auto-refresh (see advanced configuration) is enabled by default
            vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts)
            vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
            -- default_on_attach(client, bufnr)  -- if defined, see nvim-lspconfig
        end,
        capabilities = capabilities,
        settings = {
            haskell = { -- haskell-language-server options
                formattingProvider = 'brittany',
                -- formattingProvider = 'fourmolu',
                checkProject = true, -- Setting this to true could have a performance impact on large mono repos.
                -- ...
            }
        }
    },
}
-- Suggested keymaps that do not depend on haskell-language-server
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, def_opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
    ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, def_opts)

--
-- require 'lspconfig'.hls.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         haskell = {
--             formattingProvider = "stylish-haskell";
--         };
--     };
-- }

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local sumneko_binary_path = vim.fn.exepath('lua-language-server')
lspconfig.sumneko_lua.setup {
    cmd = { sumneko_binary_path },
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
require("bufferline").setup {
    options = { offsets = { { filetype = "NvimTree", text = "", padding = 1 },
        { filetype = "neo-tree", text = "", padding = 1 } } }
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
require("nvim-tree").setup { nvimtreeopts }

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
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'pom.xml', 'gradlew' }),

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
vim.api.nvim_create_autocmd({ 'BufEnter' },
    { pattern = { "*.java" }, callback = function() require('jdtls').start_or_attach(jdtls_config) end })
-- vim.cmd [[autocmd BufEnter *.java  lua  ]]
-- vim.cmd [[
-- if has('nvim-0.5')
--    augroup lsp
--      au!
--      au FileType java lua require('jdtls').start_or_attach(jdtls_config)
--    augroup end
--  endif
-- ]]

local Path = require('plenary.path')
require('session_manager').setup({
    sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
    path_replacer = '__', -- The character to which the path separator will be replaced for session files.
    colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
    autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    autosave_last_session = true, -- Automatically save last session on exit and on session switch.
    autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
    autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
        'gitcommit',
    },
    autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})


require('indent-o-matic').setup {}

require('smart-splits').setup {}

-- recommended mappings
-- resizing splits
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

require("null-ls").setup({
    sources = {
        -- require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.completion.spell,
    },
})
local null_ls = require("null-ls")
local api = vim.api

local no_really = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown", "text" },
    generator = {
        fn = function(params)
            local diagnostics = {}
            -- sources have access to a params object
            -- containing info about the current file and editor state
            for i, line in ipairs(params.content) do
                local col, end_col = line:find("really")
                if col and end_col then
                    -- null-ls fills in undefined positions
                    -- and converts source diagnostics into the required format
                    table.insert(diagnostics, {
                        row = i,
                        col = col,
                        end_col = end_col,
                        source = "no-really",
                        message = "Don't use 'really!'",
                        severity = 2,
                    })
                end
            end
            return diagnostics
        end,
    },
}
-- really? se
null_ls.register(no_really)

-- toggle term
function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
-- local floatterm= Terminal:new({hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

-- function _terminal_toggle()
--     floatterm:toggle()
-- end
vim.api.nvim_set_keymap("n", "<leader>cg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "jg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>rt", "<cmd>lua _terminal_toggle()<CR>i")
vim.keymap.set("n", "<leader>rt", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set('t', 'jk', "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set('t', 'kj', [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>rl", "<cmd>SessionManager load_session<cr>")

require('aerial').setup({})

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" })
-- NOTE: this is changed from v1.x, which used the old style of highlight groups
-- in the form "LspDiagnosticsSignWarning"

require("neo-tree").setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- use a custom function for sorting files and directories in the tree
    -- sort_function = function (a,b)
    --       if a.type == b.type then
    --           return a.path > b.path
    --       else
    --           return a.type > b.type
    --       end
    --   end , -- this sorts files and directories descendantly
    default_component_configs = {
        container = {
            enable_character_fade = true
        },
        indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖", -- this can only be used in the git_status source
                renamed   = "", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "",
                staged    = "",
                conflict  = "",
            }
        },
    },
    window = {
        position = "left",
        width = 40,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["a"] = {
                "add",
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "none" -- "none", "relative", "absolute"
                }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
        }
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
                --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
                --"*.meta"
            },
            never_show = { -- remains hidden even if visible is toggled to true
                --".DS_Store",
                --"thumbs.db"
            },
        },
        follow_current_file = false, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = false, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        window = {
            mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
            }
        }
    },
    buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
            mappings = {
                ["bd"] = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
            }
        },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"]  = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            }
        }

    }
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
-- vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

require('rust-tools').setup({})
