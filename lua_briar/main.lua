---@diagnostic disable: return-type-mismatch

-- Name: RTX Briar
-- Champion: Briar
-- Version: 1.0
-- Date: 14.09.2023
-- Simple plugin for script developers

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
    e2 = nil,
    ---@type script_spell
    r = nil
}

local config =
{
    q = {
        combo = nil,
        afteraa = nil,
        harass = nil,
        jungleclear = nil,
        killsteal = nil
    },
    w = {
        combo = nil,
        forcew = nil,
        jungleclear = nil
    },
    e = {
        combo = nil,
        jungleclear = nil,
        wallsearch = nil
    },
    r = {
        combo = nil,
        semi_r = nil
    },
    misc = {
        diveturret = nil
    },
    draw = {
        q = nil,
        qcolor = nil,
        w = nil,
        wcolor = nil,
        e = nil,
        ecolor = nil,
        r = nil,
        rcolor = nil,
        ewall = nil
    }
}

local last_e_position = vector()


---@param sender game_object_script
---@param spell spell_instance_script
function on_process_spell_cast(sender, spell)
    if sender and sender.is_me and spell.spellslot == spellslot.e then
        last_e_position = spell.end_position
    end
end

---@param target game_object_script
function on_after_attack_orbwalker(target)
    -- cast q after auto attack for aa reset
    if target ~= nil and config.q.afteraa.bool and spells.q:is_ready() and target.is_ai_hero and target:is_valid_target(spells.q.range) then
        spells.q:cast(target)
        orbwalker:reset_auto_attack_timer()
    end
end

function is_ultimate_active()
    return myhero:has_buff(buff_hash("BriarRSelf"))
end

function is_w_active()
    return myhero:has_buff(buff_hash("BriarWFrenzyBuff"))
end

function is_w_about_to_end()
    local buff = myhero:get_buff(buff_hash("BriarWFrenzyBuff"))

    if buff ~= nil then
        if buff.remaining_time < 1.0 then
            return true
        end
    end
    return false
end

function is_stunnable(target)
    if target == nil then
        return false
    end
    local e_prediction = spells.e2:get_prediction(target)
    for i = 40, config.e.wallsearch.int, 60 do
        local posWall = e_prediction.cast_position:extend(myhero.position, -i)

        if posWall:is_wall() then
            return true
        end
    end
    return false
end

function combo_mode()
    local target = target_selector:get_target(spells.e.charged_max_range, damage_type.physical)

    if target == nil then
        return
    end

    if config.e.combo.bool and not is_ultimate_active() and not is_w_active() then
        if not spells.e.is_charging and spells.e:is_ready() then
            --start e charge if we're able to stun enemy
            if is_stunnable(target) then
                local e_prediction = spells.e2:get_prediction(target)

                spells.e:start_charging(e_prediction.cast_position)
            end
        end

        if spells.e.is_charging then
            -- if e spell isfully charged then we just cast
            if spells.e.is_fully_charged then
                spells.e:cast(target.position)
                return
            end

            ---if enemy tries to escape the e radius then just cast for the damage
            if last_e_position:is_valid() then
                local fastPred = geometry.position_after(target.real_path, spells.e.delay, target.move_speed)
                local ePosition = myhero.position:extend(last_e_position, spells.e.charged_max_range)

                local eRectangle = rectangle(myhero.position, ePosition, spells.e.radius):to_polygon()

                if eRectangle:is_outside(fastPred) and eRectangle:is_inside(target.position) then
                    spells.e:cast(target.position)
                    return
                end
            end
        end
    end

    -- first check if enemy is not under turret
    if config.misc.diveturret.bool or not target.is_under_ally_turret then
        if config.w.combo.bool and spells.w:is_ready() then
            if target:get_distance(myhero) < spells.w.range then
                if is_w_active() then
                    if myhero.health_percent < 80 or is_w_about_to_end() then
                        spells.w:cast(target.position)
                    end
                else
                    spells.w:cast(target.position)
                end
            end
        end
    end

    if config.w.forcew.bool and is_ultimate_active() and spells.w:is_ready() then
        if target:get_distance(myhero) < spells.w.range then
            spells.w:cast(target.position)
        end
    end

    if config.misc.diveturret.bool or not target.is_under_ally_turret then
        if config.q.combo.bool and spells.q:is_ready() and target:get_distance(myhero) < spells.q.range then
            if not myhero:is_in_auto_attack_range(target, 100) then
                spells.q:cast(target)
            end
        end
    end
end

function harass_mode()
    local target = target_selector:get_target_spell(spells.q, damage_type.physical)

    if target and target:is_valid_target() then
        if config.q.harass.bool and spells.q:is_ready() then
            spells.q:cast(target)
        end
    end
end


function jungle_clear_mode()
    ---if any of q,w,e disabled just return
    if config.q.jungleclear.bool ~= true and config.e.jungleclear.bool ~= true and config.w.jungleclear.bool ~= true then
        return
    end

    ---@type game_object_script
    local minion = linq.from(entitylist.minions.neutral)
        ---@param minion game_object_script
        :where(function(minion) return minion:is_valid_target(spells.q.range) end)
        ---@param minion game_object_script
        :orderByDescending(function(minion) return minion.max_health end)
        :firstOr()

    if minion then
        if config.q.jungleclear.bool and spells.q:is_ready() then
            spells.q:cast(minion)
        end

        if config.w.jungleclear.bool and spells.w:is_ready() then
            if is_w_active() then
                if myhero.health_percent < 80 or is_w_about_to_end() then
                    spells.w:cast(minion.position)
                end
            else
                spells.w:cast(minion.position)
            end
        end

        if config.e.jungleclear.bool and spells.e:is_ready() and not is_w_active() then
            -- if minion about to escape e radius
            if last_e_position:is_valid() and spells.e.is_charging then
                local fastPred = geometry.position_after(minion.real_path, spells.e.delay, minion.move_speed)
                local ePosition = myhero.position:extend(last_e_position, spells.e.charged_max_range)

                local eRectangle = rectangle(myhero.position, ePosition, spells.e.radius):to_polygon()

                if eRectangle:is_outside(fastPred) and eRectangle:is_inside(minion.position) then
                    spells.e:cast(minion.position)
                    return
                end
            end

            if not spells.e.is_charging then
                spells.e:start_charging(minion.position)
            end

            if spells.e.is_fully_charged then
                spells.e:cast(minion)
            end
        end
    end
end

function on_update()
    spells.e:set_delay(myhero.attack_cast_delay) -- wiki says 100% attack cast delay recast

    if orbwalker:can_move(0.07) then
        if orbwalker.combo_mode then
            combo_mode()
        elseif orbwalker.harass then
            harass_mode()
        elseif orbwalker.lane_clear_mode then
            jungle_clear_mode()
        end
    end


    if config.r.semi_r.bool and spells.r:is_ready() then
        local target = linq.from(entitylist.heroes.enemy)
            ---@param hero game_object_script
            :where(function(hero) return hero:is_valid_target(spells.r.range) end)
            ---@param hero game_object_script
            :orderBy(function(hero) return hero:get_distance(hud.hud_input_logic.game_cursor_position) end)
            :firstOr()

        if target ~= nil then
            spells.r:cast(target, hit_chance.high)
        end
    end
end

function on_env_draw()
    if config.draw.q.bool and spells.q:is_ready() then
        draw_manager:add_circle(myhero.position, spells.q.range, config.draw.qcolor.color)
    end

    if config.draw.w.bool and spells.w:is_ready() then
        draw_manager:add_circle(myhero.position, spells.w.range, config.draw.wcolor.color)
    end

    if config.draw.e.bool and spells.e:is_ready() then
        draw_manager:add_circle(myhero.position, spells.e.range, config.draw.ecolor.color)
    end

    if config.draw.r.bool and spells.r:is_ready() then
        draw_manager:add_circle(myhero.position, spells.r.range, config.draw.rcolor.color)
    end
end

function on_draw()
    local status = string.format("Dive Turret: %s", tostring(config.misc.diveturret.bool))
    local text_w = draw_manager:calc_text_size(22, status).x + 1
    local position = myhero.position:worldtoscreen() + vector(-text_w / 2, 20)

    draw_manager:add_text_on_screen(position, MAKE_COLOR(255, 255, 255, 255), 22,
        status)

    if config.draw.r.bool and spells.r:is_ready() then
        draw_manager:draw_circle_on_minimap(myhero.position, spells.r.range, 0xFFFFFFFF)
    end

    if config.draw.ewall.bool then
        local target = target_selector:get_target(spells.e.charged_max_range, damage_type.magical)
        if target ~= nil then
            if spells.e:is_ready() then
                for i = 40, config.e.wallsearch.int, 60 do
                    local posWall = target.position:extend(myhero.position, -i)
                    draw_manager:add_circle(posWall, 30.0, MAKE_COLOR(255, 255, 255, 255))

                    if posWall:is_wall() then
                        draw_manager:add_circle(posWall, 50.0, MAKE_COLOR(0, 255, 0, 255))
                        break
                    end
                end
            end
        end
    end
end

function set_menu_icon(spell, entry)
    if spell.handle then
        entry:set_assigned_texture(spell.handle.icon_texture)
    end
end

function setup_menu()
    mainmenu = menu:create_tab("RTX.Briar", "Briar")
    mainmenu:set_assigned_texture(myhero.square_icon_portrait)

    --- Q Settings
    local q_settings = mainmenu:add_tab("Briar.Q", "Head Rush (Q)")
    q_settings:add_separator("Briar.Q.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.q, q_settings)
    config.q.combo = q_settings:add_checkbox("Briar.Q.Combo", "Use Q If Enemy Escaping", true)
    config.q.afteraa = q_settings:add_checkbox("Briar.Q.AfterAA", "Use Q After Attack", true)
    q_settings:add_separator("Briar.Q.Separator.Harass", "Harass Mode")
    config.q.harass = q_settings:add_checkbox("Briar.Q.Harass", "Use in Harass", true)
    q_settings:add_separator("Briar.Q.Separator.JungleClear", "JungleClear Mode")
    config.q.jungleclear = q_settings:add_checkbox("Briar.Q.JungleClear", "Use in JungleClear", true)

    --- W Settings
    local w_settings = mainmenu:add_tab("Briar.W", "Blood Frenzy (W)")
    w_settings:add_separator("Briar.W.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.w, w_settings)
    config.w.combo = w_settings:add_checkbox("Briar.W.Combo", "Use in Combo", true)
    config.w.forcew = w_settings:add_checkbox("Briar.W.ComboForce", "Force Use W After Ultimate", true)
    w_settings:add_separator("Briar.W.Separator.JungleClear", "JungleClear Mode")
    config.w.jungleclear = w_settings:add_checkbox("Briar.W.JungleClear", "Use in JungleClear", true)


    --- E Settings
    local e_settings = mainmenu:add_tab("Briar.E", "Chilling Scream (E)")
    e_settings:add_separator("Briar.E.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.e, e_settings)
    config.e.combo = e_settings:add_checkbox("Briar.E.Combo", "Use in Combo", true)
    config.e.wallsearch = e_settings:add_slider("Briar.E.wallsearch", "Push Distance", 480, 300, 550)
    e_settings:add_separator("Briar.E.Separator.JungleClear", "JungleClear Mode")
    config.e.jungleclear = e_settings:add_checkbox("Briar.E.JungleClear", "Use in JungleClear", true)

    --- R Settings
    local r_settings = mainmenu:add_tab("Briar.R", "Certain Death (R)")
    -- r_settings:add_separator("Briar.R.Separator.Combo", "Combo Mode")
    set_menu_icon(spells.r, r_settings)
    --config.r.combo = r_settings:add_checkbox("Briar.R.Combo", "Use in Combo", true)
    r_settings:add_separator("Briar.R.Separator.KeyBind", "KeyBinds")
    config.r.semi_r = r_settings:add_hotkey("Briar.R.SemiCast", "Semi Manual R Cast", tree_hotkey_mode.Hold,
        char_key("G"), false)

    local misc_settings = mainmenu:add_tab("Briar.Misc", "Misc")
    config.misc.diveturret = misc_settings:add_hotkey("Briar.Misc.DiveTurret", "DiveTurret", tree_hotkey_mode.Toggle,
        char_key("U"), false)

    local draw_settings = mainmenu:add_tab("Briar.Draw", "Drawings")
    draw_settings:add_separator("Briar.Draw.Separator.Q", "Head Rush (Q)")
    config.draw.q = draw_settings:add_checkbox("Briar.Draw.Q", "Enabled", true)
    config.draw.qcolor = draw_settings:add_colorpick("Briar.Draw.QColor", "Color", { 0.953, 0.773, 0.498, 1.0 })
    draw_settings:add_separator("Briar.Draw.Separator.W", "Blood Frenzy (W)")
    config.draw.w = draw_settings:add_checkbox("Briar.Draw.W", "Enabled", true)
    config.draw.wcolor = draw_settings:add_colorpick("Briar.Draw.WColor", "Color", { 0.443, 0.678, 0.675, 1.0 })
    draw_settings:add_separator("Briar.Draw.Separator.E", "Chilling Scream (E)")
    config.draw.e = draw_settings:add_checkbox("Briar.Draw.E", "Enabled", true)
    config.draw.ecolor = draw_settings:add_colorpick("Briar.Draw.EColor", "Color", { 0.604, 0.349, 0.722, 1.0 })
    draw_settings:add_separator("Briar.Draw.Separator.R", "Certain Death (R)")
    config.draw.r = draw_settings:add_checkbox("Briar.Draw.R", "Enabled", true)
    config.draw.rcolor = draw_settings:add_colorpick("Briar.Draw.RColor", "Color", { 0.988, 0.122, 0.078, 1.0 })
    draw_settings:add_separator("Briar.Draw.Separator.EWall", "Wall Indicator (E)")
    config.draw.ewall = draw_settings:add_checkbox("Briar.Draw.EWall", "Enabled", true)
end

function on_sdk_load(sdk)
    if myhero.champion ~= champion_id.Briar then
        myhero:print_chat(0, "Champion is not supported")
        return false
    end


    spells.q = plugin_sdk:register_spell(spellslot.q, 440.0)
    spells.w = plugin_sdk:register_spell(spellslot.w, 300.0)
    spells.e = plugin_sdk:register_spell(spellslot.e, 400.0)
    spells.e2 = plugin_sdk:register_spell(spellslot.e, 600.0)
    spells.r = plugin_sdk:register_spell(spellslot.r, 10000.0)


    spells.e2:set_skillshot(1.0, 120.0, 1900.0, { collisionable_objects.yasuo_wall }, skillshot_type.skillshot_line)
    spells.e:set_skillshot(0.2, 190.0, 1900.0, { collisionable_objects.yasuo_wall }, skillshot_type.skillshot_line)
    spells.e:set_charged(400.0, 600.0, 1.2)
    spells.e:set_charge_buff_name(buff_hash("BriarE"))

    spells.r:set_skillshot(1.0, 160.0, 2000.0, { collisionable_objects.yasuo_wall }, skillshot_type.skillshot_line)


    setup_menu()



    cb.add(events.on_update, on_update)
    cb.add(events.on_env_draw, on_env_draw)
    cb.add(events.on_draw, on_draw)
    cb.add(events.on_process_spell_cast, on_process_spell_cast)
    cb.add(events.on_after_attack_orbwalker, on_after_attack_orbwalker)
    return true
end

function on_sdk_unload(sdk)
    if mainmenu ~= nil then
        --- always remove callbacks
        cb.remove(events.on_update, on_update)
        cb.remove(events.on_env_draw, on_env_draw)
        cb.remove(events.on_draw, on_draw)
        cb.remove(events.on_process_spell_cast, on_process_spell_cast)
        cb.remove(events.on_after_attack_orbwalker, on_after_attack_orbwalker)

        --- dont forget to cleanup spells
        plugin_sdk:remove_spell(spells.q)
        plugin_sdk:remove_spell(spells.w)
        plugin_sdk:remove_spell(spells.e)
        plugin_sdk:remove_spell(spells.e2)
        plugin_sdk:remove_spell(spells.r)

        menu:delete_tab(mainmenu)
    end
end
