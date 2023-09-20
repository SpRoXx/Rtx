---@diagnostic disable: missing-return
---@class game_database
local game_database = {}

---@param hash number
---@return spell_data_script
function game_database:get_spell_by_hash(hash) end

---@param id number
---@return item_data_script
function game_database:get_item_by_id(id) end

_G.database = game_database
