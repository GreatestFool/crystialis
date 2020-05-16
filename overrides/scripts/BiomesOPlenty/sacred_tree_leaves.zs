//Imports
import mods.dropt.Dropt;

//ct hand gives leaves_3:11, dropt verbose gives leaves_3:15

//Sacred tree leaves do not drop sapling upon being broken
Dropt.list("sacred_leaves")

  .add(Dropt.rule()
      .matchBlocks(["biomesoplenty:leaves_3:15"])
      .addDrop(Dropt.drop()
          .items([null])
      )
  );