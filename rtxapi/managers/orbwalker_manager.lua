---@diagnostic disable: missing-return
---@class orbwalker_manager
---@field public last_hit_mode boolean
---@field public mixed_mode boolean
---@field public lane_clear_mode boolean
---@field public combo_mode boolean
---@field public flee_mode boolean
---@field public none_mode boolean
---@field public harass boolean
---@field public target game_object_script
---@field public last_target game_object_script
---@field public last_aa_time number
---@field public last_move_time number
---@field public my_projectile_speed number
---@field public can_attack boolean
---@field public should_wait boolean
---@field public active_orbwalker number
---@field public active_orbwalker_name_hash number
---@field public orb_state number
local orbwalker_manager = {}

function orbwalker_manager:reset_auto_attack_timer() end

function orbwalker_manager:can_move(extra_windup) end

function orbwalker_manager:move_to(pos) end

function orbwalker_manager:orbwalk(target, pos) end

function orbwalker_manager:set_attack(enable) end

function orbwalker_manager:set_movement(enable) end

function orbwalker_manager:set_orbwalking_target(target) end

function orbwalker_manager:set_orbwalking_point(pos) end

---register orbwalker
---@param _name string
---@param _last_hit_mode fun():boolean
---@param _mixed_mode fun():boolean
---@param _lane_clear_mode fun():boolean
---@param _combo_mode fun():boolean
---@param _flee_mode fun():boolean
---@param _none_mode fun():boolean
---@param _harass fun():boolean
---@param _reset_auto_attack_timer fun()
---@param _get_target fun():nil|game_object_script
---@param _get_last_target fun():nil|game_object_script
---@param _get_last_aa_time fun():number
---@param _get_last_move_time fun():number
---@param _get_my_projectile_speed fun():number
---@param _can_attack fun():boolean
---@param _can_move fun(extra_windup:number):boolean
---@param _should_wait fun():boolean
---@param _move_to fun(pos:vector)
---@param _orbwalk fun(target:game_object_script,pos:vector4)
---@param _set_attack fun(enable:boolean)
---@param _set_movement fun(enable:boolean)
---@param _set_orbwalking_target fun(target:game_object_script)
---@param _set_orbwalking_point fun(target:vector)
---@param _get_orb_state fun(enable:boolean):number
---@return number
function orbwalker_manager:add_orbwalker_callback(_name,
                                                  _last_hit_mode,
                                                  _mixed_mode,
                                                  _lane_clear_mode,
                                                  _combo_mode,
                                                  _flee_mode,
                                                  _none_mode,
                                                  _harass,
                                                  _reset_auto_attack_timer,
                                                  _get_target,
                                                  _get_last_target,
                                                  _get_last_aa_time,
                                                  _get_last_move_time,
                                                  _get_my_projectile_speed,
                                                  _can_attack,
                                                  _can_move,
                                                  _should_wait,
                                                  _move_to,
                                                  _orbwalk,
                                                  _set_attack,
                                                  _set_movement,
                                                  _set_orbwalking_target,
                                                  _set_orbwalking_point,
                                                  _get_orb_state

)
end

---@param hashorname string|number
function orbwalker_manager:remove_orbwalker_callback(hashorname) end

_G.orbwalker = orbwalker_manager
