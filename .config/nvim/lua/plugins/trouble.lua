return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "TroubleToggle", "Trouble" },
  opts = {
    use_diagnostic_signs = false,
    action_keys = {
      close = { "q", "<esc>" },
    },
  },
}
