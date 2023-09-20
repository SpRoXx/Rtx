---@class scheduler_manager
local scheduler_manager = {}

---@param time number
---@param fn fun()
function scheduler_manager:delay_action(time, fn) end

_G.scheduler = scheduler_manager
