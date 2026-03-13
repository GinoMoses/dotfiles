vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
local panel_state = {
  active = 'aerial',
  open   = true,
}

-- panel
local function find_panel_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft  = vim.bo[buf].filetype
    if ft == 'aerial' or ft == 'copilot-chat' then
      return win
    end
  end
  return nil
end

local function close_panel()
  if panel_state.active == 'aerial' then
    require('aerial').close()
  end
  panel_state.open = false
end

local function open_panel()
  if panel_state.active == 'aerial' then
    require('aerial').open({ focus = false })
 end
  panel_state.open = true
end

-- <leader>pp — toggle panel open/closed
vim.keymap.set('n', '<leader>pp', function()
  if panel_state.open and find_panel_win() then
    close_panel()
  else
    open_panel()
  end
end, { desc = 'Toggle right panel' })


