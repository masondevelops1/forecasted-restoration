return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 10,
  nextobjectid = 22,
  properties = {
    ["border"] = "ground_zero",
    ["depths"] = true,
    ["dusk"] = false,
    ["music"] = "endless_expanse",
    ["name"] = "Gateway - Dark World?",
    ["step_sound"] = "reverb"
  },
  tilesets = {
    {
      name = "gateway",
      firstgid = 1,
      filename = "../../tilesets/gateway.tsx",
      exportfilename = "../../tilesets/gateway.lua"
    },
    {
      name = "depthstiles",
      firstgid = 929,
      filename = "../../tilesets/depthstiles.tsx",
      exportfilename = "../../tilesets/depthstiles.lua"
    },
    {
      name = "Core Tiles",
      firstgid = 3445,
      filename = "../../tilesets/Core Tiles.tsx",
      exportfilename = "../../tilesets/Core Tiles.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 7,
      name = "Tile Layer 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 18,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2451, 2452,
        0, 0, 0, 2451, 2452, 0, 0, 2110, 2110, 0, 0, 2451, 2452, 0, 2519, 2520,
        0, 0, 0, 2519, 2520, 0, 0, 2110, 2110, 0, 0, 2519, 2520, 0, 2587, 2588,
        0, 0, 0, 2587, 2588, 0, 0, 2110, 2110, 0, 0, 2587, 2588, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 2110, 2110, 2110, 0, 0, 0, 0, 0, 0, 0
      }
    },
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
        0, 0, 2369, 2370, 2371, 2372, 2373, 2370, 2371, 2372, 2373, 2372, 2373, 2374, 0, 0,
        0, 0, 2505, 2438, 2439, 2440, 2441, 2441, 2441, 2441, 2438, 2439, 2440, 2438, 2370, 2371,
        0, 0, 2437, 2438, 2438, 2438, 2439, 2440, 2441, 2509, 2506, 2507, 2508, 2509, 2438, 2439,
        0, 0, 2505, 2506, 2506, 2506, 2507, 2508, 2509, 2506, 2507, 2508, 2509, 2438, 2574, 2575,
        0, 0, 2573, 2574, 2575, 2576, 2577, 2574, 2575, 2576, 2577, 2576, 2577, 2578, 2642, 2643,
        0, 0, 2641, 2642, 2643, 2644, 2645, 2642, 2643, 2644, 2645, 2642, 2643, 2646, 2110, 2110,
        0, 0, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110,
        0, 0, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110,
        0, 0, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 2110
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
          x = 320,
          y = 156,
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
          x = 220,
          y = 156,
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
            ["map"] = "depths",
            ["marker"] = "spawn2"
          }
        },
        {
          id = 15,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 300.188,
          y = 79.875,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* You look out into the darkness, and then down at yourself.",
            ["text2"] = "* The light of your SOUL shines within you."
          }
        }
      }
    }
  }
}
