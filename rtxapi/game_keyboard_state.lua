---@diagnostic disable: missing-return
---@class game_keyboard_state
local game_keyboard_state = {}

---@param key number|keyboard_game
---@return boolean
function game_keyboard_state:is_pressed(key) end

---@type game_keyboard_state
_G.keyboard_state = game_keyboard_state
