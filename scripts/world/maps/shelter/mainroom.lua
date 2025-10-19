return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 23,
  height = 10,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 61,
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
      width = 23,
      height = 10,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
      offsetx = 120,
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
          x = 254,
          y = 102.5,
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
          x = 408,
          y = 81,
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
          x = 76,
          y = 348,
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
          x = 381.933,
          y = 400.314,
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
          x = 546,
          y = 350,
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
          x = 828,
          y = 132,
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
          x = 230,
          y = 36,
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
          x = 688,
          y = 148,
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
          x = 776,
          y = 294,
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
          x = 120,
          y = 212,
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
          x = 220.977,
          y = 113.023,
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
          x = 111,
          y = 261,
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
          x = 822,
          y = 258,
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
          x = 192,
          y = 136,
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
          x = 720,
          y = 160,
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
          x = -0.666667,
          y = -15.2727,
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
          x = 382,
          y = 358,
          width = 172,
          height = 76,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* Too late to back out now."
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
          x = 470.14,
          y = 334.617,
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
          x = 698.5,
          y = 211.5,
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
          x = 470,
          y = 184,
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
          x = 253,
          y = 214.5,
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
