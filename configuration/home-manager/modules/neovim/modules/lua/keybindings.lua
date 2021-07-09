local wk = require("which-key")

wk.register({
    -- File commands
    f = {
        name = "file",

        f = { "<cmd>Neoformat<cr>", "Format file" },
        n = { "<cmd>new", "New File" },

        o = { require'telescope-config'.project_files, "Find File" },
        h = { require'telescope-config'.home_files, "Find File Global" },
        b = { require'telescope-config'.all_buffers, "Switch Buffer" },
        ["/"] = { "<cmd>Telescope live_grep<cr>", "Grep Project" },
    },
}, { prefix = "<leader>" })
