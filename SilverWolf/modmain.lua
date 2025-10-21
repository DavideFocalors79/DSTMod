PrefabFiles = {
	"silverwolf",
	"silverwolf_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/silverwolf.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/silverwolf.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/silverwolf.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/silverwolf.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/silverwolf_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/silverwolf_silho.xml" ),

    Asset( "IMAGE", "bigportraits/silverwolf.tex" ),
    Asset( "ATLAS", "bigportraits/silverwolf.xml" ),
	
	Asset( "IMAGE", "images/map_icons/silverwolf.tex" ),
	Asset( "ATLAS", "images/map_icons/silverwolf.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_silverwolf.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_silverwolf.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_silverwolf.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_silverwolf.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_silverwolf.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_silverwolf.xml" ),
	
	Asset( "IMAGE", "images/names_silverwolf.tex" ),
    Asset( "ATLAS", "images/names_silverwolf.xml" ),
	
	Asset( "IMAGE", "images/names_gold_silverwolf.tex" ),
    Asset( "ATLAS", "images/names_gold_silverwolf.xml" ),
}

AddMinimapAtlas("images/map_icons/silverwolf.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.silverwolf = "The Brainrotted Gamer"
STRINGS.CHARACTER_NAMES.silverwolf = "Silver Wolf"
STRINGS.CHARACTER_DESCRIPTIONS.silverwolf = "*Night is her domain\n*She is a picky eater and have trash taste\n*Scared of showers\n*Less apetite\n*She is prolly insane"
STRINGS.CHARACTER_QUOTES.silverwolf = "\"Time to log off... I mean, ah, head back.\""
STRINGS.CHARACTER_SURVIVABILITY.silverwolf = "None"

-- Custom speech strings
STRINGS.CHARACTERS.SILVERWOLF = require "speech_silverwolf"

-- The character's name as appears in-game 
STRINGS.NAMES.SILVERWOLF = "Silver Wolf"
STRINGS.SKIN_NAMES.silverwolf_none = "Silver Wolf"

-- The skins shown in the cycle view window on the character select screen.
-- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
local skin_modes = {
    { 
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle", 
        scale = 0.75, 
        offset = { 0, -25 } 
    },
}

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("silverwolf", "FEMALE", skin_modes)
