//Remove recipes for powercell and advanced powercell
recipes.remove(<rftools:powercell>);
recipes.remove(<rftools:powercell_advanced>);

//Add powercell recipe
recipes.addShaped("powercell", <rftools:powercell>,
    [
        [<rftoolspower:power_core2>, <minecraft:diamond>, <rftoolspower:power_core2>],
        [<minecraft:prismarine_shard>, <rftools:machine_frame>, <minecraft:prismarine_shard>],
        [<rftoolspower:power_core2>, <minecraft:emerald>, <rftoolspower:power_core2>]
    ]);

//Add advanced powercell recipe
recipes.addShaped("advanced_powercell", <rftools:powercell_advanced>,
    [
        [<rftoolspower:power_core3>, <rftools:infused_diamond>, <rftoolspower:power_core3>],
        [<rftools:infused_diamond>, <rftools:powercell>, <rftools:infused_diamond>],
        [<rftoolspower:power_core3>, <rftools:infused_diamond>, <rftoolspower:power_core3>]
    ]);