local get_colorsheme = function()
  local builtins = {}

  for name, _ in vim.fs.dir("$VIMRUNTIME/colors/") do
    if name:match("*.txt") then
      break
    else
      name = name:match("(.*).lua$") or name:match("(.*).vim$")
      table.insert(builtins, name)
    end
  end
  local target = vim.fn.getcompletion

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.fn.getcompletion = function()
    return vim.tbl_filter(function(color)
      return not vim.tbl_contains(builtins, color)
      ---@diagnostic disable-next-line: param-type-mismatch
    end, target("", "color"))
  end

  LazyVim.telescope("colorscheme", { enable_preview = true })()
  vim.fn.getcompletion = target
end

return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  keys = {
    { "<leader>uC", get_colorsheme, desc = "Colorscheme with preview" },
  },
  opts = {
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    keys = {
      { "<leader>uC", get_colorsheme, desc = "Colorscheme with preview" },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    keys = {
      { "<leader>uC", get_colorsheme, desc = "Colorscheme with preview" },
    },
  },
}
