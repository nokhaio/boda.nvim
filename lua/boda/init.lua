local colors = require('boda.colors')
local config = require('boda.config')
local groups = require('boda.groups')
local boda = {}

--- Apply terminal highlighting.
local function set_terminal_colors()
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.markup
  vim.g.terminal_color_2 = colors.string
  vim.g.terminal_color_3 = colors.accent
  vim.g.terminal_color_4 = colors.tag
  vim.g.terminal_color_5 = colors.constant
  vim.g.terminal_color_6 = colors.regexp
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.fg_idle
  vim.g.terminal_color_9 = colors.error
  vim.g.terminal_color_10 = colors.string
  vim.g.terminal_color_11 = colors.accent
  vim.g.terminal_color_12 = colors.tag
  vim.g.terminal_color_13 = colors.constant
  vim.g.terminal_color_14 = colors.regexp
  vim.g.terminal_color_15 = colors.comment
  vim.g.terminal_color_background = colors.bg
  vim.g.terminal_color_foreground = colors.fg
end

--- Apply user settings.
---@param values table
function boda.setup(values) setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values) }) end

--- Set the colorscheme.
function boda.colorscheme()
  if vim.version().minor < 8 then
    vim.notify('Neovim 0.8+ is required for boda colorscheme', vim.log.levels.ERROR, { title = 'Boda colorscheme' })
    return
  end

  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
  vim.o.termguicolors = true
  vim.g.colors_name = 'boda'

  colors.generate(config.mirage)
  if config.terminal then
    set_terminal_colors()
  end
  groups.set_groups()
end

return boda
