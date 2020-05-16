//Imports
import mods.dropt.Dropt;

//Small stone recipe
recipes.addShapeless("small_stone", <terraqueous:doodads:1>, [<ore:HammerTool>, <minecraft:stone>]);

//Small stone remove tooltip
<terraqueous:doodads:1>.clearTooltip();

//Small stone add tooltip
<terraqueous:doodads:1>.addTooltip(format.white("Small Stone"));
<terraqueous:doodads:1>.addTooltip("Decorative");
<terraqueous:doodads:1>.addTooltip(format.blue(format.italic("Terraqueous")));

//Small stone drops small stone upon breaking
Dropt.list("small_stone")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads:1"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads:1>])
      )
  );