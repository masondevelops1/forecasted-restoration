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
  nextlayerid = 8,
  nextobjectid = 36,
  properties = {
    ["border"] = "core",
    ["light"] = true,
    ["music"] = "gateway"
  },
  tilesets = {},
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 240,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 201,
          y = 200,
          width = 240,
          height = 41,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 240,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 360,
          width = 80,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 360,
          width = 80,
          height = 120,
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
          id = 6,
          name = "elevatorbuttons",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["plotmin"] = "gateway_terminal1"
          }
        },
        {
          id = 7,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "intro/lab_reception",
            ["marker"] = "entry_elevator",
            ["sound"] = "elecdoor_close"
          }
        },
        {
          id = 29,
          name = "elevator",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["color_1"] = "#ff6a5d7b",
            ["color_2"] = "#ff362f42",
            ["color_3"] = "#ff1c1921",
            ["dest_1"] = "gateway/creation",
            ["dest_2"] = "gateway/basement",
            ["dest_3"] = "gateway/broken",
            ["length_1"] = 1040,
            ["length_2"] = 1040,
            ["length_3"] = 1040,
            ["name_1"] = "Gateway B1",
            ["name_2"] = "Gateway B2",
            ["name_3"] = "Gateway B3"
          }
        },
        {
          id = 35,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 359.318,
          y = 199.257,
          width = 40.8182,
          height = 56.7579,
          rotation = 0,
          visible = true,
          properties = {
            ["plotmax"] = "*gateway_terminal1",
            ["text1"] = "[color:#ff4444]* Warning:[wait:5] Gateway Elevator is on Lockdown.",
            ["text2"] = "[color:#ff4444]* Please disable Lockdown to continue use."
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
          id = 5,
          name = "entry",
          type = "",
          shape = "point",
          x = 320,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 32,
          name = "buttons",
          type = "",
          shape = "point",
          x = 380,
          y = 260,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 33,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "entry_up",
          type = "",
          shape = "point",
          x = 320,
          y = 260,
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
