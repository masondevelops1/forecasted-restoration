return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 14,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 16,
  nextobjectid = 49,
  properties = {
    ["light"] = true,
    ["music"] = "gateway",
    ["name"] = "The Gateway - Album Art"
  },
  tilesets = {
    {
      name = "castle",
      firstgid = 1,
      filename = "castle.tsx",
      exportfilename = "castle.lua"
    },
    {
      name = "gateway",
      firstgid = 41,
      filename = "gateway.tsx",
      exportfilename = "gateway.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../assets/sprites/TheGateway.png",
      id = 7,
      name = "Image Layer 1",
      class = "",
      visible = true,
      opacity = 0,
      offsetx = 156.75,
      offsety = 9,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 14,
      height = 12,
      id = 15,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 830, 127, 127, 127, 127, 127, 127, 127, 831, 0, 0,
        0, 0, 0, 830, 127, 127, 127, 127, 127, 127, 127, 831, 0, 0,
        0, 0, 0, 862, 829, 829, 802, 114, 801, 829, 829, 863, 0, 0,
        0, 0, 0, 0, 0, 0, 217, 218, 219, 0, 0, 0, 0, 0,
        312, 313, 314, 313, 314, 315, 217, 218, 219, 0, 0, 0, 0, 0,
        345, 345, 345, 345, 346, 89, 94, 95, 96, 0, 0, 0, 0, 0,
        352, 352, 352, 352, 353, 121, 126, 127, 128, 0, 0, 0, 0, 0,
        377, 377, 377, 377, 378, 153, 158, 159, 160, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = true,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 440,
          width = 360,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 280,
          width = 40,
          height = 160,
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
          id = 27,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* Inaccuracies echo in the light and dark of this incomprehensible scenery.",
            ["text2"] = "* You are filled with the power of not knowing how long a bridge should be."
          }
        },
        {
          id = 45,
          name = "floormirror",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 320,
          width = 200,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["opacity"] = 0.5
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
          id = 20,
          name = "spawn",
          type = "",
          shape = "point",
          x = 0,
          y = 400,
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
