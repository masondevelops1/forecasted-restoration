return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 47,
  height = 21,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 53,
  properties = {
    ["border"] = "leaves",
    ["cond"] = "not Game",
    ["light"] = true
  },
  tilesets = {
    {
      name = "school",
      firstgid = 1,
      filename = "../../../../tilesets/school.tsx"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/maps/hometown/school/school_lobby.png",
      id = 2,
      name = "room",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "polygon",
          x = 80,
          y = 520,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = 40, y = -40 }
          },
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "polygon",
          x = 120,
          y = 480,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = 40, y = -40 }
          },
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 278,
          y = 400,
          width = 522,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 80,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 80,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 840,
          y = 0,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 0,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 80,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 80,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 400,
          width = 560,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1718,
          y = 400,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1760,
          y = 400,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 520,
          width = 680,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 560,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 640,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 680,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 840,
          y = 680,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 640,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 560,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 520,
          width = 720,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 22,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 400,
          width = 78,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 1,
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "hometown/school/kris_class",
            ["marker"] = "spawn",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 23,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1640,
          y = 400,
          width = 78,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 1,
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "hometown/school/toriel_class",
            ["marker"] = "spawn",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 24,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 820,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/town_school",
            ["marker"] = "entryschool"
          }
        },
        {
          id = 25,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 880,
          y = -40,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "up",
            ["map"] = "hometown/school/school_door",
            ["marker"] = "spawn"
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1208,
          y = 360,
          width = 114,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* Do you like,[wait:5] breathing?[wait:5] Moving fast,[wait:5] with or without,[wait:5] legs?",
            ["text2"] = "* But usually,[wait:5] with legs?",
            ["text3"] = "* Join the Track Team with Jockington,[wait:5] and Noelle!"
          }
        },
        {
          id = 31,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1112,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (You ran the water fountain.)\n[wait:5]* (It's lukewarm.)"
          }
        },
        {
          id = 32,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 592,
          y = 360,
          width = 114,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (There's a paper here.)",
            ["text2"] = "* (It's an advertisement for the Sadie Hawkmans' Dance.)",
            ["text3"] = "* (... it's been postponed.)"
          }
        },
        {
          id = 33,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1400,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Locker.[wait:5] It's locked.)"
          }
        },
        {
          id = 35,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1440,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Locker.[wait:5] It's locked.)"
          }
        },
        {
          id = 36,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1480,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Locker.[wait:5] It's locked.)"
          }
        },
        {
          id = 37,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1560,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (It's your locker.)\n[wait:5]* (It's empty.)"
          }
        },
        {
          id = 38,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 1520,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (This used to be your brother's locker.)"
          }
        },
        {
          id = 39,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 41,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 42,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 43,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* The locker is locked."
          }
        },
        {
          id = 44,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 400,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The locker is covered in Jockington memorabilia.)",
            ["text2"] = "* (One of them is depicted wielding a basketball attached to a fork.)"
          }
        },
        {
          id = 47,
          name = "npc",
          type = "",
          shape = "point",
          x = 325.455,
          y = 479.318,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "susie_lw",
            ["cond"] = "not Game:hasPartyMember(\"susie\")"
          }
        },
        {
          id = 48,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 240.333,
          y = 475.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "not Game:hasPartyMember(\"susie\")",
            ["cutscene"] = "nightCutscenes.outside",
            ["once"] = false
          }
        },
        {
          id = 50,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 660,
          y = 659,
          width = 30.5,
          height = 85,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "nightCutscenes.alphyswarn"
          }
        },
        {
          id = 51,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 795,
          y = 655.25,
          width = 283,
          height = 28.5,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game:hasPartyMember(\"alphys\")",
            ["cutscene"] = "nightCutscenes.alphyswarn"
          }
        },
        {
          id = 52,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 1065.5,
          y = 428.75,
          width = 283,
          height = 91.5,
          rotation = 0,
          visible = true,
          properties = {
            ["cond"] = "Game:hasPartyMember(\"alphys\")",
            ["cutscene"] = "nightCutscenes.alphyswarn"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 26,
          name = "entrykris",
          type = "",
          shape = "point",
          x = 240,
          y = 476,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "spawn",
          type = "",
          shape = "point",
          x = 940,
          y = 800,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "entrytoriel",
          type = "",
          shape = "point",
          x = 1680,
          y = 480,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "entrydark",
          type = "",
          shape = "point",
          x = 940,
          y = 40,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "susie1",
          type = "",
          shape = "point",
          x = 281.424,
          y = 478.788,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
