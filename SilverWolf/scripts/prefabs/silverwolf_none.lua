local assets =
{
	Asset( "ANIM", "anim/silverwolf.zip" ),
	Asset( "ANIM", "anim/ghost_silverwolf_build.zip" ),
}

local skins =
{
	normal_skin = "silverwolf",
	ghost_skin = "ghost_silverwolf_build",
}

return CreatePrefabSkin("silverwolf_none",
{
	base_prefab = "silverwolf",
	type = "base",
	assets = assets,
	skins = skins, 
	skin_tags = {"silverwolf", "CHARACTER", "BASE"},
	build_name_override = "silverwolf",
	rarity = "Character",
})