---@diagnostic disable: duplicate-set-field, missing-return
---@class damagelib_manager
---@field public active_damagelib_selector number
---@field public active_damagelib_name_hash number
local damagelib_manager = {}

---@param source game_object_script
---@param target game_object_script
---@param respect_passives? boolean
function damagelib_manager:get_auto_attack_damage(source, target, respect_passives) end

---@param source game_object_script
---@param target game_object_script
---@param input damage_input
---@return number
function damagelib_manager:calculate_damage_on_unit(source, target, input) end

---@param source game_object_script
---@param target game_object_script
---@param damage_type damage_type
---@param raw_damage? boolean
---@return number
function damagelib_manager:calculate_damage_on_unit(source, target, damage_type, raw_damage) end

---@param source game_object_script
---@param target game_object_script
---@param slot spellslot
---@param return_raw_damage? boolean
---@return number
function damagelib_manager:get_spell_damage(source, target, slot, return_raw_damage) end

---@param id number
function damagelib_manager:remove_damagelib_callback(id) end

---@param _name string
function damagelib_manager:remove_damagelib_callback(_name) end

---@param _name string
---@param _get_auto_attack_damage fun(source:game_object_script,target:game_object_script,respect_passives:boolean):number
---@param _calculate_damage_on_unit fun(source:game_object_script,target:game_object_script,input:damage_input):number
---@param _calculate_damage_on_unit2 fun(source:game_object_script,target:game_object_script,damage_type:damage_type,raw_damage:number):number
---@param _get_spell_damage fun(source:game_object_script,target:game_object_script,slot:spellslot,return_raw_damage:boolean):number
---@return number
function damagelib_manager:add_damagelib_callback(_name, _get_auto_attack_damage, _calculate_damage_on_unit,
                                                  _calculate_damage_on_unit2, _get_spell_damage)
end

_G.damagelib = damagelib_manager
