---@diagnostic disable: missing-return
---@class ProrityCheckItem
---@field public display_name string
---@field public key number
---@field public is_active boolean
---@field public assigned_texture number
local ProrityCheckItem = {}

---@param key number
---@param display_name string
---@param is_active boolean
---@param texture number
---@return ProrityCheckItem
_G.ProrityCheckItem = function(key, display_name, is_active, texture) end
