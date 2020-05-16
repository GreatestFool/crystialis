//Remove elytra recipe
recipes.remove(<minecraft:elytra>);

//Add elytra recipe
recipes.addShaped("elytra", <minecraft:elytra>,
    [
        [null, <terraqueous:item_main:5>, null],
        [<openglider:hang_glider_part>, <minecraft:emerald>, <openglider:hang_glider_part:1>],
        [null, null, null]
    ]);