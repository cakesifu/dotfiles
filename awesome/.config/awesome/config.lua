local naughty = require("naughty")
local awful = require("awful")
local config_folder = awful.util.get_configuration_dir() .. "config/"

local function file_exists(name)
   local f = io.open(name, "r")
   if f ~= nil then io.close(f) return true else return false end
end

local config_data = {}

local function load_file(file)
  if file_exists(config_folder .. file .. ".lua") then
    local data = require("config/" .. file)
    for k, v in pairs(data) do
      config_data[k] = v
    end
  end
end

load_file("default")
load_file("default.local")

if os.getenv("AWESOME_CONFIG_FILE") then
  local config_file = os.getenv("AWESOME_CONFIG_FILE")
  load_file(config_file)
  load_file(config_file .. ".local")
end

return config_data
