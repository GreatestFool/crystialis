//Vals (item renaming inside the script)
val Plate = <ore:plateIron>;
val Helmet = <minecraft:iron_helmet>;
val Chestplate = <minecraft:iron_chestplate>;
val Leggings = <minecraft:iron_leggings>;
val Boots = <minecraft:iron_boots>;

//Remove recipe for armor pieces
recipes.remove(Helmet);
recipes.remove(Chestplate);
recipes.remove(Leggings);
recipes.remove(Boots);

//Add helmet recipe
recipes.addShaped("iron_helmet", Helmet,
    [
        [Plate, Plate, Plate],
        [Plate, null, Plate],
        [null, null, null]
    ]);

//Add chestplate recipe
recipes.addShaped("iron_chestplate", Chestplate,
    [
        [Plate, null, Plate],
        [Plate, Plate, Plate],
        [Plate, Plate, Plate]
    ]);

//Add leggings recipe
recipes.addShaped("iron_leggings", Leggings,
    [
        [Plate, Plate, Plate],
        [Plate, null, Plate],
        [Plate, null, Plate]
    ]);

//Add boots recipe
recipes.addShaped("iron_boots", Boots,
    [
        [null, null, null],
        [Plate, null, Plate],
        [Plate, null, Plate]
    ]);