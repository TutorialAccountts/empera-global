local effects = {

    {position = Position(32351, 32230, 7), text = 'Seja Todos Bem Vindo', effect = CONST_ME_STUN},--templo
    {position = Position(32342, 32231, 7), text = 'HUNTES!', effect = 71}, --hub
	{position = Position(32342, 32229, 7), text = 'TRAINERS', effect = 62},
	{position = Position(32342, 32233, 7), text = 'BOSSES!', effect = 74},
	{position = Position(32342, 32227, 7), text = 'FORGE!', effect = 54},
	{position = Position(32343, 32226, 7), text = 'evento dice!', effect = 38},
	{position = Position(32345, 32226, 7), text = 'Invasao!', effect = 40},
    -- {position = Position(32380, 32239, 7), text = 'Tokens TPs!', effect = CONST_ME_FIREAREA},	--miner area
	{position = Position(32791, 32329, 10), text = 'Use " !libropoi " para conseguir el libro', effect = CONST_ME_FIREAREA},

}



local animatedText = GlobalEvent("AnimatedText") 

function animatedText.onThink(interval)

    for i = 1, #effects do

        local settings = effects[i]

        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)

        if #spectators > 0 then

            if settings.text then

                for i = 1, #spectators do

                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)

                end

            end

            if settings.effect then

                settings.position:sendMagicEffect(settings.effect)

            end

        end

    end

   return true

end



animatedText:interval(2000)

animatedText:register()