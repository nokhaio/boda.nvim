local colors = require('ayu.colors')
local config = require('ayu.config')
local groups = require('ayu.groups')
local ayu = {}

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
function ayu.setup(values) setmetatable(config, { __index = vim.tbl_extend('force', config.defaults, values) }) end

--- Set the colorscheme.
function ayu.colorscheme()
  if vim.version().minor < 8 then
    vim.notify('Neovim 0.8+ is required for ayu colorscheme', vim.log.levels.ERROR, { title = 'Ayu colorscheme' })
    return
  end

  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end

  vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
  vim.o.termguicolors = true
  vim.g.colors_name = 'ayu'

  colors.generate(config.mirage)
  if config.terminal then
    set_terminal_colors()
  end
  groups.set_groups()
end

return ayu
