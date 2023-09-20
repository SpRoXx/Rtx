---@diagnostic disable: duplicate-set-field, missing-return
---@class target_selector_manager
---@field public active_target_selector number
---@field public selected_target game_object_script
---@field public active_target_selector_name_hash number
local target_selector_manager = {}

---@param range number
---@param damage_type damage_type
---@param ignore_invulnerability? boolean
---@param is_missile? boolean
---@return game_object_script
function target_selector_manager:get_target(range, damage_type, ignore_invulnerability, is_missile) end

---@param name string
function target_selector_manager:remove_custom_target_selector(name) end

---@param id number
function target_selector_manager:remove_custom_target_selector(id) end

---@param targets game_object_script[]
---@param damage_type damage_type
---@return game_object_script
function target_selector_manager:get_target(targets, damage_type) end

---@param target game_object_script
function target_selector_manager:set_selected_target(target) end

---@param target game_object_script
---@return number
function target_selector_manager:get_priority(target) end

---@param target game_object_script
---@param priority number
function target_selector_manager:set_priority(target, priority) end

---@param spell script_spell
---@param min_hitchance hit_chance
---@return game_object_script
function target_selector_manager:get_target_min_hitchance(spell, min_hitchance) end

---@param spell script_spell
---@param min_hitchance hit_chance
---@param damage_type damage_type
---@return game_object_script
function target_selector_manager:get_target_min_hitchance(spell, min_hitchance, damage_type) end

---@param spell script_spell
---@param damage_type damage_type
---@return game_object_script
function target_selector_manager:get_target_spell(spell, damage_type) end

---@param target game_object_script
---@return boolean
function target_selector_manager:is_invulnerable(target) end

---@param target game_object_script
---@return boolean
function target_selector_manager:has_spellshield(target) end

---@param name string
---@param callback fun(range:number,damage_type:damage_type,ignore_invulnerability:boolean,is_missile:boolean):nil|game_object_script
---@param _callback2 fun(targets:game_object_script[],damage_type:damage_type):nil|game_object_script
---@param _get_selected_target fun():nil|game_object_script
---@param _set_selected_target fun(target:game_object_script)
---@param _get_priority fun(target:game_object_script):number
---@param _set_priority fun(target:game_object_script,priority:number)
---@return number
function target_selector_manager:add_custom_target_selector(name, callback, _callback2, _get_selected_target,
                                                            _set_selected_target, _get_priority, _set_priority)
end

_G.target_selector = target_selector_manager
