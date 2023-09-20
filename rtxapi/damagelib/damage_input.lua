---@diagnostic disable: missing-return
---@class damage_input
---@field is_auto_attack boolean
---@field is_critical_attack? boolean
---@field is_ability? boolean
---@field dont_include_passives? boolean
---@field dont_calculate_item_damage? boolean
---@field is_on_hit_damage? boolean
---@field is_targeted_ability? boolean
---@field applies_on_hit_damage? boolean
---@field doesnt_trigger_on_hit_effects? boolean
---@field raw_physical_damage number
---@field raw_magical_damage number
---@field raw_true_damage number
local damage_input = {}


---@return damage_input
_G.damage_input = function() end
