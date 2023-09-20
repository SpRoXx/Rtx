---@diagnostic disable: missing-return
---@class game_object_script
---@field public perks perk[]
---@field public model string
---@field public base_skin_name string
---@field public name string
---@field public base number
---@field public team number|game_object_team
---@field public type object_type_script
---@field public auto_attack spell_data_script
---@field public action_state number
---@field public id number
---@field public handle number
---@field public object_owner number
---@field public owner game_object_script
---@field public type_flags number
---@field public bufflist buff_instance_script[]
---@field public path_controller path_controller_script
---@field public is_nexus boolean
---@field public is_inhibitor boolean
---@field public is_winding_up boolean
---@field public real_path vector[]
---@field public is_recalling boolean
---@field public is_me boolean
---@field public is_visible boolean
---@field public is_under_enemy_turret boolean
---@field public can_attack boolean
---@field public can_move boolean
---@field public can_cast boolean
---@field public is_monster boolean
---@field public is_minion boolean
---@field public is_stealthed boolean
---@field public is_immovable boolean
---@field public is_ghosted boolean
---@field public is_jungle_buff boolean
---@field public is_epic_monster boolean
---@field public is_lane_minion boolean
---@field public is_dead boolean
---@field public is_melee boolean
---@field public is_ranged boolean
---@field public is_ally boolean
---@field public is_enemy boolean
---@field public is_plant boolean
---@field public minion_type number
---@field public is_ai_hero boolean
---@field public is_ai_base boolean
---@field public is_ai_minion boolean
---@field public is_ai_turret boolean
---@field public obj_is_attackable boolean
---@field public is_targetable boolean
---@field public missile_get_sender_id number
---@field public missile_get_target_id number
---@field public missile_is_targeted boolean
---@field public missile_get_start_position vector
---@field public missile_get_end_position vector
---@field public champion number|champion_id
---@field public attack_range number
---@field public percent_physical_damage_mod number
---@field public flat_physical_damage_mod number
---@field public flat_magic_damage_mod number
---@field public base_attack_damage number
---@field public base_ability_power number
---@field public total_attack_damage number
---@field public move_speed number
---@field public armor number
---@field public percent_magic_damage_mod number
---@field public percent_bonus_armor_penetration number
---@field public spell_block number
---@field public bonus_armor number
---@field public crit number
---@field public magic_lathality number
---@field public percent_magic_penetration number
---@field public flat_magic_reduction number
---@field public percent_magic_reduction number
---@field public flat_armor_penetration number
---@field public physical_lathality number
---@field public flat_magic_penetration number
---@field public percent_armor_penetration number
---@field public attack_delay number
---@field public additional_attack_damage number
---@field public flat_damage_reduction_from_barracks_minion_mod number
---@field public percent_damage_to_barracks_minion_mod number
---@field public total_ability_power number
---@field public attack_cast_delay number
---@field public bounding_radius number
---@field public health number
---@field public mana number
---@field public mana_percent number
---@field public max_mana number
---@field public max_health number
---@field public health_percent number
---@field public gold number
---@field public level number
---@field public position vector
---@field public character_data character_data_script
---@field public network_id number
---@field public direction_perpendicular vector
---@field public direction vector
---@field public pathing_direction vector
---@field public is_physical_immune boolean
---@field public is_magic_immune boolean
---@field public is_lifesteal_immune boolean
---@field public is_invulnerable boolean
---@field public is_casting_interruptible_spell number
---@field public missile_sdata spell_data_script
---@field public is_teleporting boolean
---@field public teleport_state string
---@field public square_icon_portrait number
---@field public hpbar_pos vector
---@field public hp_bar_stacks number
---@field public lvlup_stacks number
---@field public is_visible_on_screen boolean
---@field public hp_regen_rate number
---@field public passive_icon_texture number
---@field public passive_cooldown_end_time number
---@field public passive_cooldown_total_time number
---@field public is_ward boolean
---@field public is_zombie boolean
---@field public is_missile boolean
---@field public is_general_particle_emitter boolean
---@field public physical_shield number
---@field public magical_shield number
---@field public all_shield number
---@field public msar_max number
---@field public bonus_spell_block number
---@field public exp number
---@field public exp_percent number
---@field public is_under_ally_turret boolean
---@field public bbox_min vector
---@field public bbox_max vector
---@field public name_cstr string
---@field public model_cstr string
---@field public is_hpbar_recently_rendered boolean
---@field public percent_cooldown_mod number
---@field public particle_rotation_right vector
---@field public particle_rotation_up vector
---@field public particle_rotation_forward vector
---@field public ability_haste_mod number
---@field public mDodge number
---@field public mPARRegenRate number
---@field public mAttackSpeedMod number
---@field public mFlatCastRangeMod number
---@field public mPercentLifeStealMod number
---@field public mPercentSpellVampMod number
---@field public mPercentPhysicalVamp number
---@field public mPercentCritBonusArmorPenetration number
---@field public mPercentCritTotalArmorPenetration number
---@field public mPercentBonusMagicPenetration number
---@field public mBaseHPRegenRate number
---@field public mPrimaryARBaseRegenRateRep number
---@field public mSecondaryARRegenRateRep number
---@field public mSecondaryARBaseRegenRateRep number
---@field public mPercentCooldownCapMod number
---@field public mPercentCCReduction number
---@field public mPercentEXPBonus number
---@field public mFlatBaseAttackDamageMod number
---@field public mPercentBaseAttackDamageMod number
---@field public mBaseAttackDamageSansPercentScale number
---@field public mFlatBaseHPPoolMod number
---@field public mPercentBonusPhysicalDamageMod number
---@field public mPercentBasePhysicalDamageAsFlatBonusMod number
---@field public mPercentAttackSpeedMod number
---@field public mPercentMultiplicativeAttackSpeedMod number
---@field public mCritDamageMultiplier number
---@field public mPercentOmnivampMod number
---@field public mFlatBubbleRadiusMod number
---@field public mPercentBubbleRadiusMod number
---@field public mMoveSpeedBaseIncrease number
---@field public mScaleSkinCoef number
---@field public emitter game_object_script
---@field public emitter_resources_hash number
---@field public display_champ_mastery_badge boolean
---@field public base_hp number
---@field public base_mana number
---@field public particle_attachment_object game_object_script
---@field public particle_target_attachment_object game_object_script
---@field public arType number
---@field public arBase number
---@field public arPerLevel number
---@field public arBaseStaticRegen number
---@field public arRegenPerLevel number
---@field public hpPerLevel number
---@field public baseStaticHPRegen number
---@field public hpRegenPerLevel number
---@field public baseDamage number
---@field public damagePerLevel number
---@field public baseArmor number
---@field public armorPerLevel number
---@field public baseSpellBlock number
---@field public spellBlockPerLevel number
---@field public baseMoveSpeed number
---@field public attackRange number
---@field public attackSpeed number
---@field public attackSpeedRatio number
---@field public attackSpeedPerLevel number
---@field public acquisitionRange number
---@field public selectionHeight number
---@field public selectionRadius number
---@field public evolve_points number
---@field public velocity vector
---@field public pathfindingCollisionRadius number
---@field public respawn_time number
---@field public respawn_time_remaining number
---@field public summoner_rank string
---@field public summoner_rank_division string
---@field public bones_length number
---@field public bones_info any
---@field public no_render boolean
---@field public action_state2 number
---@field public is_obscured boolean
---@field public is_unstoppable boolean
---@field public is_cc_immune boolean
---@field public immovibility_time number
---@field public is_moving boolean
---@field public is_dashing boolean
local game_object_script = {}

function game_object_script:update() end

---@param id number
---@param model string
function game_object_script:set_skin(id, model) end

---@param spell spellslot
---@return spell_data_inst_script
function game_object_script:get_spell(spell) end

---@param itemslot spellslot
---@return item_script
function game_object_script:get_item(itemslot) end

---@param slot spellslot
---@return number
function game_object_script:get_mana_for_spell(slot) end

---@param to game_object_script
---@param respect_passives? boolean true
---@return number
function game_object_script:get_auto_attack_damage(to, respect_passives) end

---@param to game_object_script
---@param additional? number 0.0
---@return boolean
function game_object_script:is_in_auto_attack_range(to, additional) end

---@param range? number -- FLT_MAX
---@param from? vector - vector(0,0)
---@param ignore_invulnerability? boolean - false
---@return boolean
function game_object_script:is_valid_target(range, from, ignore_invulnerability) end

---@param id number|PerkId
---@return boolean
function game_object_script:has_perk(id) end

---@param hash number
---@return buff_instance_script
function game_object_script:get_buff(hash) end

---@param type buff_type|buff_type[]
---@return buff_instance_script
function game_object_script:get_buff_by_type(type) end

---@param hash number|number[]
---@return boolean
function game_object_script:has_buff(hash) end

---@param hash number
---@return number
function game_object_script:get_buff_count(hash) end

---@param ignore_invulnerability? boolean
---@return boolean
function game_object_script:is_attack_allowed_on_target(ignore_invulnerability) end

---@param spell spellslot
---@return spell_state
function game_object_script:get_spell_state(spell) end

---@param team game_object_team|number
---@return boolean
function game_object_script:is_targetable_to_team(team) end

---@param obj game_object_script
---@return boolean
function game_object_script:can_be_attacked_by(obj) end

---@param to game_object_script|vector
---@return number
function game_object_script:get_distance(to) end

---@return spell_instance_script
function game_object_script:get_active_spell() end

---@param range number
---@return number
function game_object_script:count_allies_in_range(range) end

---@param range number
---@return number
function game_object_script:count_enemies_in_range(range) end

---@param to game_object_script|vector
---@return boolean
function game_object_script:is_facing(to) end

---@param physical_shield boolean
---@param magical_shield boolean
---@return number
function game_object_script:get_real_health(physical_shield, magical_shield) end

---@param hash number
---@return number
function game_object_script:get_buff_time_left(hash) end

---@param pos vector
function game_object_script:set_position(pos) end

---@param endpos vector
---@return vector[]
function game_object_script:get_path(endpos) end

---@param name string
function game_object_script:set_name(name) end

---@param anim_hash number
---@return boolean
function game_object_script:is_playing_animation(anim_hash) end

---@param anim_hash number
---@param time number
---@return boolean
function game_object_script:has_time_remaining_for_animation(anim_hash, time) end

---@param value boolean
function game_object_script:set_no_render(value) end

---@return number
function game_object_script:get_skin() end

---@param index number
function game_object_script:set_gear(index) end

---@param force? boolean
---@return boolean
function game_object_script:is_valid(force) end

---@param type buff_type|buff_type[]
---@return boolean
function game_object_script:has_buff_type(type) end

---@param itemid number
---@return boolean
function game_object_script:is_item_ready(itemid) end

---@param itemid number|number[]
---@return boolean
function game_object_script:has_item(itemid) end
