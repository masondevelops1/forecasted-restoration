return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 18,
  height = 11,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 69,
  properties = {
    ["border"] = "shelter",
    ["light"] = true,
    ["music"] = "in-the-shelter"
  },
  tilesets = {},
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 18,
      height = 11,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "imagelayer",
      image = "../../../../assets/sprites/backgrounds/mainroom.png",
      id = 2,
      name = "mainroom",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 40,
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
      name = "collisions",
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
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 134,
          y = 142.5,
          width = 152,
          height = 41.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 121,
          width = 280.5,
          height = 42.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = -44,
          y = 388,
          width = 314,
          height = 72,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 264.052,
          y = 459.695,
          width = 173,
          height = 34.5,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 426,
          y = 390,
          width = 278,
          height = 72.2805,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 708,
          y = 172,
          width = 26,
          height = 134,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 110,
          y = 76,
          width = 84,
          height = 108,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "",
          type = "",
          shape = "polygon",
          x = 568,
          y = 188,
          width = 44.1227,
          height = 11.3073,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 4, y = -22 },
            { x = 46, y = -22 },
            { x = 46, y = 20 }
          },
          properties = {}
        },
        {
          id = 33,
          name = "",
          type = "",
          shape = "polygon",
          x = 656,
          y = 334,
          width = 145.5,
          height = 37.5,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 4, y = -78 },
            { x = 46, y = -36 },
            { x = 46, y = -78 }
          },
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "polygon",
          x = 0,
          y = 252,
          width = 15.1364,
          height = 46.6818,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 48, y = 0 },
            { x = 0, y = 48 }
          },
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "polygon",
          x = 100.977,
          y = 153.023,
          width = 15.1364,
          height = 46.6818,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -12.977, y = 34.977 },
            { x = 11.023, y = 34.977 },
            { x = -12.977, y = 58.977 }
          },
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = -9,
          y = 301,
          width = 14,
          height = 86,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "rectangle",
          x = 702,
          y = 298,
          width = 8,
          height = 93,
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
          id = 31,
          name = "transition",
          type = "",
          shape = "polygon",
          x = 72,
          y = 176,
          width = 38.5,
          height = 64.1781,
          rotation = 0,
          visible = true,
          polygon = {
            { x = -24, y = -18 },
            { x = 10, y = -50 },
            { x = 10, y = 42 },
            { x = -24, y = 76 }
          },
          properties = {
            ["map"] = "shelter/awakening",
            ["marker"] = "awakeningdoor"
          }
        },
        {
          id = 35,
          name = "transition",
          type = "",
          shape = "polygon",
          x = 600,
          y = 200,
          width = 35.3229,
          height = 81.5,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 14, y = 8 },
            { x = 58, y = 8 },
            { x = 58, y = 52 }
          },
          properties = {
            ["map"] = "shelter/hallway"
          }
        },
        {
          id = 40,
          name = "cameratarget",
          type = "",
          shape = "rectangle",
          x = -120.667,
          y = 24.7273,
          width = 920.667,
          height = 416.667,
          rotation = 0,
          visible = false,
          properties = {
            ["lockx"] = false,
            ["locky"] = true,
            ["marker"] = "camfocus",
            ["time"] = 0.1
          }
        },
        {
          id = 60,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 263.955,
          y = 455.485,
          width = 173.273,
          height = 76,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* Too late to go back."
          }
        },
        {
          id = 66,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 216.333,
          y = 142.667,
          width = 31.6667,
          height = 50.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "nightCutscenes.paper"
          }
        },
        {
          id = 67,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 495.667,
          y = 135,
          width = 34.6667,
          height = 32.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "nightCutscenes.coat"
          }
        },
        {
          id = 68,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 437.458,
          y = 138.812,
          width = 53.3334,
          height = 32.6667,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "nightCutscenes.locked"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 1,
          name = "spawn",
          type = "",
          shape = "point",
          x = 350.14,
          y = 374.617,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "mainroomdoor",
          type = "",
          shape = "point",
          x = 578.5,
          y = 251.5,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "camfocus",
          type = "",
          shape = "point",
          x = 350,
          y = 224,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "awaken",
          type = "",
          shape = "point",
          x = 133,
          y = 254.5,
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
