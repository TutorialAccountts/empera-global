local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {

    "[Comandos]: comandos !addondoll, !mountdoll, !bless, !aol, !emote on/off, !depositall, !serverinfo.  ",
    "[addondoll e mountdoll]: e preciso ter o doll que vender no npc Trade por 25kk",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(700000)
AutoBroadCast:register()