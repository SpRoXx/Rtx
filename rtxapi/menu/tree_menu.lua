---@diagnostic disable: missing-return
---@class tree_menu
local tree_menu = {}

---@param tab string|TreeTab
function tree_menu:delete_tab(  tab ) end

---@param key string
---@param name string
---@return TreeTab
function tree_menu:create_tab(key, name) end

---@param key string
---@return TreeTab
function tree_menu:get_tab(key) end


_G.menu = tree_menu