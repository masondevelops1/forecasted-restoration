return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 32,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 12,
  nextobjectid = 97,
  properties = {
    ["border"] = "ground_zero",
    ["depths"] = true,
    ["dusk"] = false,
    ["music"] = "endless_expanse",
    ["name"] = "Depths - Maintenance Tunnels",
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
      width = 32,
      height = 32,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2451, 2452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2451, 2452, 0, 0, 2110, 2110, 0, 0, 2451, 2452, 0, 2519, 2520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2519, 2520, 0, 0, 2110, 2110, 0, 0, 2519, 2520, 0, 2587, 2588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2587, 2588, 0, 0, 2110, 2110, 0, 0, 2587, 2588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 2110, 2110, 2110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 32,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1678, 1679, 1680, 1681, 1682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1746, 1747, 1748, 1749, 1750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1814, 1815, 1816, 1817, 1818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1882, 1883, 1884, 1885, 1886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1123, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1124, 1126, 0,
        0, 1191, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1194, 0,
        0, 1191, 1192, 1192, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1192, 1192, 1192, 1193, 1192, 1193, 1192, 1192, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1194, 0,
        0, 1191, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1194, 0,
        0, 1191, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1194, 0,
        0, 1191, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1194, 0,
        0, 1191, 1192, 1192, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1192, 1192, 1192, 1193, 1192, 1193, 1192, 1192, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1194, 0,
        0, 1191, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1194, 0,
        0, 1259, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1190, 1192, 1189, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1262, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 1193, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 1192, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 1193, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 1193, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 1192, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1123, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1124, 1125, 1126, 0, 0, 0, 0, 0, 1191, 1193, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1191, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1257, 1124, 1125, 1125, 1125, 1125, 1258, 1192, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1191, 1192, 1192, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1192, 1193, 1192, 1192, 1193, 1192, 1193, 1192, 1194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1191, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1192, 1193, 1189, 1260, 1261, 1261, 1261, 1261, 1261, 1261, 1262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1259, 1261, 1261, 1261, 1261, 1190, 1193, 1189, 1261, 1261, 1261, 1261, 1262, 2642, 2643, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 2641, 2641, 2642, 2643, 2644, 1191, 1192, 1194, 2644, 2645, 2642, 2643, 2646, 2110, 2110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 2110, 2110, 2110, 2110, 1191, 1193, 1194, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 2110, 2110, 2110, 2110, 1191, 1192, 1194, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 2110, 2110, 2110, 2110, 1191, 1193, 1194, 2110, 2110, 2110, 2110, 2110, 2110, 2110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 32,
      id = 11,
      name = "powered",
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
        0, 0, 0, 0, 0, 1002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 1070, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 1138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 1206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 1274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1338, 1339, 1340, 1341, 1342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1406, 1407, 1408, 1409, 1410, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1474, 1475, 1476, 1477, 1478, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 1542, 1543, 1544, 1545, 1546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 32,
      id = 10,
      name = "Tile Layer 3",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 2270, 2271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 2338, 2339, 2276, 2277, 2278, 2279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2270, 2271, 2272, 2273, 2406, 2407, 2344, 2345, 2346, 2347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 2338, 2339, 2340, 2341, 2342, 0, 2412, 2413, 2414, 2415, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 0,
          y = 920,
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
          y = 1080,
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
          y = 920,
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
          x = 39.75,
          y = 880,
          width = 520.25,
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
          x = 344,
          y = 1120,
          width = 216,
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
          x = 39.75,
          y = 1120.25,
          width = 216,
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
          y = 956,
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
          y = 1020,
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
          y = 956,
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
          id = 15,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 880,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* You cough on a piece of dust.",
            ["text2"] = "* The power of old corridors fills you with courage."
          }
        },
        {
          id = 23,
          name = "enemy",
          type = "",
          shape = "point",
          x = 840,
          y = 640,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 24,
          name = "enemy",
          type = "",
          shape = "point",
          x = 794,
          y = 625.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 25,
          name = "enemy",
          type = "",
          shape = "point",
          x = 656,
          y = 543.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 26,
          name = "enemy",
          type = "",
          shape = "point",
          x = 748,
          y = 524.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 27,
          name = "enemy",
          type = "",
          shape = "point",
          x = 959.333,
          y = 491.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 28,
          name = "enemy",
          type = "",
          shape = "point",
          x = 768,
          y = 541.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 29,
          name = "enemy",
          type = "",
          shape = "point",
          x = 626.667,
          y = 546.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 30,
          name = "enemy",
          type = "",
          shape = "point",
          x = 512,
          y = 579.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 31,
          name = "enemy",
          type = "",
          shape = "point",
          x = 478,
          y = 514,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 32,
          name = "enemy",
          type = "",
          shape = "point",
          x = 588.667,
          y = 487.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 33,
          name = "enemy",
          type = "",
          shape = "point",
          x = 793.333,
          y = 476.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 34,
          name = "enemy",
          type = "",
          shape = "point",
          x = 897.333,
          y = 516,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 35,
          name = "enemy",
          type = "",
          shape = "point",
          x = 1015.33,
          y = 586.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 36,
          name = "enemy",
          type = "",
          shape = "point",
          x = 1101.33,
          y = 563.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 37,
          name = "enemy",
          type = "",
          shape = "point",
          x = 1027.33,
          y = 472,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 38,
          name = "enemy",
          type = "",
          shape = "point",
          x = 910.667,
          y = 419.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 39,
          name = "enemy",
          type = "",
          shape = "point",
          x = 708,
          y = 410.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 40,
          name = "enemy",
          type = "",
          shape = "point",
          x = 583.333,
          y = 412,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 41,
          name = "enemy",
          type = "",
          shape = "point",
          x = 432.667,
          y = 426,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 42,
          name = "enemy",
          type = "",
          shape = "point",
          x = 322,
          y = 470.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 43,
          name = "enemy",
          type = "",
          shape = "point",
          x = 316.667,
          y = 511.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 44,
          name = "enemy",
          type = "",
          shape = "point",
          x = 284.667,
          y = 550.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 45,
          name = "enemy",
          type = "",
          shape = "point",
          x = 194.667,
          y = 526.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 46,
          name = "enemy",
          type = "",
          shape = "point",
          x = 202,
          y = 491.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 47,
          name = "enemy",
          type = "",
          shape = "point",
          x = 371.333,
          y = 587.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 48,
          name = "enemy",
          type = "",
          shape = "point",
          x = 484.667,
          y = 628,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 49,
          name = "enemy",
          type = "",
          shape = "point",
          x = 734,
          y = 632.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 50,
          name = "enemy",
          type = "",
          shape = "point",
          x = 785.333,
          y = 600,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 51,
          name = "enemy",
          type = "",
          shape = "point",
          x = 603.333,
          y = 578,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 52,
          name = "enemy",
          type = "",
          shape = "point",
          x = 538.667,
          y = 624,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 53,
          name = "enemy",
          type = "",
          shape = "point",
          x = 396,
          y = 618,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 54,
          name = "enemy",
          type = "",
          shape = "point",
          x = 251.333,
          y = 584,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 55,
          name = "enemy",
          type = "",
          shape = "point",
          x = 204,
          y = 597.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 56,
          name = "enemy",
          type = "",
          shape = "point",
          x = 187.333,
          y = 622.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 57,
          name = "enemy",
          type = "",
          shape = "point",
          x = 324.667,
          y = 660,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 58,
          name = "enemy",
          type = "",
          shape = "point",
          x = 386,
          y = 660.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 59,
          name = "enemy",
          type = "",
          shape = "point",
          x = 582,
          y = 648.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 60,
          name = "enemy",
          type = "",
          shape = "point",
          x = 666.667,
          y = 643.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 61,
          name = "enemy",
          type = "",
          shape = "point",
          x = 782.667,
          y = 650,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 62,
          name = "enemy",
          type = "",
          shape = "point",
          x = 874,
          y = 642.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 63,
          name = "enemy",
          type = "",
          shape = "point",
          x = 1012,
          y = 641.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 64,
          name = "enemy",
          type = "",
          shape = "point",
          x = 1026.67,
          y = 626.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 65,
          name = "enemy",
          type = "",
          shape = "point",
          x = 928.667,
          y = 568,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 66,
          name = "enemy",
          type = "",
          shape = "point",
          x = 824,
          y = 544,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 67,
          name = "enemy",
          type = "",
          shape = "point",
          x = 804.667,
          y = 500.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 68,
          name = "enemy",
          type = "",
          shape = "point",
          x = 631.333,
          y = 469.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 69,
          name = "enemy",
          type = "",
          shape = "point",
          x = 546,
          y = 503.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 70,
          name = "enemy",
          type = "",
          shape = "point",
          x = 408.667,
          y = 515.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 71,
          name = "enemy",
          type = "",
          shape = "point",
          x = 319.333,
          y = 524,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 72,
          name = "enemy",
          type = "",
          shape = "point",
          x = 330.667,
          y = 590,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 73,
          name = "enemy",
          type = "",
          shape = "point",
          x = 664,
          y = 622.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 74,
          name = "enemy",
          type = "",
          shape = "point",
          x = 750,
          y = 650,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 75,
          name = "enemy",
          type = "",
          shape = "point",
          x = 937.333,
          y = 641.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 76,
          name = "enemy",
          type = "",
          shape = "point",
          x = 1068,
          y = 618.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 77,
          name = "enemy",
          type = "",
          shape = "point",
          x = 1076,
          y = 551.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 78,
          name = "enemy",
          type = "",
          shape = "point",
          x = 954,
          y = 553.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 79,
          name = "enemy",
          type = "",
          shape = "point",
          x = 912,
          y = 590.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 80,
          name = "enemy",
          type = "",
          shape = "point",
          x = 771.333,
          y = 568.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 81,
          name = "enemy",
          type = "",
          shape = "point",
          x = 679.333,
          y = 561.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 82,
          name = "enemy",
          type = "",
          shape = "point",
          x = 655.333,
          y = 574,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 83,
          name = "enemy",
          type = "",
          shape = "point",
          x = 588.667,
          y = 577.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 84,
          name = "enemy",
          type = "",
          shape = "point",
          x = 518.667,
          y = 549.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 85,
          name = "enemy",
          type = "",
          shape = "point",
          x = 509.333,
          y = 540.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 86,
          name = "enemy",
          type = "",
          shape = "point",
          x = 456,
          y = 566.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 87,
          name = "enemy",
          type = "",
          shape = "point",
          x = 398,
          y = 584.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 88,
          name = "enemy",
          type = "",
          shape = "point",
          x = 403.333,
          y = 546,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 89,
          name = "enemy",
          type = "",
          shape = "point",
          x = 412,
          y = 544.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 90,
          name = "enemy",
          type = "",
          shape = "point",
          x = 336,
          y = 515.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 91,
          name = "enemy",
          type = "",
          shape = "point",
          x = 260.667,
          y = 584.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 92,
          name = "enemy",
          type = "",
          shape = "point",
          x = 286,
          y = 615.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 93,
          name = "enemy",
          type = "",
          shape = "point",
          x = 330,
          y = 589.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 94,
          name = "enemy",
          type = "",
          shape = "point",
          x = 459.333,
          y = 621.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 95,
          name = "enemy",
          type = "",
          shape = "point",
          x = 580.667,
          y = 625.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        },
        {
          id = 96,
          name = "enemy",
          type = "",
          shape = "point",
          x = 667.333,
          y = 635.333,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "scrapscallion",
            ["chase"] = true,
            ["encounter"] = "scrapscallion"
          }
        }
      }
    }
  }
}
