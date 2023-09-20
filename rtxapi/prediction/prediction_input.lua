---@diagnostic disable: missing-return
---@class prediction_input
---@field public aoe boolean get or set
---@field public delay number get or set
---@field public radius number get or set
---@field public range number get or set
---@field public speed number get or set
---@field public type skillshot_type get or set
---@field public unit game_object_script get or set
---@field public use_bounding_radius boolean get or set
---@field public raw_from vector get or set
---@field public raw_range_check_from vector get or set
---@field public spell_slot spellslot get or set
---@field public from vector
---@field public range_check_from vector
---@field public real_radius number
---@field public collision_objects collisionable_objects[]
local prediction_input = {}


---@param coll_objects collisionable_objects[]
function prediction_input:set_collision_objects(coll_objects) end

---@return prediction_input
_G.prediction_input = function() end