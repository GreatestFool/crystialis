//Imports
import mods.dropt.Dropt;

//Bones
recipes.addShapeless("bones", <terraqueous:doodads:2>, [<ore:HammerTool>, <minecraft:bone>]);

//Bones remove tooltip
<terraqueous:doodads:2>.clearTooltip();

//Bones add tooltip
<terraqueous:doodads:2>.addTooltip(format.white("Bones"));
<terraqueous:doodads:2>.addTooltip("Decorative");
<terraqueous:doodads:2>.addTooltip(format.blue(format.italic("Terraqueous")));

//Bones drops Bones upon breaking
Dropt.list("bones")

  .add(Dropt.rule()
      .matchBlocks(["terraqueous:doodads:2"])
      .addDrop(Dropt.drop()
          .items([<terraqueous:doodads:2>])
      )
  );