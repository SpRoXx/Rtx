---@diagnostic disable: missing-return
---@class glow_manager
local glow_manager = {}
---@param obj game_object_script
function glow_manager:remove_glow(obj) end

---@param obj game_object_script
---@return boolean
function glow_manager:can_be_glowed(obj) end

---@param obj game_object_script
---@return boolean
function glow_manager:is_glowed(obj) end

---@param obj game_object_script
---@param color number
---@param thick? number
---@param blur? number
function glow_manager:apply_glow(obj, color, thick, blur) end

---@param obj game_object_script
---@param color number
---@param thick? number
---@param blur? number
function glow_manager:render_glow(obj, color, thick, blur) end

_G.glow = glow_manager
