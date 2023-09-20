---@class plugin_sdk_core
---@field public game_state game_state
---@field public r3d_renderer r3d_renderer
---@field public hud_manager any
---@field public menu_gui menu_gui
---@field public game_time game_time
---@field public game_ping game_ping
---@field public input any
---@field public game_event_manager any
---@field public nav_mesh nav_mesh
---@field public game_keyboard_state any
---@field public locale_manager any
---@field public mission_info any
---@field public myhero game_object_script
---@field public target_selector_manager any
---@field public prediction_manager any
---@field public entity_list any
---@field public tree_menu any
---@field public event_handler_manager any
---@field public health_prediction_manager any
---@field public orbwalker_manager any
---@field public damagelib_manager any
---@field public drawning_manager any
---@field public scheduler_manager any
---@field public game_database any
---@field public console_manager any
---@field public glow_manager any
---@field public is_valid_function any
---@field public sound_manager any
---@field public evade_manager any
---@field public neutral_camp_manager any
---@field public translation_manager any
local plugin_sdk_core = {}

function plugin_sdk_core:register_spell(slot, range) end

function plugin_sdk_core:remove_spell(spell) end


_G.plugin_sdk = plugin_sdk_core