//Imports
import mods.dropt.Dropt;

//Remove glass shards recipe
recipes.remove(<terraqueous:doodads:6>);

//Add glass shards recipe
recipes.addShapeless("glass_shards", <terraqueous:doodads:6>, [<ore:HammerTool>, <ore:blockGlass>]);

//Glass shards remove tooltip
<terraqueous:doodads:6>.clearTooltip();

//Glass shards add tooltip
<terraqueous:doodads:6>.addTooltip(format.white("Glass Shards"));
<terraqueous:doodads:6>.addTooltip("Decorative");
<terraqueous:doodads:6>.addTooltip(format.blue(format.italic("Terraqueous")));

//Glass shards drops Glass shards upon breaking
Dropt.list("glass_shards")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads:6"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads:6>])
      )
  );