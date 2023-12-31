local outfits = {
 
    -- Config
        dollID = 2991, -- Change this to your dolls or items, item ID
     
        -- Main Window Messages (The first window the player sees)
        mainTitle = "Choose an outfit",
        mainMsg = "You will recieve both addons aswell as the outfit you choose.",
     
        -- Already Owned Window (The window that appears when the player already owns the addon)
        ownedTitle = "Whoops!",
        ownedMsg = "You already have this addon. Please choose another.",
     
        -- No Doll in Backpack (The window that appears when the player doesnt have the doll in their backpack)
        dollTitle = "Whoops!",
        dollMsg = "The addon doll must be in your backpack.",
    -- End Config

    -- Outfit Table
        [1] = {name = "Citizen", male = 128, female = 136},
        [2] = {name = "Hunter", male = 129, female = 137},
        [3] = {name = "Knight", male = 131, female = 139},
        [4] = {name = "Noble", male = 132, female = 140},
        [5] = {name = "Warrior", male = 134, female = 142},
        [6] = {name = "Barbarian", male = 143, female = 147},
        [7] = {name = "Druid", male = 144, female = 148},
        [8] = {name = "Wizard", male = 145, female = 149},
        [9] = {name = "Oriental", male = 146, female = 150},
        [10] = {name = "Pirate", male = 151, female = 155},
        [11] = {name = "Assassin", male = 152, female = 156},
        [12] = {name = "Beggar", male = 153, female = 157},
        [13] = {name = "Shaman", male = 154, female = 158},
        [14] = {name = "Norse", male = 251, female = 252},
        [15] = {name = "Nightmare", male = 268, female = 269},
        [16] = {name = "Jester", male = 273, female = 270},
        [17] = {name = "Brotherhood", male = 278, female = 279},
        [18] = {name = "Demonhunter", male = 289, female = 288},
        [19] = {name = "Yalaharian", male = 325, female = 324},
        [20] = {name = "Warmaster", male = 335, female = 336},
        [21] = {name = "Wayfarer", male = 367, female = 366},
        [22] = {name = "Afflicted", male = 430, female = 431},
        [23] = {name = "Elementalist", male = 432, female = 433},
        [24] = {name = "Deepling", male = 463, female = 464},
        [25] = {name = "Insectoid", male = 465, female = 466},
        [26] = {name = "Entrepreneur", male = 472, female = 471},
        [27] = {name = "Crystal Warlord", male = 512, female = 513},
        [28] = {name = "Soil Guardian", male = 516, female = 514},
        [29] = {name = "Demon", male = 541, female = 542},
        [30] = {name = "Cave Explorer", male = 574, female = 575},
        [31] = {name = "Dream Warden", male = 577, female = 578},
        [32] = {name = "Champion", male = 633, female = 632},
        [33] = {name = "Conjurer", male = 634, female = 635},
        [34] = {name = "Beastmaster", male = 637, female = 636},
        [35] = {name = "Chaos Acolyte", male = 665, female = 664},
        [36] = {name = "Death Herald", male = 667, female = 666},
        [37] = {name = "Ranger", male = 684, female = 683},
        [38] = {name = "Ceremonial Garb", male = 695, female = 694},
        [39] = {name = "Puppeteer", male = 697, female = 696},
        [40] = {name = "Spirit Caller", male = 699, female = 698},
        [41] = {name = "Evoker", male = 725, female = 724},
        [42] = {name = "Seaweaver", male = 733, female = 732},
        [43] = {name = "Recruiter", male = 746, female = 745},
        [44] = {name = "Sea Dog", male = 750, female = 749},
        [45] = {name = "Royal Pumpkin", male = 760, female = 759},
    }

local addonsDollModal = TalkAction("!addondoll")

    function addonsDollModal.onSay(player, words, param)
        player:sendAddonWindow(outfits)
        return true
    end

addonsDollModal:separator(" ")
addonsDollModal:register()