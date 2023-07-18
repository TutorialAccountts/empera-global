local mType = Game.createMonsterType("Stabilizing Reality Reaver")
local monster = {}

monster.description = "a stabilizing reality reaver"
monster.experience = 1950
monster.outfit = {
	lookType = 879,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1266
monster.Bestiary = {
	class = "Extra Dimensional",
	race = BESTY_RACE_EXTRA_DIMENSIONAL,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Otherworld (Edron)"
	}

monster.health = 2500
monster.maxHealth = 2500
monster.race = "venom"
monster.corpse = 23412
monster.speed = 155
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Ssshhh!", yell = false}
}

monster.loot = {
	{id = 3031, chance = 100000, maxCount = 100}, -- gold coin
	{id = 3035, chance = 100000, maxCount = 4}, -- platinum coin
	{id = 239, chance = 14200}, -- great health potion
	{id = 7642, chance = 14000}, -- great spirit potion
	{id = 238, chance = 12700}, -- great mana potion
	{id = 23545, chance = 11200}, -- energy drink
	{id = 23535, chance = 10900}, -- energy bar
	{id = 23501, chance = 9900}, -- condensed energy
	{id = 23524, chance = 8300}, -- small energy ball
	{id = 23506, chance = 8000}, -- plasma pearls
	{id = 16126, chance = 3400}, -- red crystal fragment
	{id = 16120, chance = 3400}, -- violet crystal shard
	{id = 16124, chance = 2700, maxCount = 2}, -- blue crystal splinter
	{id = 16119, chance = 1900}, -- blue crystal shard
	{id = 3039, chance = 1500}, -- red gem
	{id = 8092, chance = 1100} -- wand of starstorm
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -180, maxDamage = -300, range = 5, radius = 5, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_PURPLEENERGY, target = true},
	{name ="reality reaver wave", interval = 2000, chance = 20, minDamage = -200, maxDamage = -350, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -80, maxDamage = -200, radius = 3, effect = CONST_ME_STUN, target = false}
}

monster.defenses = {
	defense = 45,
	armor = 45,
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_POFF},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 80, maxDamage = 210, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 10, speedChange = 330, effect = CONST_ME_HITAREA, target = false, duration = 8000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 70},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
