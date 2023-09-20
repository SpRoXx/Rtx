---@diagnostic disable: missing-return
---@class TreeTab : TreeEntry
local TreeTab = {}

---@param key string
---@return TreeEntry
function TreeTab:get_entry(key) end

---@param key string
---@param name string
---@return TreeTab
function TreeTab:add_tab(key, name) end

---@param key string
---@param name string
---@return TreeEntry
function TreeTab:add_separator(key, name) end

---@param key string
---@param name string
---@param type tree_hotkey_mode
---@param vkey number
---@param default_value boolean
---@param should_save? boolean - true
---@return TreeEntry
function TreeTab:add_hotkey(key, name, type, vkey, default_value, should_save) end

---@param key string
---@param name string
---@param default_value boolean
---@param should_save? boolean - true
---@return TreeEntry
function TreeTab:add_checkbox(key, name, default_value, should_save) end

---@param key string
---@param name string
---@param default_value number
---@param min number
---@param max number
---@param should_save? boolean - true
---@return TreeEntry
function TreeTab:add_slider(key, name, default_value, min, max, should_save) end

---@param key string
---@param name string
---@param value number
---@return TreeEntry
function TreeTab:add_display_value(key, name, value) end

---@param key string
---@param name string
---@param combo_elements table
---@param default_value number
---@param should_save? boolean - true
---@return TreeEntry
function TreeTab:add_combobox(key, name, combo_elements, default_value, should_save) end

---@param key string
---@param name string
---@param default_color number[]
---@param should_save? boolean - true
---@return TreeEntry
function TreeTab:add_colorpick(key, name, default_color, should_save) end

---@param key string
---@param name string
---@param prority_elements ProrityCheckItem[]
---@param always_active boolean
---@param should_save? boolean - true
---@return TreeEntry
function TreeTab:add_prority_list(key, name, prority_elements, always_active, should_save) end

---@param key string
---@param texture number
---@param height number
---@return TreeEntry
function TreeTab:add_image_item(key, texture, height) end

---@param key string
---@param name string
---@param default_value string
---@param should_save? boolean - true
---@return TreeEntry
function TreeTab:add_text_input(key, name, default_value, should_save) end

---@param key string
---@param name string
---@return TreeEntry
function TreeTab:add_button(key, name) end

---@param enabled boolean
function TreeTab:set_revert_enabled(enabled) end

---@param texture number
function TreeTab:set_assigned_texture(texture) end

---@param active TreeEntry|boolean
function TreeTab:set_assigned_active(active) end

---@param key string
---@param texture number
---@param height number
---@param original_height number
---@param original_width number
---@param extend_image? boolean
---@return TreeEntry
function TreeTab:add_image_item2(key, texture, height, original_height, original_width, extend_image) end
