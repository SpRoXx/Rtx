local linq = require("lazylualinq")

local mainmenu = nil

local spells = {
    q = nil,
    w = nil,
    e = nil,
    r = nil
}

local config = {
    q = {
        combo = nil,
        harass = nil,
        laneclear = nil,
        laneclear_minions = nil,
        jungleclear = nil
    },
    w = {
        combo = nil,
        jungleclear = nil
    },
    e = {
        combo = nil,
        jungleclear = nil
    },
    r = {
        combo = nil,
        semi_r = nil
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

function combo_mode()
    -- Get target using target_selector_manager
    local target = target_selector:get_target_spell(spells.q, damage_type.physical)
    if target and target:is_valid_target() then
        -- If Q is ready and in range, cast it on the target
        if spells.q:is_ready() and target:get_distance(myhero) < spells.q.range then
            spells.q:cast(target)
        end

        -- If E is ready and in range, cast it on the target
        if spells.e:is_ready() and target:get_distance(myhero) < spells.e.range then
            spells.e:cast(target)
        end

        if spells.r:is_ready() and target:get_distance(myhero) < spells.r.range then
            local r_damage = spells.r:get_damage(target) -- get_damage() returns the potential damage of the spell

            -- If the target's health is less than potential R damage, cast R
            if target.health < r_damage then
                spells.r:cast(target)
            end
        end

        -- Advanced logic for W: If the target is about to deal significant damage to Garen, cast W
        if spells.w:is_ready() and target:get_distance(myhero) < spells.w.range then
            local significant_damage = false

            -- Check if the target's attack damage is high
            if target.total_attack_damage > config.w.significant_damage:get_value() then
                significant_damage = true
            end

            -- If the target is about to deal significant damage, cast W
            if significant_damage then
                spells.w:cast()
            end
        end
    end
end

function harass_mode()
    -- Implement Garen's harass logic here
end

function laneclear_mode()
    -- Get all minions in Q range
    local minions = linq.from(entitylist.minions.enemy)
        :where(function(minion) return minion:is_valid_target(spells.q.range) end)
        :toList()

    -- Use Q to last-hit minions
    if config.q.laneclear and spells.q:is_ready() then
        for _, minion in ipairs(minions) do
            -- Prioritize cannon minions
            if minion.is_cannon and spells.q:get_damage(minion) >= minion.health then
                spells.q:cast(minion)
                return
            end
        end

        -- If no cannon minions to last-hit, last-hit other minions
        for _, minion in ipairs(minions) do
            if spells.q:get_damage(minion) >= minion.health then
                spells.q:cast(minion)
                return
            end
        end
    end

    -- Use W if taking significant damage from a large wave of minions
    if config.w.laneclear.bool and spells.w:is_ready() then
        local minions_attacking_me = linq.from(minions)
            :where(function(minion) return minion.target and minion.target.is_me end)
            :toList()

        if #minions_attacking_me >= 3 then
            spells.w:cast()
            return
        end
    end

    -- Use E to clear wave if there are 3 or more minions nearby
    if config.e.laneclear.bool and spells.e:is_ready() then
        local minions_in_e_range = linq.from(minions)
            :where(function(minion) return minion:get_distance(myhero) < spells.e.range end)
            :toList()

        if #minions_in_e_range >= 3 then
            spells.e:cast(myhero.position)
            return
        end
    end
end


function jungleclear_mode()
    -- Implement Garen's jungle clear logic here
end

function on_update()
    if orbwalker:can_move(0.07) then
        if orbwalker.combo_mode then
            combo_mode()
        elseif orbwalker.harass then
            harass_mode()
        elseif orbwalker.laneclear_mode then
            laneclear_mode()
            jungleclear_mode()
        end
    end
end

function on_env_draw()
    -- Implement Garen's environment draw logic here
end

function on_draw()
    -- Implement Garen's draw logic here
end

function setup_menu()
    mainmenu = menu:create_tab("RTX.Garen", "Garen")
    mainmenu:set_assigned_texture(myhero.square_icon_portrait)

    -- Q Settings
    local q_settings = mainmenu:add_tab("Garen.Q", "Decisive Strike (Q)")
    config.q.combo = q_settings:add_checkbox("Garen.Q.Combo", "Use in Combo", true)
    config.q.laneclear = q_settings:add_checkbox("Garen.Q.LaneClear", "Use in Lane Clear", true)
    config.q.laneclear_minions = q_settings:add_slider("Garen.Q.LaneClearMinions", "Minimum Minions", 3, 1, 5)
    config.q.last_hit = q_settings:add_checkbox("Garen.Q.LastHit", "Last Hit Minions", true)
    config.q.use_after_aa = q_settings:add_checkbox("Garen.Q.UseAfterAA", "Use After AA", true)

    -- W Settings
    local w_settings = mainmenu:add_tab("Garen.W", "Courage (W)")
    config.w.combo = w_settings:add_checkbox("Garen.W.Combo", "Use in Combo", true)
    config.w.significant_damage = w_settings:add_slider("Garen.W.SignificantDamage", "Significant Damage Threshold", 200, 0, 500, 1)

    -- E Settings
    local e_settings = mainmenu:add_tab("Garen.E", "Judgment (E)")
    config.e.combo = e_settings:add_checkbox("Garen.E.Combo", "Use in Combo", true)

    -- R Settings
    local r_settings = mainmenu:add_tab("Garen.R", "Demacian Justice (R)")
    config.r.combo = r_settings:add_checkbox("Garen.R.Combo", "Use in Combo", true)

    -- Draw Settings
    local draw_settings = mainmenu:add_tab("Garen.Draw", "Drawings")
    config.draw.q = draw_settings:add_checkbox("Garen.Draw.Q", "Draw Q Range", true)
    config.draw.w = draw_settings:add_checkbox("Garen.Draw.W", "Draw W Range", true)
    config.draw.e = draw_settings:add_checkbox("Garen.Draw.E", "Draw E Range", true)
    config.draw.r = draw_settings:add_checkbox("Garen.Draw.R", "Draw R Range", true)
end

function on_sdk_load(sdk)
    if myhero.champion ~= champion_id.Garen then
        myhero:print_chat(0, "Champion is not supported")
        return false
    end

    -- Register Garen's spells
    spells.q = plugin_sdk:register_spell(spellslot.q, 300) -- Decisive Strike (Q)
    spells.w = plugin_sdk:register_spell(spellslot.w, 20) -- Courage (W)
    spells.e = plugin_sdk:register_spell(spellslot.e, 325) -- Judgment (E)
    spells.r = plugin_sdk:register_spell(spellslot.r, 400) -- Demacian Justice (R)

    setup_menu()

    cb.add(events.on_update, on_update)
    cb.add(events.on_env_draw, on_env_draw)
    cb.add(events.on_draw, on_draw)
    return true
end

function on_sdk_unload(sdk)
    if mainmenu ~= nil then
        cb.remove(events.on_update, on_update)
        cb.remove(events.on_env_draw, on_env_draw)
        cb.remove(events.on_draw, on_draw)

        -- Unregister Garen's spells
        plugin_sdk:remove_spell(spells.q) -- Decisive Strike (Q)
        plugin_sdk:remove_spell(spells.w) -- Courage (W)
        plugin_sdk:remove_spell(spells.e) -- Judgment (E)
        plugin_sdk:remove_spell(spells.r) -- Demacian Justice (R)

        menu:delete_tab(mainmenu)
    end
end