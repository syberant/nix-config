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

    -- LaTeX commands
    l = {
        name = "LaTeX",
        l = { "<cmd>VimtexCompile<cr>", "Compile" },
        c = { "<cmd>VimtexCountWords<cr>", "Count Words" },
        e = { "<cmd>VimtexErrors<cr>", "Open Errors" },
        v = { "<cmd>VimtexView<cr>", "View" },
    },

    -- Git commands
    v = {
        name = "git",

        v = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
        h = { "<cmd>Telescope git_commits<cr>", "Commits" },

        b = { "<cmd>Telescope git_branches<cr>", "Branches" },
        s = { "<cmd>Telescope git_status<cr>", "Status" },
    },

    -- Documentation
    d = {
        name = "docs",

        v = { "<cmd>Telescope help_tags<cr>", "Vim" },
        m = { "<cmd>Telescope man_pages<cr>", "Man" },
    },

    [";"] = {"<Plug>NERDCommenterToggle", "Toggle Comment" },
}, { prefix = "<leader>" })
