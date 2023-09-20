---@diagnostic disable: missing-return
---@class TreeEntry
---@field public bool boolean
---@field public int number
---@field public color number
---@field public string string
---@field public hotkey_type number
---@field public is_hidden boolean
---@field public should_save boolean
---@field public display_name string
---@field public key string
---@field public config_key string
---@field public element_type number
---@field public tooltip string
---@field public prority_sorted_list ProrityCheckItem[]
local TreeEntry = {}

---@param key number
---@diagnostic disable-next-line: undefined-doc-name
---@return key,active
function TreeEntry:get_prority(key) end

---@param value boolean
function TreeEntry:set_bool(value) end

---@param value number
function TreeEntry:set_int(value) end

---@param list table
---@param reset_index? boolean
function TreeEntry:set_combo(list, reset_index) end

---@param texture number
function TreeEntry:set_texture(texture) end

---@param str string
function TreeEntry:set_string(str) end

---@param color number[]
function TreeEntry:set_color(color) end

---@param callback fun(entry:TreeEntry)
function TreeEntry:add_property_change_callback(callback) end

---@param callback function
function TreeEntry:remove_property_change_callback(callback) end

---@param display_name string
function TreeEntry:set_display_name(display_name) end

---@param tooltip string
---@return TreeEntry
function TreeEntry:set_tooltip(tooltip) end

---@param filter string
---@param ignore_case boolean
---@param save_filter boolean
function TreeEntry:apply_filter(filter, ignore_case, save_filter) end

---@param height number
---@param original_height number
---@param original_width number
---@param extend_image boolean
function TreeEntry:set_texture_info(height, original_height, original_width, extend_image) end

---@param value boolean
function TreeEntry:set_should_save(value) end

---@param value boolean
function TreeEntry:set_is_hidden(value) end

--- if you pass more than one char it will return 0
---@param ckey string - char code like "C","A"
---@return number
_G.char_key = function(ckey) end
