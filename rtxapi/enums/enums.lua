---@enum events
local events = {
	on_update = 0,
	on_draw = 1,
	on_process_spell_cast = 2,
	on_do_cast = 3,
	on_stop_cast = 4,
	on_create_object = 5,
	on_delete_object = 6,
	on_object_dead = 7,
	on_object_respawn = 8,
	on_buff_gain = 9,
	on_buff_lose = 10,
	on_new_path = 11,
	on_after_attack_orbwalker = 13,
	on_before_attack_orbwalker = 14,
	on_issue_order = 15,
	on_cast_spell = 16,
	on_teleport = 17,
	on_wndproc = 18,
	on_endscene = 19,
	on_prereset = 20,
	on_postreset = 21,
	on_start = 22,
	on_end = 23,
	on_visibility_enter = 24,
	on_lvlup = 25,
	on_preupdate = 26,
	on_play_animation = 27,
	on_network_packet = 28,
	on_reconnect = 29,
	on_global_event = 30,
	on_render_mouse_overs = 31,
	on_unkillable_minion = 32,
	on_env_draw = 33,
	on_create_client_effect = 34,
	on_evolve = 35,
	on_play_sound = 36,
	on_vote = 37,
	on_send_chat = 38,
	on_anti_gapcloser = 39,
	events_size = 40
}


---@enum game_state_stage
local game_state_stage = {
	loading_screen = 0,
	connecting = 1,
	running = 2,
	oaused = 3,
	finished = 4,
	exiting = 5
}

---@enum teleport_type
local teleport_type = {
	Recall = 0,
	SuperRecall = 1,
	Teleport = 2,
	TwistedFate = 3,
	Shen = 4
}

---@enum tree_hotkey_mode
local tree_hotkey_mode = {
	Hold = 0,
	Toggle = 1
}

---@enum hud_cursor_type
local hud_cursor_type = {
	move_to = 0,
	move_to_red = 1
}

---@enum spellslot
local spellslot = {
	invalid = -1,
	q = 0,
	w = 1,
	e = 2,
	r = 3,
	summoner1 = 4,
	summoner2 = 5,
	item_1 = 6,
	item_2 = 7,
	item_3 = 8,
	item_4 = 9,
	item_5 = 10,
	item_6 = 11,
	trinket = 12,
	recall = 13
}


---@enum nav_collision_flags
local nav_collision_flags = {
	none = 0,
	grass = 1,
	wall = 2,
	building = 64,
	prop = 128,
	global_vision = 256
}
---@enum game_object_team
local game_object_team = {
	unknown = 0,
	order = 100,
	chaos = 200,
	neutral = 300
}

---@enum _issue_order_type
local _issue_order_type = {
	HoldPosition = 1,
	MoveTo = 2,
	AttackUnit = 3,
	AutoAttackPet = 4,
	AutoAttack = 5,
	MovePet = 6,
	AttackTo = 7,
	Stop = 10
}

---@enum spell_state
local spell_state = {
	Ready = 1 << 1,
	NotLearned = 1 << 2,
	NotAvaliable = 1 << 3,
	Surpressed = 1 << 4,
	Cooldown = 1 << 5,
	NotEnoughMana = 1 << 6,
	UnknownState = 1 << 7
}

---@enum keyboard_game
local keyboard_game = {
	escape = 1,
	num_1 = 2,
	num_2 = 3,
	num_3 = 4,
	num_4 = 5,
	num_5 = 6,
	num_6 = 7,
	num_7 = 8,
	num_8 = 9,
	num_9 = 10,
	num_0 = 11,
	minus = 12,
	equals = 13,
	backspace = 14,
	tab = 15,
	q = 16,
	w = 17,
	e = 18,
	r = 19,
	t = 20,
	y = 21,
	u = 22,
	i = 23,
	o = 24,
	p = 25,
	lbracket = 26,
	rbracket = 27,
	enter = 28,
	lctrl = 29,
	a = 30,
	s = 31,
	d = 32,
	f = 33,
	g = 34,
	h = 35,
	j = 36,
	k = 37,
	l = 38,
	semicolon = 39,
	apostrophe = 40,
	tilde = 41,
	lshift = 42,
	backslash = 43,
	z = 44,
	x = 45,
	c = 46,
	v = 47,
	b = 48,
	n = 49,
	m = 50,
	comma = 51,
	period = 52,
	slash = 53,
	rshift = 54,
	np_multiply = 55,
	lalt = 56,
	space = 57,
	capslock = 58,
	f1 = 59,
	f2 = 60,
	f3 = 61,
	f4 = 62,
	f5 = 63,
	f6 = 64,
	f7 = 65,
	f8 = 66,
	f9 = 67,
	f10 = 68,
	numlock = 69,
	scrolllock = 70,
	np_7 = 71,
	np_8 = 72,
	np_9 = 73,
	np_subtract = 74,
	np_4 = 75,
	np_5 = 76,
	np_6 = 77,
	np_add = 78,
	np_1 = 79,
	np_2 = 80,
	np_3 = 81,
	np_0 = 82,
	np_period = 83,
	oem_102 = 86,
	f11 = 87,
	f12 = 88,
	f13 = 100,
	f14 = 101,
	f15 = 102,
	colon = 146,
	underline = 147,
	np_enter = 156,
	rctrl = 157,
	np_divide = 181,
	print = 183,
	ralt = 184,
	pause = 197,
	home = 199,
	up = 200,
	pgup = 201,
	left = 203,
	right = 205,
	vend = 207,
	down = 208,
	pgdn = 209,
	insert = 210,
	k_delete = 211,
	mouse1 = 386,
	mouse2 = 387,
	mouse3 = 388,
	mouse4 = 389,
	mouse5 = 390,
	mouse6 = 391,
	mouse7 = 392,
	mouse8 = 393,
	mwheel_up = 394,
	mwheel_down = 395,
	maxis_x = 396,
	maxis_y = 397,
	maxis_z = 398,
	Unknown = -1
}


---@enum buff_type
local buff_type = {
	Internal = 0,
	Aura = 1,
	CombatEnchancer = 2,
	CombatDehancer = 3,
	SpellShield = 4,
	Stun = 5,
	Invisibility = 6,
	Silence = 7,
	Taunt = 8,
	Berserk = 9,
	Polymorph = 10,
	Slow = 11,
	Snare = 12,
	Damage = 13,
	Heal = 14,
	Haste = 15,
	SpellImmunity = 16,
	PhysicalImmunity = 17,
	Invulnerability = 18,
	AttackSpeedSlow = 19,
	NearSight = 20,
	Fear = 22,
	Charm = 23,
	Poison = 24,
	Suppression = 25,
	Blind = 26,
	Counter = 27,
	Currency = 21,
	Shred = 28,
	Flee = 29,
	Knockup = 30,
	Knockback = 31,
	Disarm = 32,
	Grounded = 33,
	Drowsy = 34,
	Asleep = 35,
	Obscured = 36,
	ClickproofToEnemies = 37,
	UnKillable = 38
}

---@enum PerkId
local PerkId = {
	Absolute_Focus = 8233,
	Aftershock = 8439,
	Approach_Velocity = 8410,
	Arcane_Comet = 8229,
	Biscuit_Delivery = 8345,
	Bone_Plating = 8473,
	Celerity = 8234,
	Cheap_Shot = 8126,
	Chrysalis = 8472,
	Conditioning = 8429,
	Conqueror = 8010,
	Cosmic_Insight = 8347,
	Coup_de_Grace = 8014,
	Cut_Down = 8017,
	Dark_Harvest = 8128,
	Demolish = 8446,
	Electrocute = 8112,
	Eyeball_Collection = 8138,
	Fleet_Footwork = 8021,
	Font_of_Life = 8463,
	Futures_Market = 8321,
	Gathering_Storm = 8236,
	Ghost_Poro = 8120,
	Glacial_Augment = 8351,
	Grasp_of_the_Undying = 8437,
	Guardian = 8465,
	Hail_of_Blades = 9923,
	Hextech_Flashtraption = 8306,
	Ingenious_Hunter = 8134,
	Kleptomancy = 8359,
	Last_Stand = 8299,
	Legend_Alacrity = 9104,
	Legend_Bloodline = 9103,
	Legend_Tenacity = 9105,
	Lethal_Tempo = 8008,
	Magical_Footwear = 8304,
	Manaflow_Band = 8226,
	Minion_Dematerializer = 8316,
	Nimbus_Cloak = 8275,
	Nullifying_Orb = 8224,
	Overgrowth = 8451,
	Overheal = 9101,
	Perfect_Timing = 8313,
	Phase_Rush = 8230,
	Predator = 8124,
	Presence_of_Mind = 8009,
	Press_the_Attack = 8005,
	Ravenous_Hunter = 8135,
	Relentless_Hunter = 8105,
	Revitalize = 8453,
	Scorch = 8237,
	Second_Wind = 8444,
	Sudden_Impact = 8143,
	Summon_Aery = 8214,
	Taste_of_Blood = 8139,
	Time_Warp_Tonic = 8352,
	Transcendence = 8210,
	Triumph = 9111,
	Ultimate_Hunter = 8106,
	Unflinching = 8242,
	Unsealed_Spellbook = 8360,
	Waterwalking = 8232,
	Zombie_Ward = 8136
}

---@enum skillshot_type
local skillshot_type = {
	skillshot_line = 0,
	skillshot_circle = 1,
	skillshot_cone = 2
}

---@enum collisionable_objects
local collisionable_objects = {
	minions = 0,
	heroes = 1,
	yasuo_wall = 2,
	walls = 3,
	allies = 4,
}

---@enum summoner_emote_slot
local summoner_emote_slot = {
	top = 0,
	right = 1,
	bottom = 2,
	left = 3,
	middle = 4,
	start = 5,
	victory = 6,
	first_blood = 7,
	ace = 8,
	missing = 9,
	none = 0xFFFFFFFF
}

---@enum _player_ping_type
local _player_ping_type = {
	normal = 0,
	on_my_way = 1,
	missing_enemy = 2,
	danger = 3,
	assist_me = 4,
	area_is_warded = 5,
	careful = 6,
	no_vision_here = 7,
	ask_for_vision = 8,
	push_forward = 9,
	all_in = 10,
	retreat = 11,
	bait = 12,
	hold_area = 13
}

---@enum emote_type
local emote_type = {
	EMOTE_DANCE = 0,
	EMOTE_TAUNT = 1,
	EMOTE_LAUGH = 2,
	EMOTE_JOKE = 3,
	EMOTE_TOGGLE = 4
}

---@enum damage_type
local damage_type = {
	physical = 0,
	magical = 1,
	true_dmg = 2
}

---@enum spell_targeting
local spell_targeting = {
	self = 0,
	target = 1,
	area = 2,
	area_aim = 3,
	cone = 4,
	self_aoe = 5,
	target_or_location = 6,
	location = 7,
	direction = 8,
	direction_aim = 9,
	drag_direction = 10,
	line_target_to_caster = 11,
	area_clamped = 12,
	location_clamped = 13,
	terrain_location = 14,
	terrain_type = 15,
	wall_detection = 16
}
---@enum hit_chance
local hit_chance = {
	immobile = 8,
	dashing = 7,
	very_high = 6,
	high = 5,
	medium = 4,
	low = 3,
	impossible = 2,
	out_of_range = 1,
	collision = 0
}

---@enum champion_id
local champion_id = {
	Aatrox = 266,
	Ahri = 103,
	Akali = 84,
	Alistar = 12,
	Amumu = 32,
	Anivia = 34,
	Annie = 1,
	Aphelios = 523,
	Ashe = 22,
	AurelionSol = 136,
	Azir = 268,
	Bard = 432,
	Blitzcrank = 53,
	Brand = 63,
	Braum = 201,
	Caitlyn = 51,
	Camille = 164,
	Cassiopeia = 69,
	Chogath = 31,
	Corki = 42,
	Darius = 122,
	Diana = 131,
	DrMundo = 36,
	Draven = 119,
	Ekko = 245,
	Elise = 60,
	Evelynn = 28,
	Ezreal = 81,
	FiddleSticks = 9,
	Fiora = 114,
	Fizz = 105,
	Galio = 3,
	Gangplank = 41,
	Garen = 86,
	Gnar = 150,
	Gragas = 79,
	Graves = 104,
	Hecarim = 120,
	Heimerdinger = 74,
	Illaoi = 420,
	Irelia = 39,
	Ivern = 427,
	Janna = 40,
	JarvanIV = 59,
	Jax = 24,
	Jayce = 126,
	Jhin = 202,
	Jinx = 222,
	Kaisa = 145,
	Kalista = 429,
	Karma = 43,
	Karthus = 30,
	Kassadin = 38,
	Katarina = 55,
	Kayle = 10,
	Kayn = 141,
	Kennen = 85,
	Khazix = 121,
	Kindred = 203,
	Kled = 240,
	KogMaw = 96,
	Leblanc = 7,
	LeeSin = 64,
	Leona = 89,
	Lillia = 876,
	Lissandra = 127,
	Lucian = 236,
	Lulu = 117,
	Lux = 99,
	Malphite = 54,
	Malzahar = 90,
	Maokai = 57,
	MasterYi = 11,
	MissFortune = 21,
	Mordekaiser = 82,
	Morgana = 25,
	Nami = 267,
	Nasus = 75,
	Nautilus = 111,
	Neeko = 518,
	Nidalee = 76,
	Nocturne = 56,
	Nunu = 20,
	Olaf = 2,
	Orianna = 61,
	Ornn = 516,
	Pantheon = 80,
	Poppy = 78,
	Pyke = 555,
	Qiyana = 246,
	Quinn = 133,
	Rakan = 497,
	Rammus = 33,
	RekSai = 421,
	Rell = 526,
	Renekton = 58,
	Rengar = 107,
	Riven = 92,
	Rumble = 68,
	Ryze = 13,
	Samira = 360,
	Sejuani = 113,
	Senna = 235,
	Seraphine = 147,
	Sett = 875,
	Shaco = 35,
	Shen = 98,
	Shyvana = 102,
	Singed = 27,
	Sion = 14,
	Sivir = 15,
	Skarner = 72,
	Sona = 37,
	Soraka = 16,
	Swain = 50,
	Sylas = 517,
	Syndra = 134,
	TahmKench = 223,
	Taliyah = 163,
	Talon = 91,
	Taric = 44,
	Teemo = 17,
	Thresh = 412,
	Tristana = 18,
	Trundle = 48,
	Tryndamere = 23,
	TwistedFate = 4,
	Twitch = 29,
	Udyr = 77,
	Urgot = 6,
	Varus = 110,
	Vayne = 67,
	Veigar = 45,
	Velkoz = 161,
	Vi = 254,
	Viego = 234,
	Viktor = 112,
	Vladimir = 8,
	Volibear = 106,
	Warwick = 19,
	MonkeyKing = 62,
	Xayah = 498,
	Xerath = 101,
	XinZhao = 5,
	Yasuo = 157,
	Yone = 777,
	Yorick = 83,
	Yuumi = 350,
	Zac = 154,
	Zed = 238,
	Ziggs = 115,
	Zilean = 26,
	Zoe = 142,
	Zyra = 143,
	Gwen = 887,
	Akshan = 166,
	Vex = 711,
	Zeri = 221,
	Renata = 888,
	Belveth = 200,
	Nilah = 895,
    Naafiri = 950,
	Briar = 233,
	KSante = 897,
	Milio = 902,
	Unknown = 5000,
	TFTChampion = 5001,
	SG_Skarner = 5002,
	SG_VelKoz = 5003,
	SG_RekSai = 5004,
	SG_KogMaw = 5005,
	SG_KhaZix = 5006,
	SG_ChoGath = 5007
}

---@enum pkttype_e
local pkttype_e = {
	PKT_S2C_PlayAnimation_s = 0
}


---@enum plugin_type
local plugin_type = {
	utility = 0,
	champion = 1,
	misc = 2,
	core = 3,
}

---@enum teleport_status
local teleport_status = {
	Start = 0,
	Finish = 1,
	Abort = 2
}

---@enum on_play_sound_event_type
local on_play_sound_event_type = {
	Oneshot = 0,
	Controlled = 1
}

---@enum on_vote_type
local on_vote_type = {
	surrender = 0,
	neutral_camp = 1
}

---@enum evade_skillshot_type
local evade_skillshot_type = {
	SkillshotCircle = 0,
	SkillshotLine = 1,
	SkillshotMissileLine = 2,
	SkillshotCone = 3,
	SkillshotMissileCone = 4,
	SkillshotRing = 5,
	SkillshotArc = 6
}

---@enum gapcloser_type
local gapcloser_type = {
	skillshot = 0,
	targeted = 1,
	item = 2,
}

_G.gapcloser_type = gapcloser_type
_G.evade_skillshot_type = evade_skillshot_type
_G.on_vote_type = on_vote_type
_G.on_play_sound_event_type = on_play_sound_event_type
_G.teleport_status = teleport_status
_G.plugin_type = plugin_type
_G.pkttype_e = pkttype_e
_G._player_ping_type = _player_ping_type
_G.champion_id = champion_id
_G.emote_type = emote_type
_G.summoner_emote_slot = summoner_emote_slot
_G._issue_order_type = _issue_order_type
_G.spell_state = spell_state
_G.hit_chance = hit_chance
_G.collisionable_objects = collisionable_objects
_G.spell_targeting = spell_targeting
_G.damage_type = damage_type
_G.skillshot_type = skillshot_type
_G.PerkId = PerkId
_G.buff_type = buff_type
_G.keyboard_game = keyboard_game
----
_G.game_object_team = game_object_team
_G.nav_collision_flags = nav_collision_flags
_G.spellslot = spellslot
_G.game_state_stage = game_state_stage
_G.teleport_type = teleport_type
_G.events = events
_G.tree_hotkey_mode = tree_hotkey_mode
_G.hud_cursor_type = hud_cursor_type
