---@class cb
local cb = {}


---@param callbackId events|number
---@param func function
---@return nil
function cb.add(callbackId, func) end

---@param callbackId events|number
---@param func function
---@return nil
function cb.remove(callbackId, func) end

---@type cb
_G.cb = {}
