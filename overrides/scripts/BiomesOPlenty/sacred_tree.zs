//mods.jei.JEI.removeAndHide();

//Sacred tree sapling
mods.jei.JEI.removeAndHide(<biomesoplenty:sapling_1:7>);

//Sacred tree leaves
mods.jei.JEI.removeAndHide(<biomesoplenty:leaves_3:11>);

//Sacred tree logs recipe
recipes.addShapeless("sacred_logs", <biomesoplenty:log_0:4>, [<ore:treeLeaves>, <ore:logWood>]);
//Change later to include biome essence (<biomesoplenty:biome_essence>), so it won't conflict with other recipes (just in case)
//Biome essence needs its own custom recipe, but keep it simple