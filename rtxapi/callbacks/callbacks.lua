---@diagnostic disable: missing-return
---@param sdk plugin_sdk_core
---@return nil
function on_sdk_load(sdk) end

---@param sdk plugin_sdk_core
---@return nil
function on_sdk_unload(sdk) end

---@param sender game_object_script
function on_create(sender) end

---@param sender game_object_script
function on_delete(sender) end

function on_update() end

function on_draw() end

---@param sender game_object_script
---@param spell spell_instance_script
function on_process_spell_cast(sender, spell) end

---@param sender game_object_script
---@param spell spell_instance_script
function on_do_cast(sender, spell) end

---@param sender game_object_script
---@param spell spell_instance_script
function on_stop_cast(sender, spell) end

---@param sender game_object_script
function on_object_dead(sender) end

---@param sender game_object_script
function on_object_respawn(sender) end

---@param sender game_object_script
---@param buff buff_instance_script
function on_buff_gain(sender, buff) end

---@param sender game_object_script
---@param buff buff_instance_script
function on_buff_lose(sender, buff) end

---@param sender game_object_script
---@param path vector[]
---@param is_dash boolean
---@param dash_speed number
function on_new_path(sender, path, is_dash, dash_speed) end

---@param sender game_object_script
function on_after_attack_orbwalker(sender) end

---@param target game_object_script
---@param process boolean - readonly
---@return boolean - set process here
function on_before_attack_orbwalker(target, process) end

---@param target game_object_script
---@param pos vector
---@param type _issue_order_type
---@param process boolean - readonly
---@return boolean - set process here
function on_issue_order(target, pos, type, process) end

---@param spell_slot spellslot
---@param target game_object_script
---@param pos vector
---@param pos2 vector
---@param is_charge boolean
---@param process boolean - readonly
---@return boolean - set process here
function on_cast_spell(spell_slot, target, pos, pos2, is_charge, process) end

function on_preupdate() end

---@param sender game_object_script
---@param name string
function on_play_animation(sender, name) end

---@param sender game_object_script
---@param network_id number
---@param type pkttype_e
---@diagnostic disable-next-line: undefined-doc-name
---@param args PKT_S2C_PlayAnimationArgs - atm only packet useless use , on_play_animation instead
function on_network_packet(sender, network_id, type, args) end

function on_reconnect() end

---@param hash_name number
---@param name string
---@param params global_event_params_script
function on_global_event(hash_name, name, params) end

function on_render_mouse_overs() end

---@param minion game_object_script
function on_unkillable_minion(minion) end

function on_env_draw() end

---@param message string
---@param type number
---@param process boolean
---@diagnostic disable-next-line: undefined-doc-name
---@return process,message - default : true,"" - modified = true,"modified text" - block process - false,""
function on_send_chat(message, type, process) end


---@param sender game_object_script
---@param args antigapcloser_args
function on_anti_gapcloser(sender,args) end