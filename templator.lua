-- -- -- -- -- -- -- -- -- -- --
-- LAZY NVIM PLUGIN TEMPLATOR --
-- creator: github.com/onexbash
-- -- -- -- -- -- -- -- -- -- --

-- USAGE: place this code in any .lua file that is required in your nvim config. (e.g: ~/.config/nvim/lua/core/functions.lua)
-- restart nvim & run the editorcommand :GenPlugin

local function gen_plugin()
  -- prompt for plugin name
  local name = vim.fn.input("Enter plugin name: ")
  if name == "" then
    print("Plugin name cannot be empty")
    return
  end

  -- construct file path
  local plugin_file_path = string.format("%s/lua/plugins/%s.lua", vim.fn.stdpath("config"), name)

  -- check if file already exists
  if vim.fn.filereadable(plugin_file_path) == 1 then
    print("File already exists: " .. plugin_file_path)
    return
  end

  -- template content for the new plugin file
  local template = string.format([[
return {
  "short_url", -- Replace with the actual URL
  version = "*",
  event = "", -- lazy load on event
  ft = "", -- lazy load on filetype
  cmd = "", -- lazy load on command
  dependencies = {},
  opts = {},
  config = function()
  end
}
]])

  -- write template to new file
  local file = io.open(plugin_file_path, "w")
  if file then
    file:write(template)
    file:close()
    print("Plugin template created at: " .. plugin_file_path)
  else
    print("Failed to create file: " .. plugin_file_path)
  end
end

-- create the :GenPlugin command that executes the function
vim.api.nvim_create_user_command("GenPlugin", gen_plugin, {})

