//Imports
import mods.dropt.Dropt;

//Fallen branch recipe
recipes.addShapeless("fallen_branch", <terraqueous:doodads>, [<minecraft:stick>]);

//Fallen branch remove tooltip
<terraqueous:doodads>.clearTooltip();

//Fallen branch add tooltip
<terraqueous:doodads>.addTooltip(format.white("Fallen Branch"));
<terraqueous:doodads>.addTooltip("Decorative");
<terraqueous:doodads>.addTooltip(format.blue(format.italic("Terraqueous")));

//Fallen branch drops fallen branch upon breaking
Dropt.list("fallen_branch")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads>])
      )
  );