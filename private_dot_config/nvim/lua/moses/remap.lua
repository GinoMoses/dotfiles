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
  else
    require('CopilotChat').close()
  end
  panel_state.open = false
end

local function open_panel()
  if panel_state.active == 'aerial' then
    require('aerial').open({ focus = false })
  else
    require('CopilotChat').open()
    vim.schedule(function()
      -- find the copilot-chat window and move it to the far right
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == 'copilot-chat' then
          vim.api.nvim_set_current_win(win)
          vim.cmd('wincmd L')  -- move window to far right
          vim.api.nvim_win_set_width(win, 60)
          break
        end
      end
      vim.cmd('wincmd p')  -- return focus to code buffer
    end)
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

-- <leader>ps — switch between Aerial and CopilotChat
vim.keymap.set('n', '<leader>ps', function()
  if panel_state.open and find_panel_win() then
    close_panel()
  end
  panel_state.active = panel_state.active == 'aerial' and 'copilot' or 'aerial'
  open_panel()
end, { desc = 'Switch panel (Aerial <-> CopilotChat)' })

-- Auto-open on any real file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local ft = vim.bo.filetype
    if ft == '' or ft == 'aerial' or ft == 'copilot-chat' or ft == 'dashboard' then
      return
    end
    if not find_panel_win() then
      open_panel()
    end
  end,
})
