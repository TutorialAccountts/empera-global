local area = createCombatArea({
    {0, 0, 0, 0, 0},
    {0, 1, 1, 1, 0},
    {0, 1, 3, 1, 0},
   {0, 1, 1, 1, 0},
   {0, 0, 0, 0, 0},
})

local eldritchrod = Weapon(WEAPON_WAND)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DEATHAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

function onGetFormulaValues()
   local min = 800
   local max = 1400
   return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

eldritchrod.onUseWeapon = function(player, variant)
   return combat:execute(player, variant)
end

combat:setArea(area)
eldritchrod:id(36674)
eldritchrod:mana(60)
eldritchrod:range(5)
eldritchrod:register()