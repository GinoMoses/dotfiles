return {
  'andweeb/presence.nvim',
  version = '*',
  config = function ()
    require("presence").setup({
      auto_update         = "true",
      neovim_image_text   = "The One True Text Editor"
    })
  end,
}
