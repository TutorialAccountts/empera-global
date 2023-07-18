local xpBoostItemId = 23682 -- Replace with the item ID that grants the XP boost (4578 in this case)
local xpBoostPercentage = 50 -- 50% XP boost

local function applyXpBoost(player)
    local remainingBoost = player:getExpBoostStamina()

    if remainingBoost > 0 then
        player:say('You already have an active XP boost.', TALKTYPE_MONSTER_SAY)
        return false
    end

    player:setStoreXpBoost(xpBoostPercentage)
    player:setExpBoostStamina(1800) -- 1800 seconds = 30 minutes (adjust as needed)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been granted a " .. xpBoostPercentage .. "% XP boost for the next 30 minutes.")
    return true
end

function onUseXpBoostItem(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    if not player then
        return false
    end

    if item.itemid == xpBoostItemId then
        if player:getLevel() < 30 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must be level 30 or higher to use the XP boost.")
            return true
        end

        if applyXpBoost(player) then
            Item(item.uid):remove(1)
        end
    end

    return true
end

local xpBoostItem = Action()
xpBoostItem.onUse = onUseXpBoostItem

xpBoostItem:id(xpBoostItemId)
xpBoostItem:register()
