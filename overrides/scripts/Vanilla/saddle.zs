//Remove saddle recipe
recipes.remove(<minecraft:saddle>);

//Add saddle recipe
recipes.addShaped("saddle", <minecraft:saddle>,
    [
        [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
        [<minecraft:leather>, <minecraft:iron_ingot>, <minecraft:leather>],
        [<minecraft:iron_ingot>, null, <minecraft:iron_ingot>]
    ]);