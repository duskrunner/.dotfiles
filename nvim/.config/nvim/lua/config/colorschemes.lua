-- TODO: think about lazyloading only scheme used in current-colorscheme.lua
local colorschemes = {
  'oxfist/night-owl.nvim',
  'tsuzat/neosolarized.nvim',
  'sjl/badwolf',
  'srcery-colors/srcery-vim',
}

local function generateSchemeConfigs(plugins)
  local config = {}
  for _, value in ipairs(plugins) do
    table.insert(config, { value, lazy = false, priority = 1000 })
  end
  return config
end
return generateSchemeConfigs(colorschemes)
