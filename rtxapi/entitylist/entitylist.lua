---@diagnostic disable: missing-return, missing-fields
---@class entity_manager
local entity_manager = {}

---@class entity_list
local entity_list = {
    ---@type hero_table
    heroes = {},
    ---@type minion_table
    minions = {},
    ---@type wards_table
    wards = {},
    ---@type attackables_table
    attackables = {},
    ---@type attackables_table
    spawnpoints = {},
    ---@type attackables_table
    plants = {},
    ---@type inhibitors_table
    inhibitors = {},
    ---@type inhibitors_table
    turrets = {},
    ---@type attackables_table
    nexus = {},
    ---@type entity_manager
    manager = {}
}

---@param id number
---@return game_object_script
function entity_manager:get_object(id) end

---@return number
function entity_manager:get_max_objects() end

---@param id number
---@return game_object_script
function entity_manager:get_object_by_network_id(id) end

---@return game_object_script
function entity_manager:get_hovered_object() end

---@type entity_list
_G.entitylist = entity_list
