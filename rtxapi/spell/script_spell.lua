---@diagnostic disable: duplicate-set-field, missing-return
---@class script_spell
---@field public charged_min_range number
---@field public charged_max_range number
---@field public charging_started_time number
---@field public charge_duration number
---@field public type skillshot_type|number
---@field public is_charged_spell boolean
---@field public is_spell_lock_enable boolean
---@field public collision boolean
---@field public raw_range number
---@field public handle spell_data_inst_script
---@field public name string
---@field public name_hash number
---@field public cooldown_time number
---@field public mana_cost number
---@field public range number
---@field public charged_percentage number
---@field public ammo number
---@field public toogle_state number
---@field public level number
---@field public is_charging boolean
---@field public is_fully_charged boolean
---@field public collision_flags collisionable_objects[]
---@field public range_check_from vector
---@field public from vector
---@field public last_cast_spell_time number
---@field public damage_type damage_type
---@field public slot spellslot|number
---@field public speed number
---@field public delay number
---@field public radius number
---@field public is_spell_locked boolean
---@field public icon_index number
---@field public charge_buff_name number
local script_spell = {}

---@param time? number
---@return boolean
function script_spell:is_ready(time) end

function script_spell:cast() end

---@param unit game_object_script
---@param minimum hit_chance
---@param aoe? boolean
---@param min_targets? number
function script_spell:cast(unit, minimum, aoe, min_targets) end

---@param position vector
function script_spell:cast(position) end

---@param hash number
function script_spell:set_charge_buff_name(hash) end

---@param unit game_object_script
function script_spell:cast(unit) end

---@param start_position vector
---@param end_position vector
function script_spell:cast(start_position, end_position) end

---@param position vector
function script_spell:fast_cast(position) end

---@param min_minions number
---@param is_jugnle_mobs boolean
function script_spell:cast_on_best_farm_position(min_minions, is_jugnle_mobs) end

---@param position vector
function script_spell:start_charging(position) end

---@param target game_object_script
---@param stage? number
function script_spell:get_damage(target, stage) end

---@param radius number
function script_spell:set_radius(radius) end

---@param speed number
function script_spell:set_speed(speed) end

---@param delay number
function script_spell:set_delay(delay) end

---@param range number
function script_spell:set_range(range) end

---@param flags collisionable_objects[]
function script_spell:set_sollision_flags(flags) end

---@param position vector
function script_spell:set_from(position) end

---@param position vector
function script_spell:set_range_check_from(position) end

---@param delay number
---@param radius number
---@param speed number
---@param flags collisionable_objects[]
---@param skillshot_type skillshot_type
function script_spell:set_skillshot(delay, radius, speed, flags, skillshot_type) end

---@param range_min number
---@param range_max number
---@param charge_duration number
function script_spell:set_charged(range_min, range_max, charge_duration) end

---@param target game_object_script
---@param aoe? boolean
---@param overrideRange? number
function script_spell:get_prediction_no_collision(target, aoe, overrideRange) end

---@param min_minions? number
---@param is_jugnle_mobs? boolean
---@return vector
function script_spell:get_cast_on_best_farm_position(min_minions, is_jugnle_mobs) end

---@param type damage_type
function script_spell:set_damage_type(type) end

---@param unit game_object_script
---@return boolean
function script_spell:can_cast(unit) end

---@param target game_object_script|vector
---@param range number
---@return boolean
function script_spell:is_in_range(target, range) end

---@param value boolean
function script_spell:set_spell_lock(value) end

---@param extra_range? number
function script_spell:get_target(extra_range) end

---@param target game_object_script
---@param origin vector
---@param range_check_from vector
---@return prediction_output
function script_spell:get_prediction(target, origin, range_check_from) end

---@param target game_object_script
---@param aoe? boolean
---@param overrideRange? number
---@param collisionable? collisionable_objects[]
---@return prediction_output
function script_spell:get_prediction(target, aoe, overrideRange, collisionable) end

---@param from vector
---@param to_pos vector[]
---@param speedOverride? number
---@param delayOverride? number
---@param radiusOverride? number
---@return game_object_script[]
function script_spell:get_collision(from, to_pos, speedOverride, delayOverride, radiusOverride) end
