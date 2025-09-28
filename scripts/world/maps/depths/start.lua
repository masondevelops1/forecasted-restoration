return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 16,
  properties = {
    ["depths"] = true,
    ["dusk"] = false,
    ["music"] = "endless_expanse",
    ["name"] = "Gateway - Dark World?"
  },
  tilesets = {
    {
      name = "gateway",
      firstgid = 1,
      filename = "../../tilesets/gateway.tsx",
      exportfilename = "../../tilesets/gateway.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 6,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 500, 501, 501, 501, 501, 501, 501, 501, 501, 501, 501, 502, 0, 0,
        0, 0, 532, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533, 501, 501,
        0, 0, 532, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533,
        0, 0, 532, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533, 533, 565, 565,
        0, 0, 564, 565, 565, 565, 565, 565, 565, 565, 565, 565, 565, 566, 597, 598,
        0, 0, 596, 597, 597, 597, 597, 597, 597, 597, 597, 597, 597, 597, 629, 630,
        0, 0, 628, 629, 629, 629, 629, 629, 629, 629, 629, 629, 629, 629, 661, 662,
        0, 0, 660, 661, 661, 661, 661, 661, 661, 661, 661, 661, 661, 661, 693, 694,
        0, 0, 692, 693, 693, 693, 693, 693, 693, 693, 693, 693, 693, 693, 725, 726
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 120,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 280,
          width = 80,
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
          x = 560,
          y = 120,
          width = 80,
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
          x = 80,
          y = 80,
          width = 480,
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
          x = 80,
          y = 320,
          width = 480,
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
          id = 5,
          name = "spawn",
          type = "",
          shape = "point",
          x = 360,
          y = 220,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "entry",
          type = "",
          shape = "point",
          x = 600,
          y = 220,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "susiespawn",
          type = "",
          shape = "point",
          x = 240,
          y = 220,
          width = 0,
          height = 0,
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
          id = 9,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 160,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "room1",
            ["marker"] = "entry"
          }
        },
        {
          id = 15,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 120,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* ouch oof owie your bones hurt",
            ["text2"] = "* The power of lore-inaccurate tilesets shines within you."
          }
        }
      }
    }
  }
}
