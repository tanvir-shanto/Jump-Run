return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 40,
  height = 12,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 11,
  nextobjectid = 21,
  properties = {},
  tilesets = {
    {
      name = "earth",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 29,
      image = "tileset.png",
      imagewidth = 928,
      imageheight = 320,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 290,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 40,
      height = 12,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 89, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 118, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 37, 38, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 89, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        49, 49, 49, 49, 49, 50, 0, 0, 0, 0, 0, 65, 66, 67, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 118, 119, 0, 0, 0, 147, 148, 149, 152, 162, 163,
        78, 78, 78, 78, 78, 79, 0, 0, 0, 0, 0, 94, 95, 96, 97, 0, 0, 0, 0, 0, 0, 0, 2, 3, 4, 5, 48, 49, 50, 0, 0, 0, 0, 0, 176, 177, 178, 181, 191, 192,
        0, 0, 0, 0, 0, 0, 0, 0, 147, 148, 149, 152, 152, 125, 166, 166, 166, 2, 3, 4, 5, 0, 31, 32, 33, 34, 77, 78, 79, 0, 0, 0, 0, 0, 205, 206, 207, 207, 220, 221,
        0, 0, 0, 0, 0, 0, 0, 0, 176, 177, 178, 181, 181, 191, 195, 195, 195, 31, 32, 33, 34, 0, 60, 61, 62, 63, 0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 236, 236, 220, 221,
        0, 0, 0, 0, 0, 0, 0, 0, 205, 206, 207, 206, 207, 220, 221, 0, 0, 60, 61, 62, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 205, 206, 207, 207, 220, 221,
        0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 236, 235, 236, 220, 221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 236, 236, 220, 221,
        0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 236, 235, 236, 220, 221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 235, 236, 236, 220, 221
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 10,
      name = "spikes",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
      name = "goblins",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "Platforms",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 183.333,
          width = 166.667,
          height = 30.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 260.667,
          y = 254.667,
          width = 194.667,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 456,
          y = 254.667,
          width = 101.333,
          height = 25.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 558.667,
          y = 254,
          width = 90,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 712,
          y = 222.667,
          width = 98.6667,
          height = 61.3333,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 860,
          y = 215.333,
          width = 43.3333,
          height = 28,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 944.667,
          y = 154,
          width = 50,
          height = 40.6667,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1093.33,
          y = 188.667,
          width = 160,
          height = 193.333,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "enemies",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "boundaries",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "coins",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760.667,
          y = 191.333,
          width = 32,
          height = 30.6667,
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
      name = "flag",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1185.33,
          y = 159.333,
          width = 30.6667,
          height = 29.3333,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
