//Imports
import mods.dropt.Dropt;

//Small red sandstone
recipes.addShapeless("small_red_sandstone", <terraqueous:doodads:7>, [<ore:HammerTool>, <minecraft:red_sandstone>]);

//Small red sandstone remove tooltip
<terraqueous:doodads:7>.clearTooltip();

//Small red sandstone add tooltip
<terraqueous:doodads:7>.addTooltip(format.white("Small Red Sandstone"));
<terraqueous:doodads:7>.addTooltip("Decorative");
<terraqueous:doodads:7>.addTooltip(format.blue(format.italic("Terraqueous")));

//Small red sandstone drops small red sandstone upon breaking
Dropt.list("small_red_sandstone")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads:7"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads:7>])
      )
  );