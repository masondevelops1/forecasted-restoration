return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 35,
  properties = {
    ["border"] = "leaves",
    ["light"] = true,
    ["music"] = "school"
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
      image = "../../../../../../assets/sprites/world/maps/hometown/school/toriel_class.png",
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
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 252,
          y = 178,
          width = 186,
          height = 38,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 216,
          y = 248,
          width = 64,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 216,
          y = 306,
          width = 64,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 318,
          y = 306,
          width = 64,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 418,
          y = 306,
          width = 64,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 318,
          y = 248,
          width = 64,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 418,
          y = 248,
          width = 64,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 70,
          y = 436,
          width = 494,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 70,
          y = 104,
          width = 32,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 168,
          y = 104,
          width = 396,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 564,
          y = 104,
          width = 40,
          height = 376,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 30,
          y = 104,
          width = 40,
          height = 376,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 522,
          y = 430,
          width = 34,
          height = 118,
          rotation = 0,
          gid = 27,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 342,
          width = 70,
          height = 52,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 316,
          y = 342,
          width = 70,
          height = 52,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 214,
          y = 342,
          width = 70,
          height = 52,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 214,
          y = 284,
          width = 70,
          height = 52,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 316,
          y = 284,
          width = 70,
          height = 52,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 284,
          width = 70,
          height = 52,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 252,
          y = 216,
          width = 188,
          height = 90,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 102,
          y = 102,
          width = 66,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 1,
            ["exit_sound"] = "doorclose",
            ["facing"] = "down",
            ["map"] = "hometown/school/school_lobby",
            ["marker"] = "entrytoriel",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 28,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 214,
          y = 104,
          width = 106,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (\"Ms. Toriel\" is written in cursive on the dry-erase board.)",
            ["text2"] = "* (Seems like it hasn't been erased in a very long time.)"
          }
        },
        {
          id = 29,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 352,
          y = 104,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (You uncapped the scented green marker.)",
            ["text2"] = "* (It's almost dry,[wait:5] but that gives it a refined,[wait:5] aged apple bouquet.)"
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 452,
          y = 120,
          width = 56,
          height = 38,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Kids' books.)\n[wait:5]* (Some of them used to be yours.)"
          }
        },
        {
          id = 31,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 518,
          y = 118,
          width = 32,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (It's a primitive drawing of your mom.)"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 390,
          width = 38,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = "* (The Throne of the Gods grows even higher.)\n* (Almost an sky-scrapper)"
          }
        },
        {
          id = 32,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 390,
          y = 176,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Hey Apple!)"
          }
        },
        {
          id = 33,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 406,
          y = 104,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (Hyperdodecahedron...)"
          }
        },
        {
          id = 34,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 270,
          y = 178,
          width = 38,
          height = 38,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The computer wallpaper is updated.)",
            ["text2"] = "* (It's a picture of your brother and you playing video games.)"
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
          id = 27,
          name = "spawn",
          type = "",
          shape = "point",
          x = 136,
          y = 176,
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
