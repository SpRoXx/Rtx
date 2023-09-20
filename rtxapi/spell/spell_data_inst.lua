---@diagnostic disable: missing-return
---@class spell_data_inst_script
---@field public is_learned boolean
---@field public level number
---@field public toogle_state any
---@field public cast_end_time number
---@field public cooldown number
---@field public cooldown_start number
---@field public cooldown_end number
---@field public ammo number
---@field public max_ammo_spell number
---@field public name string
---@field public name_hash number
---@field public missile_speed number
---@field public spell_data spell_data_script
---@field public cooldownex_end number
---@field public icon_texture number
---@field public total_cooldown number
---@field public icon_index any
local spell_data_inst_script = {}

---@param index number
---@return number
function spell_data_inst_script:get_icon_texture_by_index(index) end
