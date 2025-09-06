return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      tabline = true,
    })

    vim.keymap.set("n", "<leader>af", "<cmd>lua require('harpoon.mark').add_file()<CR>")
    vim.keymap.set("n", "<leader>mf", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
    vim.keymap.set("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_next()<CR>")
    vim.keymap.set("n", "<C-p>", "<cmd>lua require('harpoon.ui').nav_prev()<CR>")

    -- Inactive tabs dimmed like comments
    vim.cmd("highlight! link HarpoonInactive Comment")
    vim.cmd("highlight! link HarpoonNumberInactive Comment")
  end,
}
