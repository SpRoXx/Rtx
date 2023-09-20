---@diagnostic disable: duplicate-set-field, missing-return
---@class health_prediction_manager
---@field public active_health_prediction number
---@field public active_health_prediction_name_hash number
local health_prediction_manager = {}


---@param minion game_object_script
---@return game_object_script
function health_prediction_manager:get_aggro_turret(minion) end

---@param minion game_object_script
---@return number
function health_prediction_manager:turret_aggro_start_time(minion) end

---@param minion game_object_script
---@return boolean
function health_prediction_manager:has_turret_aggro(minion) end

---@param minion game_object_script
---@return boolean
function health_prediction_manager:has_minion_aggro(minion) end

---@param unit game_object_script
---@param time number
---@param delay number
---@return number
function health_prediction_manager:get_health_prediction(unit, time, delay) end

---@param unit game_object_script
---@param time number
---@param delay? number default value : 0.07
---@return number
function health_prediction_manager:get_lane_clear_health_prediction(unit, time, delay) end

---@param unit game_object_script
---@param time number
---@param include_skillshot boolean
---@return number
function health_prediction_manager:get_incoming_damage(unit, time, include_skillshot) end

---@param source game_object_script
---@param target game_object_script
---@return boolean
function health_prediction_manager:has_agro_on(source, target) end

---@param minion game_object_script
---@return number
function health_prediction_manager:minions_aggro_count(minion) end

---@param id number
function health_prediction_manager:remove_health_prediction_callback(id) end

---@param _name string
function health_prediction_manager:remove_health_prediction_callback(_name) end

---@param name string
---@param _get_aggro_turret fun(minion:game_object_script):game_object_script
---@param _turret_aggro_start_time fun(minion:game_object_script):number
---@param _has_turret_aggro fun(minion:game_object_script):boolean
---@param _has_minion_aggro fun(minion:game_object_script):boolean
---@param _get_health_prediction fun(unit:game_object_script,time:number,delay:number):number
---@param _get_lane_clear_health_prediction fun(unit:game_object_script,time:number,delay:number):number
---@param _get_incoming_damage  fun(unit:game_object_script,time:number,include_skillshot:boolean):number
---@param _has_agro_on fun(source:game_object_script,target:game_object_script):boolean
---@param _minions_aggro_count fun(minion:game_object_script):number
---@return number
function health_prediction_manager:add_health_prediction_callback(name,
                                                                  _get_aggro_turret,
                                                                  _turret_aggro_start_time,
                                                                  _has_turret_aggro,
                                                                  _has_minion_aggro,
                                                                  _get_health_prediction,
                                                                  _get_lane_clear_health_prediction,
                                                                  _get_incoming_damage,
                                                                  _has_agro_on,
                                                                  _minions_aggro_count
)
end

_G.health_prediction = health_prediction_manager
