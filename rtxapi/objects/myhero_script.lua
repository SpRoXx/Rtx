---@diagnostic disable: duplicate-set-field
---@class myhero : game_object_script
local myhero = {}


---@param target game_object_script
---@param trigger_event? boolean
---@param use_humanizer? boolean
function myhero:issue_order(target, trigger_event, use_humanizer) end

---@param game_pos vector
---@param trigger_event? boolean
---@param use_humanizer? boolean
---@param attack_move? boolean
function myhero:issue_order(game_pos, trigger_event, use_humanizer, attack_move) end

---@param type _issue_order_type
---@param trigger_event? boolean
---@param use_humanizer? boolean
function myhero:issue_order(type, trigger_event, use_humanizer) end

---@param slot spellslot
---@param trigger_event? boolean
---@param is_charging? boolean
function myhero:cast_spell(slot, trigger_event, is_charging) end

---@param slot spellslot
---@param pos vector
---@param trigger_event? boolean
---@param is_charging? boolean
function myhero:cast_spell(slot, pos, trigger_event, is_charging) end

---@param slot spellslot
---@param obj game_object_script
---@param trigger_event? boolean
---@param is_charging? boolean
function myhero:cast_spell(slot, obj, trigger_event, is_charging) end

---@param slot spellslot
---@param startPos vector
---@param endPos vector
---@param trigger_event? boolean
---@param is_charging? boolean
function myhero:cast_spell(slot, startPos, endPos, trigger_event, is_charging) end

---@param slot spellslot
---@param position vector
---@param releaseCast boolean
---@param trigger_event? boolean
function myhero:update_charged_spell(slot, position, releaseCast, trigger_event) end

---@param emote emote_type
function myhero:send_emote(emote) end

---@param position vector
---@param object? game_object_script
---@param ping_type _player_ping_type
function myhero:cast_ping(position, object, ping_type) end

---@param flags number
---@param str string
function myhero:print_chat(flags, str) end

---@param slot summoner_emote_slot
function myhero:request_to_display_emote(slot) end

---@param latency number
function myhero:send_latency_ping(latency) end

---@param hero game_object_script
---@param spell number slot
function myhero:send_spell_ping(hero, spell) end

---@param hero game_object_script
function myhero:send_hero_ping(hero) end

---@param object game_object_script
function myhero:use_object(object) end

---@param slot spellslot
function myhero:upgrade_spell(slot) end

---@param slot spellslot
function myhero:levelup_spell(slot) end

---@param slot spellslot
function myhero:evolve_spell(slot) end

---@param itm number
function myhero:buy_item(itm) end

function myhero:undo_item() end

---@param itemslot spellslot
function myhero:sell_item(itemslot) end

_G.myhero = myhero
