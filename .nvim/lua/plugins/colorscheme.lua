-- ================================
-- Colorscheme Configuration
-- ================================

return {
  -- Solarized colorscheme
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized").setup({
        variant = "winter", -- "spring" | "summer" | "autumn" | "winter"
        palette = "solarized", -- solarized | selenized
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
        },
        enables = {
          editor = true,
          syntax = true,
          terminal = true,
        },
        highlights = {},
        colors = {},
        theme = "default", -- "default" | "neo"
        autocmd = true,
      })
    end,
  },
}