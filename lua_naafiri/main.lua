---@diagnostic disable: return-type-mismatch

-- Name: BadBitch NAAFIRI
-- Champion: Naafiri
-- Version: 1.1



local linq = require("lazylualinq")

---@type TreeTab
local mainmenu = nil


local spells = {
    ---@type script_spell
    q = nil,
    ---@type script_spell
    w = nil,
    ---@type script_spell
    e = nil,
    ---@type script_spell
    r = nil
}

local config =
{
    q = {
        combo = nil,
        harass = nil,
        laneclear = nil,
        laneclear_minions = nil,
        jungleclear = nil,
        killsteal = nil
    },
    w = {
        combo = nil,
        minrange = nil,
        jungleclear = nil,
        semi_w = nil,
        diveturret = nil
    },
    e = {
        combo = nil,
        jungleclear = nil,
        gapcloser = nil,
        diveturret = nil
    },
    r = {
        combo = nil,
        packhealth = nil,
        semi_r = nil
    },
    draw = {
        q = nil,
        qcolor = nil,
        w = nil,
        wcolor = nil,
        e = nil,
        ecolor = nil
    }
}

function get_pack_healthpercent()
    local total_max_health = linq.from(entitylist.minions.ally)
        ---@param minion game_object_script
        :where(function(minion) return minion:is_valid_target() and minion.owner and minion.owner.is_me end)
        ---@param minion game_object_script
        :sum(function(minion)
            return minion.max_health
        end)

    local total_health = linq.from(entitylist.minions.ally)
        ---@param minion game_object_script
        :where(function(minion) return minion:is_valid_target() and minion.owner and minion.owner.is_me end)
        ---@param minion game_object_script
        :sum(function(minion)
            return minion.health
        end)


    return (math.max(1, total_health) / math.max(1, total_max_health)) * 100.0
end

function combo_mode()
    local target = target_selector:get_target_spell(spells.w, damage_type.physical)

    if target and target:is_valid_target() then
        --- if q is ready and we don't dash
        if config.q.combo.bool and spells.q:is_ready() and target:get_distance(myhero) < spells.q.range and not myhero.is_dashing then
            spells.q:cast(target, hit_chance.high)
        end
        if config.r.combo.bool and myhero:count_enemies_in_range(spells.e.range + 100.0) >= 1 and spells.r:is_ready() and spells.w:is_ready() then
            if get_pack_healthpercent() < config.r.packhealth.int then
                spells.r:cast()
                return
            end
        end
        -- if enemy distance > min w range
        if config.w.combo.bool and spells.w:is_ready() and target:get_distance(myhero) > config.w.minrange.int and target:get_distance(myhero) < spells.w.range then
            ---ally turret but the oppenents side
            ---weirdos
            if config.w.diveturret.bool or not target.is_under_ally_turret then
                spells.w:cast(target)
            end
        end

        ---if enemy is not in aa range and q is not ready or q is disabled
        if config.e.combo and not myhero:is_in_auto_attack_range(target, 50.0) and target:get_distance(myhero) < spells.e.range and (spells.q:is_ready() ~= true or config.q.combo.bool == false) then
            if config.e.diveturret.bool or not target.is_under_ally_turret then
                spells.e:cast(target, hit_chance.low)
            end
        end
    end
end

function harass_mode()
    local target = target_selector:get_target_spell(spells.q, damage_type.physical)

    if target and target:is_valid_target() then
        if config.q.harass.bool and spells.q:is_ready() then
            spells.q:cast(target, hit_chance.high)
        end
    end
end

function lane_clear_mode()
    if config.q.laneclear.bool and spells.q:is_ready() then
        spells.q:cast_on_best_farm_position(config.q.laneclear_minions.int, false)
    end
end

function jungle_clear_mode()
    ---if any of q,w,e disabled just return
    if config.q.jungleclear.bool ~= true and config.e.jungleclear ~= true and config.w.jungleclear ~= true then
        return
    end

    local minion = linq.from(entitylist.minions.neutral)
        ---@param minion game_object_script
        :where(function(minion) return minion:is_valid_target(spells.q.range) end)
        ---@param minion game_object_script
        :orderByDescending(function(minion) return minion.max_health end)
        :firstOr()

    if minion then
        if config.q.jungleclear.bool and spells.q:is_ready() then
            spells.q:cast(minion, hit_chance.medium)
        end

        if config.w.jungleclear.bool and spells.w:is_ready() then
            spells.w:cast(minion)
        end

        if config.e.jungleclear.bool and spells.e:is_ready() then
            spells.e:cast(minion, hit_chance.medium)
        end
    end
end

function on_update()
    if orbwalker:can_move(0.07) then
        if orbwalker.combo_mode then
            combo_mode()
        elseif orbwalker.harass then
            harass_mode()
        elseif orbwalker.lane_clear_mode then
            lane_clear_mode()
            jungle_clear_mode()
        end
    end

    local target = target_selector:get_target_spell(spells.w, damage_type.physical)
    if config.w.semi_w.bool and spells.w:is_ready() and target:get_distance(myhero) < spells.w.range then
        spells.w:cast(target)
    end

    if config.r.semi_r.bool and spells.r:is_ready() then
        spells.r:cast()
    end
end

---@param sender game_object_script
---@param args antigapcloser_args
function on_anti_gapcloser(sender, args)
    if config.e.gapcloser.bool and sender and sender.is_enemy and args.end_position:distance(myhero) < 300 and spells.e:is_ready() then
        local castPos = myhero.position:extend(sender.position, 0.0 - spells.e.range)
        spells.e:cast(castPos)
    end
end

function on_env_draw()
    if config.draw.q.bool then
        draw_manager:add_circle(myhero.position, spells.q.range, config.draw.qcolor.color)
    end

    if config.draw.w.bool then
        draw_manager:add_circle(myhero.position, spells.w.range, config.draw.wcolor.color)
    end

    if config.draw.e.bool then
        draw_manager:add_circle(myhero.position, spells.e.range, config.draw.ecolor.color)
    end
end

function on_draw()
    local status = string.format("Dive Turret: %s", tostring(config.w.diveturret.bool))
    local text_w = draw_manager:calc_text_size(22, status).x + 1
    local position = myhero.position:worldtoscreen() + vector(-text_w / 2, 20)

    draw_manager:add_text_on_screen(position, MAKE_COLOR(255, 255, 255, 255), 22,
        status)
end

function set_menu_icon(spell, entry)
    if spell.handle then
        entry:set_assigned_texture(spell.handle.icon_texture)
    end
end

function setup_menu()
    mainmenu = menu:create_tab("RTX.Naafiri", "Naafiri")
    mainmenu:set_assigned_texture(myhero.square_icon_portrait)

    --- Q Settings
    local q_settings = mainmenu:add_tab("Naafiri.Q", "Darkin Daggers (Q)")
    q_settings:add_separator("Naafiri.Q.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.q, q_settings)
    config.q.combo = q_settings:add_checkbox("Naafiri.Q.Combo", "Use in Combo", true)
    q_settings:add_separator("Naafiri.Q.Separator.Harass", "Harass Mode")
    config.q.harass = q_settings:add_checkbox("Naafiri.Q.Harass", "Use in Harass", true)
    q_settings:add_separator("Naafiri.Q.Separator.LaneClear", "LaneClear Mode")
    config.q.laneclear = q_settings:add_checkbox("Naafiri.Q.LaneClear", "Use in LaneClear", false)
    config.q.laneclear_minions = q_settings:add_slider("Naafiri.Q.LaneClearMinions", "Minimum Minions", 2, 1, 5)
    config.q.laneclear_minions:set_tooltip("Minimum Minions to hit")
    q_settings:add_separator("Naafiri.Q.Separator.JungleClear", "JungleClear Mode")
    config.q.jungleclear = q_settings:add_checkbox("Naafiri.Q.JungleClear", "Use in JungleClear", true)
    --q_settings:add_separator("Naafiri.Q.Separator.Killsteal", "KillSteal Mode")
    --config.q.killsteal = q_settings:add_checkbox("Naafiri.Q.Killsteal", "Use in KillSteal", true)

    --- W Settings
    local w_settings = mainmenu:add_tab("Naafiri.W", "Hounds' Pursuit (W)")
    w_settings:add_separator("Naafiri.W.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.w, w_settings)
    config.w.combo = w_settings:add_checkbox("Naafiri.W.Combo", "Use in Combo", false)
    config.w.minrange = w_settings:add_slider("Naafiri.W.MinRange", "Minimum Range", 550, 0, 900)
    w_settings:add_separator("Naafiri.W.Separator.JungleClear", "JungleClear Mode")
    config.w.jungleclear = w_settings:add_checkbox("Naafiri.W.JungleClear", "Use in JungleClear", true)
    w_settings:add_separator("Naafiri.W.Separator.Misc", "Misc")
    config.w.diveturret = w_settings:add_hotkey("Naafiri.W.DiveTurret", "DiveTurret", tree_hotkey_mode.Toggle,
        char_key("U"), false)
        w_settings:add_separator("Naafiri.W.Separator.semi", "semi w cast")
        config.w.semi_w = w_settings:add_hotkey("Naafiri.W.SemiCast", "Semi Manual W Cast", tree_hotkey_mode.Hold,
            char_key("W"), false)

            
    --- E Settings
    local e_settings = mainmenu:add_tab("Naafiri.E", "Eviscerate (E)")
    e_settings:add_separator("Naafiri.E.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.e, e_settings)
    config.e.combo = e_settings:add_checkbox("Naafiri.E.Combo", "Use in Combo", true)
    e_settings:add_separator("Naafiri.E.Separator.JungleClear", "JungleClear Mode")
    config.e.jungleclear = e_settings:add_checkbox("Naafiri.E.JungleClear", "Use in JungleClear", true)

    e_settings:add_separator("Naafiri.E.Separator.gapcloser", "Anti GapCloser")
    config.e.gapcloser = e_settings:add_checkbox("Naafiri.E.gapcloser", "Use E", true)

    e_settings:add_separator("Naafiri.E.Separator.Misc", "Misc")
    config.e.diveturret = e_settings:add_hotkey("Naafiri.E.DiveTurret", "DiveTurret", tree_hotkey_mode.Toggle,
        char_key("U"), false)

    --- R Settings
    local r_settings = mainmenu:add_tab("Naafiri.R", "The Call of the Pack (R)")
    r_settings:add_separator("Naafiri.R.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.r, r_settings)
    config.r.combo = r_settings:add_checkbox("Naafiri.R.Combo", "Use in Combo", false)
    config.r.packhealth = r_settings:add_slider("Naafiri.R.PackHealth", "Use If Pack HealthPercent < %", 80, 10, 100)
    r_settings:add_separator("Naafiri.R.Separator.Misc", "Misc")
    config.r.semi_r = r_settings:add_hotkey("Naafiri.R.SemiCast", "Semi Manual R Cast", tree_hotkey_mode.Hold,
        char_key("G"), false)


    local draw_settings = mainmenu:add_tab("Naafiri.Draw", "Drawings")
    draw_settings:add_separator("Naafiri.Draw.Separator.Q", "Darkin Daggers (Q)")
    config.draw.q = draw_settings:add_checkbox("Naafiri.Draw.Q", "Enabled", true)
    config.draw.qcolor = draw_settings:add_colorpick("Naafiri.Draw.QColor", "Color", { 0.953, 0.773, 0.498, 1.0 })
    draw_settings:add_separator("Naafiri.Draw.Separator.W", "Hounds' Pursuit (W)")
    config.draw.w = draw_settings:add_checkbox("Naafiri.Draw.W", "Enabled", true)
    config.draw.wcolor = draw_settings:add_colorpick("Naafiri.Draw.WColor", "Color", { 0.443, 0.678, 0.675, 1.0 })
    draw_settings:add_separator("Naafiri.Draw.Separator.E", "Eviscerate (E)")
    config.draw.e = draw_settings:add_checkbox("Naafiri.Draw.E", "Enabled", true)
    config.draw.ecolor = draw_settings:add_colorpick("Naafiri.Draw.EColor", "Color", { 0.604, 0.349, 0.722, 1.0 })
end

function on_sdk_load(sdk)
    if myhero.champion ~= champion_id.Naafiri then
        myhero:print_chat(0, "Champion is not supported")
        return false
    end


    spells.q = plugin_sdk:register_spell(spellslot.q, 900.0)
    spells.w = plugin_sdk:register_spell(spellslot.w, 700.0)
    spells.e = plugin_sdk:register_spell(spellslot.e, 350.0)
    spells.r = plugin_sdk:register_spell(spellslot.r, 2100.0)

    spells.q:set_skillshot(0.25, 70.0, 1700.0, { collisionable_objects.yasuo_wall }, skillshot_type.skillshot_line)
    spells.e:set_skillshot(0.25, 210, 900.0, {}, skillshot_type.skillshot_circle)

    setup_menu()



    cb.add(events.on_update, on_update)
    cb.add(events.on_env_draw, on_env_draw)
    cb.add(events.on_draw, on_draw)
    cb.add(events.on_anti_gapcloser, on_anti_gapcloser)
    return true
end

function on_sdk_unload(sdk)
    if mainmenu ~= nil then
        --- always remove callbacks
        cb.remove(events.on_update, on_update)
        cb.remove(events.on_env_draw, on_env_draw)
        cb.remove(events.on_draw, on_draw)
        cb.remove(events.on_anti_gapcloser, on_anti_gapcloser)

        --- dont forget to cleanup spells
        plugin_sdk:remove_spell(spells.q)
        plugin_sdk:remove_spell(spells.w)
        plugin_sdk:remove_spell(spells.e)
        plugin_sdk:remove_spell(spells.r)

        menu:delete_tab(mainmenu)
    end
end
