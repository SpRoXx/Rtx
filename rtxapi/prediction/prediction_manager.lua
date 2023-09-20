---@diagnostic disable: duplicate-set-field, missing-return
---@class prediction_manager
---@field public active_prediction_selector number
---@field public active_prediction_name_hash number
local prediction_manager = {}

---@param input prediction_input
---@return prediction_output
function prediction_manager:get_prediction(input) end

---@param positions vector[]
---@param input prediction_input
---@return game_object_script[]
function prediction_manager:get_collision(positions, input) end

---@param _name string
---@param _callback fun(input:prediction_input):prediction_output
---@param _callback2 fun(positions:vector[],input:prediction_input):game_object_script[]
---@return number
function prediction_manager:add_prediction_callback(_name, _callback, _callback2) end

---@param id number
function prediction_manager:remove_prediction_callback(id) end

---@param _name string
function prediction_manager:remove_prediction_callback(_name) end

---@param unit game_object_script
---@param delay number
---@return prediction_output
function prediction_manager:get_prediction(unit, delay) end

---@param unit game_object_script
---@param delay number
---@param radius number
---@return prediction_output
function prediction_manager:get_prediction(unit, delay, radius) end

---@param unit game_object_script
---@param delay number
---@param radius number
---@param speed number
---@return prediction_output
function prediction_manager:get_prediction(unit, delay, radius, speed) end

---@param unit game_object_script
---@param delay number
---@param radius number
---@param speed number
---@param collisionable collisionable_objects[]
---@return prediction_output
function prediction_manager:get_prediction(unit, delay, radius, speed, collisionable) end


_G.prediction = prediction_manager