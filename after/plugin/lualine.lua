local function isTree()
  return vim.bo.filetype == "neo-tree"
end

local function isFile()
  return vim.bo.filetype ~= "neo-tree"
end

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "gruvbox-material",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", cond = isFile }
    },
    lualine_b = {
      { "branch", cond = isFile },
      { "diff", cond = isFile },
      { "diagnostics", cond = isFile }
    },
    lualine_c = {
      { "filename", cond = isFile },
      { "progress", cond = isTree }
    },
    lualine_x = {
      { "encoding", cond = isFile },
      { "fileformat", cond = isFile },
      { "filetype", cond = isFile },
      { "location", cond = isTree }
    },
    lualine_y = {
      { "progress", cond = isFile }
    },
    lualine_z = {
      { "location", cond = isFile }
    }
  },
  inactive_sections = {
    lualine_c = {
      { "filename", cond = isFile }
    },
    lualine_x = {
      { "location", cond = isFile }
    }
  }
})
