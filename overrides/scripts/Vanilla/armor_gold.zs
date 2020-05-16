//Vals (item renaming inside the script)
val Plate = <ore:plateGold>;
val Helmet = <minecraft:golden_helmet>;
val Chestplate = <minecraft:golden_chestplate>;
val Leggings = <minecraft:golden_leggings>;
val Boots = <minecraft:golden_boots>;

//Remove recipe for armor pieces
recipes.remove(Helmet);
recipes.remove(Chestplate);
recipes.remove(Leggings);
recipes.remove(Boots);

//Add helmet recipe
recipes.addShaped("gold_helmet", Helmet,
    [
        [Plate, Plate, Plate],
        [Plate, null, Plate],
        [null, null, null]
    ]);

//Add chestplate recipe
recipes.addShaped("gold_chestplate", Chestplate,
    [
        [Plate, null, Plate],
        [Plate, Plate, Plate],
        [Plate, Plate, Plate]
    ]);

//Add leggings recipe
recipes.addShaped("gold_leggings", Leggings,
    [
        [Plate, Plate, Plate],
        [Plate, null, Plate],
        [Plate, null, Plate]
    ]);

//Add boots recipe
recipes.addShaped("gold_boots", Boots,
    [
        [null, null, null],
        [Plate, null, Plate],
        [Plate, null, Plate]
    ]);