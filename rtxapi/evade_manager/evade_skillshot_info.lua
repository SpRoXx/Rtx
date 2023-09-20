---@diagnostic disable: missing-return
---@class evade_skillshot_info
---@field public startpos vector
---@field public endpos vector
---@field public polygon polygon
---@field public start_time number
---@field public end_time number
---@field public spell_data_range number
---@field public spell_data_radius number
---@field public spell_data_missile_speed number
---@field public spell_data_name string
---@field public spell_data_danger_level number
---@field public spell_data_is_dangerous boolean
---@field public skillshot_type skillshot_type
---@field public unit game_object_script
---@field public slot spellslot
local evade_skillshot_info = {}

---@return evade_skillshot_info
_G.evade_skillshot_info = function() end
