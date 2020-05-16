//Imports
import mods.dropt.Dropt;

//Add to a crystallizer or something, using <terraqueous:item_main:51>
//Endimium crystal
//recipes.addShapeless("glass_shards", <terraqueous:doodads:6>, [<ore:HammerTool>, <ore:blockGlass>]);

//Endimium crystal remove tooltip
<terraqueous:doodads:4>.clearTooltip();

//Endimium crystal add tooltip
<terraqueous:doodads:4>.addTooltip(format.white("Endimium Crystal"));
<terraqueous:doodads:4>.addTooltip("Decorative");
<terraqueous:doodads:4>.addTooltip(format.blue(format.italic("Terraqueous")));

//Endimium crystal drops Endimium crystal upon breaking
Dropt.list("endimium_crystal")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads:4"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads:4>])
      )
  );