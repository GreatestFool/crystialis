//Imports
import mods.dropt.Dropt;

//Add to a crystallizer or something, using <terraqueous:item_main:50>
//Burnium crystal
//recipes.addShapeless("glass_shards", <terraqueous:doodads:6>, [<ore:HammerTool>, <ore:blockGlass>]);

//Burnium crystal remove tooltip
<terraqueous:doodads:5>.clearTooltip();

//Burnium crystal add tooltip
<terraqueous:doodads:5>.addTooltip(format.white("Burnium Crystal"));
<terraqueous:doodads:5>.addTooltip("Decorative");
<terraqueous:doodads:5>.addTooltip(format.blue(format.italic("Terraqueous")));

//Burnium crystal drops Burnium crystal upon breaking
Dropt.list("burnium_crystal")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads:5"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads:5>])
      )
  );