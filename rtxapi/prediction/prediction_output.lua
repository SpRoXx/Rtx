---@diagnostic disable: missing-return
---@class prediction_output
---@field public hitchance hit_chance get or set
---@field public raw_aoe_targets_hit_count number get or set
---@field public input prediction_input get or set
---@field public raw_cast_position vector get or set
---@field public raw_unit_position vector get or set
---@field public aoe_targets_hit_count number
---@field public cast_position vector
---@field public unit_position vector
---@field public aoe_targets_hit game_object_script[]
---@field public collision_objects game_object_script[]
local prediction_output = {}
---@param targets game_object_script[]
function prediction_output:set_aoe_targets_hit(targets) end

---@param targets game_object_script[]
function prediction_output:set_collision_objects(targets) end

---@return prediction_output
_G.prediction_output = function() end