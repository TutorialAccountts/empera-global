local config = {
	{ name="Thais", position = Position(32351, 32230, 7) },
	{ name="Venore", position = Position(32957, 32076, 7) },
	{ name="Carlin", position = Position(32360, 31782, 7) },
	{ name="Kazordoon", position = Position(32649, 31925, 11) },
	{ name="Ab'Dendriel", position = Position(32732, 31634, 7) },
	{ name="Ankrahmun", position = Position(33194, 32853, 8) },
	{ name="Edron", position = Position(33217, 31814, 8) },
	{ name="Farmine", position = Position(33023, 31521, 11) },
	{ name="Darashia", position = Position(33213, 32454, 1) },
	{ name="Liberty Bay", position = Position(32317, 32826, 7) },
	{ name="Port Hope", position = Position(32594, 32745, 7) },
	{ name="Svargrond", position = Position(32212, 31132, 7) },
	{ name="Yalahar", position = Position(32787, 31276, 7) },
	{ name="Gray Beach", position = Position(33447, 31323, 9) },
	{ name="Krailos", position = Position(33657, 31665, 8) },
	{ name="Oramond", position = Position(33594, 31899, 6) },
	{ name="Roshamuul", position = Position(33513, 32363, 6) },
	{ name="Issavi", position = Position(33921, 31477, 5) }
}

local teleportCube = Action()
function teleportCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getSkull() ~= SKULL_NONE then
		player:sendCancelMessage("Você não pode se teleportar enquanto estiver com uma skull.")
		return true
	end

	local window = ModalWindow {
		title = "Teleport Modal",
		message = "Locations"
	}

	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function(player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você foi teleportado para " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end)
	end

	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end

teleportCube:id(3080)
teleportCube:register()
