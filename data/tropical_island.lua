return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 32,
  height = 16,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 38,
  nextobjectid = 17,
  properties = {},
  tilesets = {
    {
      name = "tropical_island",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 15,
      image = "tilesets/tropical_island.png",
      imagewidth = 480,
      imageheight = 384,
      objectalignment = "topleft",
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
      wangsets = {
        {
          name = "Terrains",
          tile = -1,
          properties = {},
          colors = {
            {
              color = { 255, 0, 0 },
              name = "grass",
              probability = 1,
              tile = 16,
              properties = {}
            },
            {
              color = { 0, 255, 0 },
              name = "sand",
              probability = 1,
              tile = 76,
              properties = {}
            }
          },
          wangtiles = {
            {
              wangid = { 0, 0, 0, 1, 0, 0, 0, 0 },
              tileid = 15
            },
            {
              wangid = { 0, 0, 0, 1, 0, 1, 0, 0 },
              tileid = 16
            },
            {
              wangid = { 0, 0, 0, 0, 0, 1, 0, 0 },
              tileid = 17
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 0 },
              tileid = 18
            },
            {
              wangid = { 0, 0, 0, 1, 0, 1, 0, 1 },
              tileid = 19
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 21
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 22
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 26
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 27
            },
            {
              wangid = { 0, 1, 0, 1, 0, 0, 0, 0 },
              tileid = 30
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 31
            },
            {
              wangid = { 0, 0, 0, 0, 0, 1, 0, 1 },
              tileid = 32
            },
            {
              wangid = { 0, 1, 0, 1, 0, 0, 0, 1 },
              tileid = 33
            },
            {
              wangid = { 0, 1, 0, 0, 0, 1, 0, 1 },
              tileid = 34
            },
            {
              wangid = { 0, 1, 0, 0, 0, 0, 0, 0 },
              tileid = 45
            },
            {
              wangid = { 0, 1, 0, 0, 0, 0, 0, 1 },
              tileid = 46
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 1 },
              tileid = 47
            },
            {
              wangid = { 0, 1, 0, 0, 0, 1, 0, 0 },
              tileid = 48
            },
            {
              wangid = { 0, 0, 0, 1, 0, 0, 0, 1 },
              tileid = 49
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 51
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 52
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 56
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 57
            },
            {
              wangid = { 0, 0, 0, 2, 0, 0, 0, 0 },
              tileid = 75
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 0 },
              tileid = 76
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 0 },
              tileid = 77
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 0 },
              tileid = 78
            },
            {
              wangid = { 0, 0, 0, 2, 0, 2, 0, 2 },
              tileid = 79
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 0 },
              tileid = 90
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 91
            },
            {
              wangid = { 0, 0, 0, 0, 0, 2, 0, 2 },
              tileid = 92
            },
            {
              wangid = { 0, 2, 0, 2, 0, 0, 0, 2 },
              tileid = 93
            },
            {
              wangid = { 0, 2, 0, 0, 0, 2, 0, 2 },
              tileid = 94
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 0 },
              tileid = 105
            },
            {
              wangid = { 0, 2, 0, 0, 0, 0, 0, 2 },
              tileid = 106
            },
            {
              wangid = { 0, 0, 0, 0, 0, 0, 0, 2 },
              tileid = 107
            },
            {
              wangid = { 0, 2, 0, 0, 0, 2, 0, 0 },
              tileid = 108
            },
            {
              wangid = { 0, 0, 0, 2, 0, 0, 0, 2 },
              tileid = 109
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 152
            },
            {
              wangid = { 0, 1, 0, 1, 0, 1, 0, 1 },
              tileid = 153
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 167
            },
            {
              wangid = { 0, 2, 0, 2, 0, 2, 0, 2 },
              tileid = 168
            }
          }
        }
      },
      tilecount = 180,
      tiles = {}
    },
    {
      name = "birds",
      firstgid = 181,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 3,
      image = "tilesets/birds.png",
      imagewidth = 96,
      imageheight = 480,
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
      wangsets = {},
      tilecount = 45,
      tiles = {
        {
          id = 0,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
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
                x = 8,
                y = 12,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 0,
              duration = 100
            },
            {
              tileid = 1,
              duration = 100
            },
            {
              tileid = 2,
              duration = 100
            }
          }
        },
        {
          id = 1,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
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
                x = 8,
                y = 13,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 2,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 2,
            name = "",
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
                x = 8,
                y = 14,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 3,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 12,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 3,
              duration = 100
            },
            {
              tileid = 4,
              duration = 100
            },
            {
              tileid = 5,
              duration = 100
            }
          }
        },
        {
          id = 4,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 13,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 5,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 14,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 6,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 12,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 6,
              duration = 100
            },
            {
              tileid = 7,
              duration = 100
            },
            {
              tileid = 8,
              duration = 100
            }
          }
        },
        {
          id = 7,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 13,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 8,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 14,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 9,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 12,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 9,
              duration = 100
            },
            {
              tileid = 10,
              duration = 100
            },
            {
              tileid = 11,
              duration = 100
            }
          }
        },
        {
          id = 10,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 13,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 11,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 14,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 12,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 12,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 12,
              duration = 100
            },
            {
              tileid = 13,
              duration = 100
            },
            {
              tileid = 14,
              duration = 100
            }
          }
        },
        {
          id = 13,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 13,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 14,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 14,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 15,
          objectGroup = {
            type = "objectgroup",
            draworder = "index",
            id = 3,
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 15,
              duration = 100
            },
            {
              tileid = 16,
              duration = 100
            },
            {
              tileid = 17,
              duration = 100
            }
          }
        },
        {
          id = 16,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 17,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 18,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 18,
              duration = 100
            },
            {
              tileid = 19,
              duration = 100
            },
            {
              tileid = 20,
              duration = 100
            }
          }
        },
        {
          id = 19,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 20,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 21,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 21,
              duration = 100
            },
            {
              tileid = 22,
              duration = 100
            },
            {
              tileid = 23,
              duration = 100
            }
          }
        },
        {
          id = 22,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 23,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 24,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 24,
              duration = 100
            },
            {
              tileid = 25,
              duration = 100
            },
            {
              tileid = 26,
              duration = 100
            }
          }
        },
        {
          id = 25,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 26,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 27,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 27,
              duration = 100
            },
            {
              tileid = 28,
              duration = 100
            },
            {
              tileid = 29,
              duration = 100
            }
          }
        },
        {
          id = 28,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 29,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 30,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 30,
              duration = 100
            },
            {
              tileid = 31,
              duration = 100
            },
            {
              tileid = 32,
              duration = 100
            }
          }
        },
        {
          id = 31,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 32,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 33,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 33,
              duration = 100
            },
            {
              tileid = 34,
              duration = 100
            },
            {
              tileid = 35,
              duration = 100
            }
          }
        },
        {
          id = 34,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 35,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 36,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 36,
              duration = 100
            },
            {
              tileid = 37,
              duration = 100
            },
            {
              tileid = 38,
              duration = 100
            }
          }
        },
        {
          id = 37,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 38,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 39,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 39,
              duration = 100
            },
            {
              tileid = 40,
              duration = 100
            },
            {
              tileid = 41,
              duration = 100
            }
          }
        },
        {
          id = 40,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 41,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 42,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          },
          animation = {
            {
              tileid = 42,
              duration = 100
            },
            {
              tileid = 43,
              duration = 100
            },
            {
              tileid = 44,
              duration = 100
            }
          }
        },
        {
          id = 43,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 44,
          objectGroup = {
            type = "objectgroup",
            draworder = "topdown",
            name = "",
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
                x = 8,
                y = 16,
                width = 16,
                height = 4,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        }
      }
    }
  },
  layers = {
    {
      type = "group",
      id = 28,
      name = "bg",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      layers = {
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 1,
          name = "sky",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 0
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxzZ2BgcB/FA4bDBhinDjAuGWDcPMB40gDjhQOMR8EoGAUDBwDcAHdB"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 2,
          name = "cloudsA",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 0.25
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjFSQDMQpA0gXAXHxANKjYBSMZAAAarMawQ=="
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 35,
          name = "cloudsB",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 0.25
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjFSQDMQpA0gXAXHxANKjYBSMZAAAarMawQ=="
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 3,
          name = "sea0A",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 0.5
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIKRCRqBuGkA6VEwCgYSAACu1BAx"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 34,
          name = "sea0B",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 0.5
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIKRCRqBuGkA6VEwCgYSAACu1BAx"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 4,
          name = "sea1A",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 0.75
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIJRMBBgAhBPHEB6FIxsAADSWBIR"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 33,
          name = "sea1B",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 0.75
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIJRMBBgAhBPHEB6FIxsAADSWBIR"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 5,
          name = "sea2A",
          visible = true,
          opacity = 1,
          offsetx = 0,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 1
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIJRMBLBfCBeMILpkQ4AKwQn4Q=="
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 32,
          name = "sea2B",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {
            ["dx"] = 1
          },
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIJRMBLBfCBeMILpkQ4AKwQn4Q=="
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 32,
      height = 16,
      id = 23,
      name = "start",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzFlNENwjAMRG8FEEo/2o8AC7AZdAG+aSkDEDEstrAVq/Q7d9JTlKjWOW50VwA3YQRHd5Kv60X2/wgP4SksBP/din1j/yR0QhHOwoXg/7b12Ngb5q10RP8enNmrdO4ZnLur9O6s2asG64Hln8j+ZeWvWTijZqHuJ9R89P0Svp1CjWfpvFG/lbGePQf8Z2ELTtZDxu8tDNZPtnPPhoT6VnxmOdQWI4XziOdsj/rPdf0CnQEgXg=="
    },
    {
      type = "group",
      id = 12,
      name = "level1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      layers = {
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 15,
          name = "flat0",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {},
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIJRMAoGBnQAcTcQ9xChBoS7sKhFNgPE7oSq60RS24HGBwHBAcazgHglEK+A0jOBWAEqDqLFkdTA6Bio+EqoGgWovhVQ9ko0MxSw8GH2AAADZhkX"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 21,
          name = "rock",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {},
          encoding = "base64",
          compression = "zlib",
          data = "eJztzksKgCAQBmB3vVauepytA2W4LztA6S37hQkGEWoTtZgfPtBhnFEpiUQikfw9C6wf7t/heGn2BIZYVq+hgQI0KaFi72ZikzkmqV19fIe+0cMAIzgSz92Dt0/EWRu04Ons2N2znVFgfwmZft6bzs3VTuGYIE0="
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 17,
          name = "flat1",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {},
          encoding = "base64",
          compression = "zlib",
          data = "eJxjYBgFo2AUjIJRMAoGFnQAcTcUdwJxD1SsC4p70NR2QdV141CDTS2ymSC24ADjGCheCaVnQdkgeiYaWxyIV0DZMUjqYeLo6tDVItsBowE2ex5/"
        },
        {
          type = "tilelayer",
          x = 0,
          y = 0,
          width = 32,
          height = 16,
          id = 29,
          name = "tree",
          visible = true,
          opacity = 1,
          offsetx = 1024,
          offsety = 0,
          parallaxx = 1,
          parallaxy = 1,
          properties = {},
          encoding = "base64",
          compression = "zlib",
          data = "eJztzT0KAjEQhuF0/lVWu3ortbVw9wKrF7A2Gg8Q8QB6S99ABsIQBAsNQgYeMgyZ+YypVavWv9QKa2wK5e/QoS+UP2CPQ6H8Y6FcqeuP8064wMLh/sUcm+RMMcMIc2WMSbJ3jpy6Y9VM/sncZG6LBZbYwith1r7Z/US4dUODR+x97CUreKrXx17+N5kdfTc3ewGCjyaB"
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 24,
      name = "playerstart",
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
          shape = "point",
          x = 128,
          y = 128,
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
      id = 37,
      name = "birds",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2,
          name = "bird_1_red",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 32,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 181,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "bird_1_bluejay",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 64,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 184,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "bird_1_white_crest",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 187,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "bird_1_white",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 190,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "bird_1_brown",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 193,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "bird_2_blue",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 196,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "bird_2_brown_1",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 199,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "bird_2_brown_2",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 256,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 202,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "bird_2_cardinal",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 205,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "bird_2_eagle",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 208,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "bird_2_red",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 352,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 211,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "bird_2_black",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 384,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 214,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "bird_2_white",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 217,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "bird_3_robin",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 448,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 220,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "bird_3_sparrow",
          type = "",
          shape = "rectangle",
          x = 1024,
          y = 480,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 223,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
