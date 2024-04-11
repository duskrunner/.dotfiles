-- TODO: think about lazyloading only scheme used in current-colorscheme.lua
local colorschemes = {
  'folke/tokyonight.nvim',
  'samharju/synthweave.nvim',
  'tiagovla/tokyodark.nvim',
  'MaxSt/FlatColor',
  'space-chalk/spacechalk.nvim',
  'zootedb0t/citruszest.nvim',
  'oxfist/night-owl.nvim',
  'barrientosvctor/abyss.nvim',
  'scottmckendry/cyberdream.nvim',
}

local function generateSchemeConfigs(plugins)
  local config = {}
  for _, value in ipairs(plugins) do
    table.insert(config, { value, lazy = false, priority = 1000 })
  end
  return config
end
return generateSchemeConfigs(colorschemes)
