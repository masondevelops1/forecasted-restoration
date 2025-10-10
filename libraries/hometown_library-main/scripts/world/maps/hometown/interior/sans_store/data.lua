return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 23,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 42,
  properties = {
    ["border"] = "leaves",
    ["depths"] = true,
    ["light"] = false,
    ["music"] = "pirates"
  },
  tilesets = {
    {
      name = "hometownobjects",
      firstgid = 1,
      filename = "../../../../tilesets/hometownobjects.tsx",
      exportfilename = "../../../../tilesets/hometownobjects.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/maps/hometown/interior/sans_store.png",
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
      id = 3,
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
          shape = "rectangle",
          x = 520,
          y = 400,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 20,
          y = 400,
          width = 500,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 20,
          y = 40,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 20,
          y = 0,
          width = 820,
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
          x = 640,
          y = 400,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 400,
          width = 160,
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
          x = 800,
          y = 40,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 60,
          y = 160,
          width = 20,
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
          x = 222,
          y = 160,
          width = 578,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 102,
          y = 284,
          width = 330,
          height = 78,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 94,
          y = 370,
          width = 344,
          height = 150,
          rotation = 0,
          gid = 20,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 654,
          y = 382,
          width = 52,
          height = 56,
          rotation = 0,
          gid = 19,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 718,
          y = 388,
          width = 58,
          height = 166,
          rotation = 0,
          gid = 17,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 670,
          y = 160,
          width = 28,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown.sansplin"
          }
        },
        {
          id = 16,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 160,
          width = 142,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (Various frozen bagels and treats.)"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 322,
          width = 58,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* Ice-E's Pizza Pin-Ups Mangazine.",
            ["text2"] = "* HOt and fresh chease,[wait:5] pepperonie,[wait:5] Just like in your Dream's..."
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 178,
          y = 322,
          width = 60,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* There're some car magazines on the racks.",
            ["text2"] = "* It might be fun to look at them,",
            ["text3"] = "* But there's other people around..."
          }
        },
        {
          id = 19,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 246,
          y = 322,
          width = 60,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* It's a zine for Jockington fans. Seems popular."
          }
        },
        {
          id = 20,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 322,
          width = 104,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* It's a bunch of cards and heart shaped chocolates.",
            ["text2"] = "* \"Get well soon!\"\n* \"I'm glad your bike crashed\""
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 658,
          y = 336,
          width = 42,
          height = 42,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* It's a trash can."
          }
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 718,
          y = 328,
          width = 58,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* (You can't reach the top,[wait:5] rendering it impossible to get a basket.)",
            ["text2"] = "* (You'll never be able to buy something in this state...)"
          }
        },
        {
          id = 24,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 712,
          y = 200,
          width = 80,
          height = 18,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (It's a rack of candy[wait:5], jerky,[wait:5] and various nuts.)"
          }
        },
        {
          id = 25,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 200,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (You try to take an egg...)",
            ["text2"] = "* (It's glued to the basket.)"
          }
        },
        {
          id = 26,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 324,
          y = 200,
          width = 58,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (It looks like a normal basket of fruit,[wait:5] but when you reach in...)",
            ["text2"] = "* (...[wait:5] It's incredibly deep and holds all sorts of things.)"
          }
        },
        {
          id = 27,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 422,
          y = 200,
          width = 58,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Grapes,[wait:5] melons,,[wait:5] oranges,,[wait:5] and the scent of fresh pineapples...)"
          }
        },
        {
          id = 28,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 200,
          width = 36,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (It looks like a normal palm tree,[wait:5] but it's chock-full of useful groceries.)"
          }
        },
        {
          id = 29,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["depths"] = true,
            ["facing"] = "down",
            ["map"] = "depths/crosswalk",
            ["marker"] = "sans"
          }
        },
        {
          id = 32,
          name = "npc",
          type = "",
          shape = "point",
          x = 180.378,
          y = -45.88,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "sans",
            ["cutscene"] = "depthsCutscenes.sans"
          }
        },
        {
          id = 34,
          name = "npc",
          type = "",
          shape = "point",
          x = 646.292,
          y = 224.167,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "pirates/kris",
            ["plotmax"] = "*depths_pirates"
          }
        },
        {
          id = 36,
          name = "npc",
          type = "",
          shape = "point",
          x = 606.273,
          y = 224.091,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "pirates/ralsei",
            ["plotmax"] = "*depths_pirates"
          }
        },
        {
          id = 37,
          name = "npc",
          type = "",
          shape = "point",
          x = 568,
          y = 224.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "pirates/susie",
            ["plotmax"] = "*depths_pirates"
          }
        },
        {
          id = 38,
          name = "npc",
          type = "",
          shape = "point",
          x = 527.667,
          y = 224.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "pirates/noelle",
            ["plotmax"] = "*depths_pirates"
          }
        },
        {
          id = 39,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 560.25,
          y = 418.75,
          width = 79.5,
          height = 62,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "depthsCutscenes.meetPirates",
            ["once"] = false,
            ["plotmax"] = "*depths_pirates"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
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
          id = 30,
          name = "spawn",
          type = "",
          shape = "point",
          x = 600,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 41,
          name = "piratesOutside",
          type = "",
          shape = "point",
          x = 886,
          y = -104,
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
