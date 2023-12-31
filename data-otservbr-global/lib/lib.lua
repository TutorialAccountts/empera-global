-- Core API functions implemented in Lua
-- Load storages first
dofile(DATA_DIRECTORY .. '/lib/core/load.lua')

-- Compatibility library for our old Lua API
dofile(DATA_DIRECTORY .. '/lib/compat/compat.lua')

-- Tables library
dofile(DATA_DIRECTORY .. '/lib/tables/load.lua')

-- Others library
dofile(DATA_DIRECTORY .. '/lib/others/load.lua')

-- Quests library
dofile(DATA_DIRECTORY .. '/lib/quests/quest.lua')

-- Addon Doll library
dofile(DATA_DIRECTORY .. '/lib/others/addon_doll_lib.lua')

-- Mount Doll library
dofile(DATA_DIRECTORY .. '/lib/others/mount_doll_lib.lua')
