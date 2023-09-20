---@diagnostic disable: missing-return, missing-fields
---@class hud_manager
---@field public hud_select_logic hud_select_logic
---@field public hud_spell_logic hud_spell_logic
---@field public hud_input_logic hud_input_logic
---@field public hud_camera_logic hud_camera_logic
local hud_manager = {}


---sets maximum zoom level
---@param zoom number
function hud_manager:set_max_zoom(zoom) end


---@type hud_manager
_G.hud = hud_manager
