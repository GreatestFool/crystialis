//Imports
import mods.dropt.Dropt;

//Small sandstone
recipes.addShapeless("small_sandstone", <terraqueous:doodads:3>, [<ore:HammerTool>, <minecraft:sandstone>]);

//Small sandstone remove tooltip
<terraqueous:doodads:3>.clearTooltip();

//Small sandstone add tooltip
<terraqueous:doodads:3>.addTooltip(format.white("Small Sandstone"));
<terraqueous:doodads:3>.addTooltip("Decorative");
<terraqueous:doodads:3>.addTooltip(format.blue(format.italic("Terraqueous")));

//Small sandstone drops Small sandstone upon breaking
Dropt.list("small_sandstone")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads:3"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads:3>])
      )
  );