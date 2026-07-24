-- Colors:
-- Black: #0A0E14 -- Background
-- Grey: #B3B1AD
-- Light grey: #B3B1ADBF // 75% alpha
-- Yellow: #E6B450
-- Orange: #FFB454
-- Red: #FF8F40
-- Blue: #59C2FF
-- {
--     "bgColor": "#0A0E14", -- Background
--     "textColor": "#B3B1AD", -- Plain text
--     "punctuationColor": "#B3B1AD", -- Punctuation
--     "stringAndValueColor": "#C2D94C", -- Strings, values
--     "keywordTagColor": "#FF8F40", -- Keywords, tags
--     "commentColor": "#626A73", -- Comments
--     "typeColor": "#FFB454", -- Types
--     "numberColor": "#E6B450", -- Numbers
--     "declarationColor": "#B3B1AD", -- Declarations
--     "dimmedColor": "#666666", -- Selection: Unfocused
--     "highlightColor": "#1B2733F2" -- Selection: Highlighter
-- }

local dark = require('colors.dark')
local light = require('colors.light')
local dark_mirage = require('colors.mirage')
local colors = {
  white = '#FFFFFF',
  black = '#000000',

  -- This color is not part of `ayu` but matches the default style applied in VSCode.
  lsp_inlay_hint = '#969696',

  bgColor = '#0A0E14',
  textColor = '#B3B1AD',
  punctuationColor = '#B3B1AD',
  stringAndValueColor = '#C2D94C',
  keywordTagColor = '#FF8F40',
  commentColor = '#626A73',
  typeColor = '#FFB454',
  numberColor = '#E6B450',
  declarationColor = '#B3B1AD',
  dimmedColor = '#666666',
  highlightColor = '#1B2733F2',
}

function colors:load_dark()
  for key, value in pairs(dark) do
    self[key] = value
  end
end

function colors:load_light()
  for key, value in pairs(light) do
    self[key] = value
  end
end

function colors:load_dark_mirage()
  for key, value in pairs(dark_mirage) do
    self[key] = value
  end
end

--- Generate colors based `vim.o.background` and a variant.
---@param mirage boolean: Whether to use `mirage` variant when `vim.o.background` is dark.
	function colors.generate(mirage)
  if vim.o.background == 'dark' then
    if mirage then
      colors:load_dark_mirage()
    else
      colors:load_dark()
    end
  else
    colors:load_light()
  end
end


return colors
