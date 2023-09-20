---@diagnostic disable: missing-return
---@class item_data_script
---@field public item_id number
local item_data_script = {}


---@param index? number
---@return number
function item_data_script:get_texture(index) end

---@param index? number
---@return vector4
function item_data_script:get_texture_uv(index) end

-------------------------------------------------

---@class item_script
---@field public item_id number
---@field public item_count number
local item_script = {}


---@param index? number
---@return number
function item_script:get_texture(index) end

---@param index? number
---@return vector4
function item_script:get_texture_uv(index) end
