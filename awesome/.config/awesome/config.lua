local naughty = require("naughty")
local awful = require("awful")
local config_folder = awful.util.get_configuration_dir() .. "config/"

local function file_exists(name)
   local f = io.open(name, "r")
   if f ~= nil then io.close(f) return true else return false end
end

local config = {}

local function load_file(file)
  if file_exists(file .. ".lua") then
    local data = require(file)
    for k, v in pairs(data) do
      config[k] = v
    end
  end
end

load_file(config_folder .. "default")
load_file(config_folder .. "default.local")

if os.getenv("AWESOME_CONFIG_FILE") then
  local config_file = os.getenv("AWESOME_CONFIG_FILE")
  load_file(config_folder .. config_file)
  load_file(config_folder .. config_file .. ".local")
end

return config
