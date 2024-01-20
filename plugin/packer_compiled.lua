-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/chitreshn/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?.lua;/home/chitreshn/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?/init.lua;/home/chitreshn/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?.lua;/home/chitreshn/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chitreshn/.cache/nvim/packer_hererocks/2.1.1702233742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["arshamiser.nvim"] = {
    config = { "\27LJ\2\nè\2\0\0\4\0\r\0\0206\0\0\0'\2\1\0B\0\2\0016\0\2\0006\1\0\0'\3\4\0B\1\2\0029\1\5\1=\1\3\0006\0\6\0009\0\a\0'\1\b\0=\1\5\0006\0\6\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0B\0\3\1K\0\1\0004%{%v:lua.require(\"arshamiser.tabline\").draw()%}\ftabline\20nvim_set_option\bapi\28v:lua.custom_foldtext()\bopt\bvim\rfoldtext\23arshamiser.folding\20custom_foldtext\a_G\25arshamiser.feliniser\frequire\0" },
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/arshamiser.nvim",
    url = "https://github.com/arsham/arshamiser.nvim"
  },
  ["arshlib.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/arshlib.nvim",
    url = "https://github.com/arsham/arshlib.nvim"
  },
  ["autoclose.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/famiu/feline.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["heirline.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/heirline.nvim",
    url = "https://github.com/rebelot/heirline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pomodoro.nvim"] = {
    config = { "\27LJ\2\nÖ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\14time_work\0032\21time_break_short\3\n\25timers_to_long_break\3\3\20time_break_long\3\30\nsetup\rpomodoro\frequire\0" },
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/pomodoro.nvim",
    url = "https://github.com/wthollingsworth/pomodoro.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/chitreshn/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: arshamiser.nvim
time([[Config for arshamiser.nvim]], true)
try_loadstring("\27LJ\2\nè\2\0\0\4\0\r\0\0206\0\0\0'\2\1\0B\0\2\0016\0\2\0006\1\0\0'\3\4\0B\1\2\0029\1\5\1=\1\3\0006\0\6\0009\0\a\0'\1\b\0=\1\5\0006\0\6\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0B\0\3\1K\0\1\0004%{%v:lua.require(\"arshamiser.tabline\").draw()%}\ftabline\20nvim_set_option\bapi\28v:lua.custom_foldtext()\bopt\bvim\rfoldtext\23arshamiser.folding\20custom_foldtext\a_G\25arshamiser.feliniser\frequire\0", "config", "arshamiser.nvim")
time([[Config for arshamiser.nvim]], false)
-- Config for: pomodoro.nvim
time([[Config for pomodoro.nvim]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\14time_work\0032\21time_break_short\3\n\25timers_to_long_break\3\3\20time_break_long\3\30\nsetup\rpomodoro\frequire\0", "config", "pomodoro.nvim")
time([[Config for pomodoro.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
