---@diagnostic disable: missing-return, assign-type-mismatch
---@class evade_manager
---@field public is_evading boolean
---@field public is_evade_disabled boolean
---@field public evading_pos vector
---@field public skillshots evade_skillshot_info[]
---@field public is_evade_registered boolean
local evade_manager = {}

function evade_manager:disable_evade() end

function evade_manager:enable_evade() end

---@param pos vector
---@return boolean
function evade_manager:is_dangerous(pos) end

---@param path vector[]
---@param time number
---@param speed? number
---@param delay? number
---@return boolean
function evade_manager:is_dangerous_path(path, time, speed, delay) end

---@param speed? number
---@param delay? number
---@param blink? boolean
---@param destination? vector
---@return vector[]
function evade_manager:get_evade_points(speed, delay, blink, destination) end

function evade_manager:unregister_evade_callbacks() end

---@param _disable_evade fun()
---@param _enable_evade fun()
---@param _is_evading fun():boolean
---@param _is_evade_disabled fun():boolean
---@param _is_dangerous fun(pos:vector):boolean
---@param _is_dangerous_path fun(path:vector[],time:number,speed:number,delay:number):boolean
---@param _evading_pos fun():vector
---@param _get_skillshots fun():evade_skillshot_info[]
---@param _get_evade_points fun(speed:number,delay:number,blink:boolean,destination:vector):vector[]
---@return boolean
function evade_manager:register_evade_callbacks(_disable_evade, _enable_evade, _is_evading, _is_evade_disabled,
                                                _is_dangerous, _is_dangerous_path, _evading_pos, _get_skillshots,
                                                _get_evade_points)
end

_G.evade = evade_manager
