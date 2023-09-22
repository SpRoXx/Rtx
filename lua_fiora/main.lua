---@diagnostic disable: return-type-mismatch

-- Name: BadBitch fiora (sex in the ass aio)
-- Champion: fiora
-- Version: 1.0


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
        killsteal = nil,
        maxrange = nil
    },
    w = {
        combo = nil,
        enemycc = nil,
        minrange = nil
    },
    e = {
        combo = nil,
        jungleclear = nil,
        gapcloser = nil
    },
    r = {
        combo = nil,
        maxrange = nil
    },
    draw = {
        q = nil,
        qcolor = nil,
        w = nil,
        wcolor = nil,
        e = nil,
        ecolor = nil,
        r = nil,
        rcolor = nil
    }
}

function use_e_basic_attack_reset(target)
    if config.e.combo.bool and spells.e:is_ready() and not myhero.is_dashing then
        local e_target = target_selector:get_target_spell(spells.e, damage_type.physical)
        if e_target and e_target:is_valid_target() then
            -- Add a debug message to check if this block is reached
            print("Using E as a Basic Attack Reset")
            spells.e:cast(e_target)
        end
    end
end

function combo_mode()
    local target = target_selector:get_target_spell(spells.w, damage_type.physical)

    if target and target:is_valid_target() then
        -- Add a debug message to check if this block is reached
        print("Combo Mode - Valid Target")

        -- Check Fiora's passive Vitals
        local passive_vitals = linq.from(entitylist.vitals)
            :where(function(vital) return vital:is_valid_target() end)
            :where(function(vital) return vital.owner.is_enemy end)
            :orderBy(function(vital) return vital:distance(myhero) end)
            :firstOr()

        -- Check Fiora's passive before using Q
        if config.q.combo.bool and spells.q:is_ready() and not myhero.is_dashing then
            local has_passive = myhero:has_buff("FioraQ")
            if not has_passive and passive_vitals then
                -- Add a debug message to check if this block is reached
                print("Casting Q on Passive Vital in Combo Mode")
                spells.q:cast(passive_vitals, hit_chance.high)
            end
        end

        if config.r.combo.bool and myhero:count_enemies_in_range(spells.e.range + 100.0) >= 1 and spells.r:is_ready() and spells.w:is_ready() then
            if get_pack_healthpercent() < config.r.packhealth.int then
                -- Add a debug message to check if this block is reached
                print("Casting R in Combo Mode")
                spells.r:cast()
                return
            end
        end

        -- if enemy distance > min w range
        if config.w.combo.bool and spells.w:is_ready() and target:get_distance(myhero) > config.w.minrange.int and target:get_distance(myhero) < spells.w.range then
            -- Ally turret but the opponent's side
            -- Weirdos
            if config.w.diveturret.bool or not target.is_under_ally_turret then
                if config.w.semi_w.bool then  -- Check if semi_w is enabled
                    -- Add a debug message to check if this block is reached
                    print("Casting Semi-W in Combo Mode")
                    -- Add logic for semi-w here
                else
                    -- Add a debug message to check if this block is reached
                    print("Casting W in Combo Mode")
                    spells.w:cast(target)
                end
            end
        end

        -- Use Fiora's E ability in Combo Mode
        if config.e.combo and spells.e:is_ready() then
            -- Add a debug message to check if this block is reached
            print("Casting E in Combo Mode")
            spells.e:cast(target)
        end
    else
        -- Add a debug message to check if this block is reached
        print("Combo Mode - No Valid Target")
    end
end

function harass_mode()
    local target = target_selector:get_target()

    if target and target:is_valid_target() then
        if config.q.harass and spells.q:is_ready() and target:get_distance(myhero) <= spells.q.range then
            spells.q:cast(target)
        end
    end
end

function lane_clear_mode()
    if config.q.laneclear and spells.q:is_ready() then
        spells.q:cast_on_best_farm_position(config.q.laneclear_minions, false)
    end
end

function jungle_clear_mode()
    if config.q.jungleclear and spells.q:is_ready() then
        local jungle_minion = linq.from(entitylist.minions.neutral)
            :where(function(minion) return minion:is_valid_target(spells.q.range) end)
            :orderByDescending(function(minion) return minion.max_health end)
            :firstOr()

        if jungle_minion then
            spells.q:cast(jungle_minion)
        end
    end
end

function on_update()
    if orbwalker:can_move(0.07) then
        if orbwalker.combo_mode then
            combo_mode()  -- Call combo_mode when in combo mode
        elseif orbwalker.harass then
            harass_mode()
        elseif orbwalker.lane_clear_mode then
            lane_clear_mode()
            jungle_clear_mode()
        end
    end

    -- Add Q setting for Combo Mode
    if orbwalker.combo_mode and config.q.combo.bool then
        local target = target_selector:get_target_spell(spells.q, damage_type.physical)
        if target and target:is_valid_target() and spells.q:is_ready() and not myhero.is_dashing then
            spells.q:cast(target, hit_chance.high)
        end
    end

    if orbwalker.combo_mode and config.e.combo.bool then
        local target = target_selector:get_target_spell(spells.e, damage_type.physical)
        if target and target:is_valid_target() and spells.e:is_ready() and not myhero.is_dashing then
            spells.e:cast(target, hit_chance.high)
        end
    end

    local target = target_selector:get_target_spell(spells.w, damage_type.physical)
    if config.w.semi_w.bool and spells.w:is_ready() and target:get_distance(myhero) < spells.w.range then
        spells.w:cast(target)
    end

    if config.r.semi_r.bool and spells.r:is_ready() then
        spells.r:cast()
    end

    -- Use Fiora's E as a basic attack reset in the on_update function
    use_e_basic_attack_reset(target)
end


function on_anti_gapcloser(sender, args)
    if config.e.gapcloser and sender and sender.is_enemy and args.end_position:distance(myhero) < spells.e.range then
        local castPos = myhero.position:extend(sender.position, 0.0 - spells.e.range)
        spells.e:cast(castPos)
    end
end

function on_env_draw()
    if config.draw.q then
        draw_manager:add_circle(myhero.position, spells.q.range, config.draw.qcolor.color)
    end

    if config.draw.w then
        draw_manager:add_circle(myhero.position, spells.w.range, config.draw.wcolor.color)
    end

    if config.draw.e then
        draw_manager:add_circle(myhero.position, spells.e.range, config.draw.ecolor.color)
    end

    if config.draw.r then
        draw_manager:add_circle(myhero.position, spells.r.range, config.draw.rcolor.color)
    end
end

function on_draw()
    -- Add any additional draw functions here
end

function setup_menu()
    mainmenu = menu:create_tab("FioraScript", "Fiora Script")

    --- Q Settings
    local q_settings = mainmenu:add_tab("Fiora.Q", "Blade Work (Q)")
    config.q.combo = q_settings:add_checkbox("Fiora.Q.Combo", "Use in Combo", true)
    config.q.harass = q_settings:add_checkbox("Fiora.Q.Harass", "Use in Harass", true)
    config.q.laneclear = q_settings:add_checkbox("Fiora.Q.LaneClear", "Use in Lane Clear", true)
    config.q.laneclear_minions = q_settings:add_slider("Fiora.Q.LaneClear.Minions", "Min Minions to Use", 3, 1, 5)
    config.q.jungleclear = q_settings:add_checkbox("Fiora.Q.JungleClear", "Use in Jungle Clear", true)

    --- W Settings
    local w_settings = mainmenu:add_tab("Fiora.W", "Riposte (W)")
    config.w.combo = w_settings:add_checkbox("Fiora.W.Combo", "Use in Combo", true)
    config.w.enemycc = w_settings:add_checkbox("Fiora.W.EnemyCC", "Use on Enemy CC", true)
    config.w.minrange = w_settings:add_slider("Fiora.W.MinRange", "Min Range to Use", 250, 0, 750)

    --- E Settings
    local e_settings = mainmenu:add_tab("Fiora.E", "Burst of Speed (E)")
    config.e.combo = e_settings:add_checkbox("Fiora.E.Combo", "Use in Combo", true)
    config.e.gapcloser = e_settings:add_checkbox("Fiora.E.Gapcloser", "Use on Gapcloser", true)

    --- R Settings
    local r_settings = mainmenu:add_tab("Fiora.R", "Grand Challenge (R)")
    config.r.combo = r_settings:add_checkbox("Fiora.R.Combo", "Use in Combo", true)
    config.r.maxrange = r_settings:add_slider("Fiora.R.MaxRange", "Max Range to Use", 500, 0, 1000)

    --- Draw Settings
    local draw_settings = mainmenu:add_tab("Fiora.Draw", "Drawings")
    config.draw.q = draw_settings:add_checkbox("Fiora.Draw.Q", "Draw Q Range", true)
    config.draw.qcolor = draw_settings:add_colorpick("Fiora.Draw.QColor", "Q Range Color", { 1, 0, 0, 1 })
    config.draw.w = draw_settings:add_checkbox("Fiora.Draw.W", "Draw W Range", true)
    config.draw.wcolor = draw_settings:add_colorpick("Fiora.Draw.WColor", "W Range Color", { 0, 1, 0, 1 })
    config.draw.e = draw_settings:add_checkbox("Fiora.Draw.E", "Draw E Range", true)
    config.draw.ecolor = draw_settings:add_colorpick("Fiora.Draw.EColor", "E Range Color", { 0, 0, 1, 1 })
    config.draw.r = draw_settings:add_checkbox("Fiora.Draw.R", "Draw R Range", true)
    config.draw.rcolor = draw_settings:add_colorpick("Fiora.Draw.RColor", "R Range Color", { 1, 1, 0, 1 })
end


function on_sdk_load(sdk)
    -- Register Fiora's spells
    spells.q = plugin_sdk:register_spell(spellslot.q, 400.0) -- Adjust range
    spells.w = plugin_sdk:register_spell(spellslot.w, 500.0) -- Adjust range
    spells.e = plugin_sdk:register_spell(spellslot.e, 300.0) -- Adjust range
    spells.r = plugin_sdk:register_spell(spellslot.r, 500.0) -- Adjust range

    -- Set up the menu
    setup_menu()

    -- Register callbacks
    cb.add(events.on_update, on_update)
    cb.add(events.on_env_draw, on_env_draw)

    return true
end

function on_sdk_unload(sdk)
    -- Remove callbacks and clean up spells
    cb.remove(events.on_update, on_update)
    cb.remove(events.on_env_draw, on_env_draw)
    plugin_sdk:remove_spell(spells.q)
    plugin_sdk:remove_spell(spells.w)
    plugin_sdk:remove_spell(spells.e)
    plugin_sdk:remove_spell(spells.r)
    menu:delete_tab(mainmenu)
end

