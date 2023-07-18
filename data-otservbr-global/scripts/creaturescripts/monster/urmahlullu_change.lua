local timetochange = 60 -- em segundos
local time = nil

local config = {
    {itemId = 31413},
    {itemId = 2886},
}

local function changeMonster(creature, newMonsterName)
    local position = creature:getPosition()
    creature:remove()
    Game.createMonster(newMonsterName, position, true, true)
    time = os.time()
end

local urmahlulluChanges = CreatureEvent("UrmahlulluChanges")

function urmahlulluChanges.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    if creature and creature:getName() == 'Urmahlullu the Immaculate' then
        if creature:getHealth() <= 400000 then
            changeMonster(creature, 'Wildness of Urmahlullu')
        end
    elseif creature and creature:getName() == 'Wildness of Urmahlullu' then
        if creature:getHealth() <= 300000 then
            if os.time() <= time + timetochange then
                changeMonster(creature, 'Urmahlullu the Tamed')
            else
                changeMonster(creature, 'Urmahlullu the Immaculate')
            end
        end
    elseif creature and creature:getName() == 'Urmahlullu the Tamed' then
        if creature:getHealth() <= 200000 then
            if os.time() <= time + timetochange then
                changeMonster(creature, 'Wisdom of Urmahlullu')
            else
                changeMonster(creature, 'Wildness of Urmahlullu')
            end
        end
    elseif creature and creature:getName() == 'Wisdom of Urmahlullu' then
        if creature:getHealth() <= 100000 then
            if os.time() <= time + timetochange then
                changeMonster(creature, 'Urmahlullu the Weakened')
            else
                changeMonster(creature, 'Urmahlullu the Tamed')
            end
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

urmahlulluChanges:register()

local weakenedDeath = CreatureEvent("WeakenedDeath")

function weakenedDeath.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if creature and creature:getName() == 'Urmahlullu the Weakened' then
        if os.time() > time + timetochange then
            local position = creature:getPosition()
            for _, tab in ipairs(config) do
                local item = Tile(position):getItemById(tab.itemId)
                if item then
                    item:remove()
                end
            end
            changeMonster(creature, 'Wisdom of Urmahlullu')
        end
    end
    return true
end

weakenedDeath:register()
