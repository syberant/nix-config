local M = {}

local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local simple_me = function(entry)
    local S = {}

    S.filename = entry.filename

    S.value = entry
    -- TODO: find out if coloring is possible
    S.display = entry.heading .. ' | ' .. entry.categories
    S.ordinal = S.display

    return S
end

M.find_zettel = function()
    local opts = {}

    opts.cwd = vim.loop.cwd()

    local files = require'plenary.scandir'.scan_dir(opts.cwd, {})
    local zettel_finder = finders.new_table({
        results = vim.tbl_map(function(x)
            local handle = io.open(x)
            local res = {
                filename = x;
                -- TODO: leave out initial hashtag
                heading = handle:read();
                -- TODO: leave out if no hashtag
                categories = handle:read();
            }
            io.close(handle)
            return res
        end, files),
        entry_maker = simple_me,
    })

    pickers.new(opts, {
        prompt_title = 'Find Zettel',
        finder = zettel_finder,
        previewer = conf.file_previewer(opts),
        sorter = conf.generic_sorter(opts),

        -- attach_mappings = function(prompt_bufnr)
            -- actions_set.select:replace(function()
                -- local entry = actions.get_selected_entry()
                -- actions.close(prompt_bufnr)
                -- vim.cmd(string.format('%d', entry.value))
            -- end)
            -- return true
        -- end,
    }):find()
end

return M
