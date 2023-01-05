Vapour.plugins.lsp.enabled = true
local lsp_installer = Vapour.utils.plugins.require('nvim-lsp-installer')

-- "sumneko_lua", -- LUA
-- "remark_ls", -- Markdown
-- "html", -- HTML
-- "cssls", -- CSS
-- "quick_lint_js", -- Javscript
-- "jsonls", -- JSON
-- "tsserver", -- Typescript
-- "tailwindcss", -- Tailwind
-- "vuels", -- Vue
-- "svelte", -- Svelte
-- "graphql", -- GraphQL
-- "solargraph", -- Ruby
-- "sorbet", -- Type-checked Ruby
-- "pyright", -- Python
-- "sorbet", -- Type-checked Ruby
-- "kotlin_language_server", --Kotlin
-- "jdtls", -- Java
-- "sourcekit", -- Swift
-- "rust_analyzer", -- Rust
-- "gols", -- Go
-- "sqlls", -- SQL
-- "yamlls", -- Yaml
-- "lemminx", -- XML
-- "bashls", -- Bash

-- Include the servers you want to have installed by default below
local servers = {
  "sumneko_lua", -- LUA
  "remark_ls", -- Markdown
  "html", -- HTML
  "emmet_ls", -- Emmet
  "cssls", -- CSS
  "quick_lint_js", -- Javscript
  "jsonls", -- JSON
  "tsserver", -- Typescript
  "graphql", -- GraphQL
  "solargraph", -- Ruby
  "sorbet", -- Type-checked Ruby
  "pyright", -- Python
  "sorbet", -- Type-checked Ruby
  "sqlls", -- SQL
  "yamlls", -- Yaml
  "lemminx", -- XML
  "bashls" -- Bash
}

-- i = {":LspInfo<cr>", "Connected Language Servers"},
-- k = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature help"},
-- K = {'<cmd>lua vim.lsp.buf.hover()<CR>', "Hover"},
-- w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder"},
-- W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder"},
-- l = {
--   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
--   "List workspace folder"
-- },
-- t = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', "Type definition"},
-- d = {'<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition"},
-- D = {'<cmd>lua vim.lsp.buf.delaration()<CR>', "Go to declaration"},
-- r = {'<cmd>lua vim.lsp.buf.references()<CR>', "References"},
-- R = {'<cmd>lua vim.lsp.buf.rename()<CR>', "Rename"},
-- a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code actions"},
-- e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', "Show line diagnostics"},
-- n = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', "Go to next diagnostic"},
-- N = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', "Go to previous diagnostic"},
-- I = {'<cmd>LspInstallInfo<cr>', 'Install language server'}

local on_attach = function(client, bufnr)
  local opts = {noremap = true, silent = false}
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gK', '<cmd>:Lspsaga signature_help<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gk', '<cmd>:Lspsaga hover_doc<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gk', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>:Lspsaga rename<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']e', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gE', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gC', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa',
                              '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr',
                              '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
                              '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                              opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  -- Note from quy: 'resolved_capabilities' is depcreated as of Nvim 0.8.1
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec([[
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]], false)
  -- end
end

local debounce_time = 1000

for _, lsp_name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(lsp_name)
  if server_is_found and not server:is_installed() then server:install() end

  -- Configure
  if server_is_found then
    if lsp_name == 'sumneko_lua' then
      Vapour.language_servers['sumneko_lua'] = {
        config = function(opts)
          opts = vim.tbl_deep_extend("force", {
            on_attach = on_attach,
            flags = {debounce_text_changes = debounce_time},
            settings = {
              Lua = {
                runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
                diagnostics = {globals = {'vim'}},
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                  preloadFileSize = 10000
                },
                telemetry = {enable = false}
              }
            }
          }, opts)
          return opts
        end
      }
    elseif lsp_name == 'solargraph' then
      Vapour.language_servers[lsp_name] = {
        config = function(opts)
          opts = vim.tbl_deep_extend("force", {
            on_attach = on_attach,
            flags = {debounce_text_changes = debounce_time},
            settings = {solargraph = {diagnostics = true}}
          }, opts)
          return opts
        end
      }
    elseif lsp_name == 'emmet_ls' then
      Vapour.language_servers[lsp_name] = {
        config = function(opts)
          opts = vim.tbl_deep_extend("force", {
            on_attach = on_attach,
            flags = {debounce_text_changes = debounce_time},
            filetypes = { "eruby", "erb", "html", "css", "typescriptreact", "javascriptreact" },
          }, opts)
          return opts
        end
      }
    else
      Vapour.language_servers[lsp_name] = {
        config = function(opts)
          opts = vim.tbl_deep_extend("force", {
            on_attach = on_attach,
            flags = {debounce_text_changes = debounce_time}
          }, opts)
          return opts
        end
      }
    end
  end
end
