//Water pearl tooltip
<terraqueous:water_pearl>.clearTooltip();
<terraqueous:water_pearl>.addTooltip(format.white("Water Pearl"));
<terraqueous:water_pearl>.addTooltip("Infinite water source");
<terraqueous:water_pearl>.addTooltip("Prevents loss of breath while held or in the hotbar");
<terraqueous:water_pearl>.addTooltip(format.blue(format.italic("Terraqueous")));
<terraqueous:water_pearl>.addTooltip(format.gold("Bauble (Ring)"));

//Vals (item renaming inside the script)
val Water = <ore:listAllwater>;
val LavaBucket = <minecraft:lava_bucket>;
val Bucket = <minecraft:bucket>;
val Dirt = <ore:dirt>;
val Redstone = <ore:dustRedstone>;
val Iron = <minecraft:iron_ingot>;
val PrismarineShard = <minecraft:prismarine_shard>;
val PrismarineCrystal = <minecraft:prismarine_crystals>;
val EnderPearl = <minecraft:ender_pearl>;
val Sawdust = <ore:dustWood> | <ore:itemSawdust>;
val Slag = <ore:crystalSlag> | <ore:itemSlag>;

//recipe removal
recipes.removeByRecipeName("biomesoplenty:mud_from_dirt");
recipes.removeByRecipeName("biomesoplenty:sand_from_dried_sand");
recipes.removeByRecipeName("jaff:tank");
recipes.removeByRecipeName("rftools:shape_card_pump_liquid");
recipes.removeByRecipeName("rftools:shape_card_pump");
recipes.removeByRecipeName("terraqueous:water_pearl");

//Add mud recipe
recipes.addShapedMirrored("bop_mud", <biomesoplenty:mud>,
    [
        [Water, Dirt]
    ]);

//Add dry sand to sand recipe
recipes.addShapedMirrored("dry_sand_to_sand", <minecraft:sand>,
    [
        [Water, <biomesoplenty:dried_sand>]
    ]);

//Add fish tank recipe
recipes.addShaped("jaff_fish_tank", <jaff:tank>*16,
    [
        [<ore:paneGlassColorless>, null, <ore:paneGlassColorless>],
        [<ore:paneGlassColorless>, Water, <ore:paneGlassColorless>],
        [<ore:paneGlassColorless>, <ore:paneGlassColorless>, <ore:paneGlassColorless>]
    ]);

//Add shape card (placing liquids) recipe
recipes.addShaped("liquid_placing_shape_card", <rftools:shape_card:10>,
    [
        [Redstone, Water, Redstone],
        [Iron, <rftools:shape_card>, Iron],
        [Redstone, LavaBucket, Redstone]
    ]);

//Add shape card (pump) recipe
recipes.addShaped("pump_shape_card", <rftools:shape_card:8>,
    [
        [Redstone, Water, Redstone],
        [Bucket, <rftools:shape_card>, Bucket],
        [Redstone, LavaBucket, Redstone]
    ]);

//Add water pearl recipe
recipes.addShaped("water_pearl", <terraqueous:water_pearl>,
    [
        [PrismarineShard, PrismarineCrystal, PrismarineShard],
        [Water, EnderPearl, Water],
        [PrismarineShard, PrismarineCrystal, PrismarineShard]
    ]);

//Add sawdust paper recipe
recipes.addShapedMirrored("sawdust_paper", <minecraft:paper>*2,
    [
        [Sawdust, Sawdust, Sawdust],
        [Sawdust, Water,]
    ]);

//Add podzol recipe
recipes.addShapedMirrored("slag_clay", <minecraft:clay_ball>*4,
    [
        [Slag, Slag],
        [Dirt, Water]
    ]);