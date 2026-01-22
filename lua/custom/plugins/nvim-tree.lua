return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'JMarkin/nvim-tree.lua-float-preview',
      lazy = true,
      opts = {
        toggled_on = true,
        wrap_nvimtree_commands = true,
        scroll_lines = 20,
        window = {
          style = 'minimal',
          relative = 'win',
          border = 'rounded',
          wrap = false,
        },
        mapping = {
          down = { '<C-d>' },
          up = { '<C-e>', '<C-u>' },
          toggle = { '<C-x>' },
        },
        hooks = {
          pre_open = function(path)
            -- if file > 5 MB or not text -> not preview
            local size = require('float-preview.utils').get_size(path)
            if type(size) ~= 'number' then
              return false
            end
            local is_text = require('float-preview.utils').is_text(path)
            return size < 5 and is_text
          end,
          post_open = function(bufnr)
            return true
          end,
        },
      },
    },
  },
  config = function()
    require('nvim-tree').setup {
      --      on_attach = require('plugins.nvim-tree.on_attach').on_attach,
    }
  end,
}
