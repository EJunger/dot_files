local pairs = require("nvim-autopairs")
pairs.setup({
  check_ts = true,
  disable_filetype = {"TelescopePrompt"}, -- { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
})

--local cmp_autopairs = require "nvim-autopairs.completion.cmp"
--local cmp = require("cmp")
