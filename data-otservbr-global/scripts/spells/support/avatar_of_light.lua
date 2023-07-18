local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({lookType = 1594}) -- Avatar of Light lookType

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if not creature or not creature:isPlayer() then
		return false
	end

	local grade = creature:upgradeSpellsWORD("Avatar of Light")
	if grade == WHEEL_GRADE_NONE then
		creature:sendCancelMessage("You cannot cast this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local cooldown = 0
	if grade >= WHEEL_GRADE_MAX then
		cooldown = 60
	elseif grade >= WHEEL_GRADE_UPGRADED then
		cooldown = 90
	elseif grade >= WHEEL_GRADE_REGULAR then
		cooldown = 10
	end
	local duration = 15000
	condition:setTicks(duration)
	local conditionCooldown = Condition(CONDITION_SPELLCOOLDOWN, CONDITIONID_DEFAULT, 265)
	conditionCooldown:setTicks((cooldown * 1000 * 60)/configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
	-- creature:getPosition():sendMagicEffect(CONST_ME_AVATAR_APPEAR)
	creature:addCondition(conditionCooldown)
	creature:addCondition(condition)
	creature:avatarTimer((os.time() * 1000) + duration)
	creature:reloadData()
	addEvent(ReloadDataEvent, duration, creature:getId())
	return true
end

spell:group("support")
spell:id(265)
spell:name("Avatar of Light")
spell:words("uteta res sac")
spell:level(1)
spell:mana(800)
spell:isPremium(true)
spell:cooldown(1000) -- Cooldown is calculated on the casting
spell:groupCooldown(1 * 1000)
spell:vocation("paladin;true", "royal paladin;true")
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(true)
spell:register()