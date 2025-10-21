local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}

-- Your character's stats
TUNING.SILVERWOLF_HEALTH = 100
TUNING.SILVERWOLF_HUNGER = 125
TUNING.SILVERWOLF_SANITY = 50

-- Custom starting inventory
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.SILVERWOLF = {
 "goldenaxe"
}

local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.SILVERWOLF
end
local prefabs = FlattenTree(start_inv, true)

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when not a ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "silverwolf_speed_mod", 1)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "silverwolf_speed_mod")
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "silverwolf.tex" )
end

local function sanity_drain(inst)
    if TheWorld.state.isday then
        -- Drain sanity in the daytime
        inst.components.sanity.dapperness = -TUNING.DAPPERNESS_MED  -- or tweak to your liking
    else
        -- Normal sanity regen/drain at night
        inst.components.sanity.dapperness = 0
    end
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- Set starting inventory
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
	
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(TUNING.SILVERWOLF_HEALTH)
	inst.components.hunger:SetMax(TUNING.SILVERWOLF_HUNGER)
	inst.components.sanity:SetMax(TUNING.SILVERWOLF_SANITY)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1

	-- Sanity multiplier
	inst.components.sanity.night_drain_mult = 0

	inst:WatchWorldState("isday", sanity_drain)
	inst:WatchWorldState("isdusk", sanity_drain)
	inst:WatchWorldState("isnight", sanity_drain)

	inst.components.sanity.wetness_induced_rate = 4

	-- Diet
	inst.components.eater:SetDiet({ FOODGROUP.MEAT, FOODGROUP.GOODIES }, { FOODGROUP.MEAT, FOODGROUP.GOODIES })
	inst.components.eater.strongstomach = true  -- can eat monster meat without penalty

	inst.components.eater:SetOnEatFn(function(inst, food)
    if not (food:HasTag("meat") or food:HasTag("sweetener") or food.prefab == "taffy" or food.prefab == "jellybean") then
        inst.components.talker:Say("That's not sigma 67 ohio rizz food!")
    end
	end)

	
	-- Run once on load
	sanity_drain(inst)

	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 0.75 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
end

return MakePlayerCharacter("silverwolf", prefabs, assets, common_postinit, master_postinit, prefabs)
