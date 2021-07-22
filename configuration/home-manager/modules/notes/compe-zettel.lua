local compe = require'compe'
local Source = {}

function Source.new()
  return setmetatable({}, { __index = Source })
end

function Source.get_metadata(self)
  return {
    priority = 10;
    dup = 0;
    menu = '[Zettel]';
    -- filetypes = { "vimwiki" };
  }
end

function Source.determine(self, context)
  return compe.helper.determine(context)
end

function Source.complete(self, context)
    local before_line = context.context.before_line
    if not before_line:match('%[%[') then
        return context.abort()
    end

    local scandir = require'plenary.scandir'
    local cwd = vim.loop.cwd()
    local files = scandir.scan_dir(cwd, {})

    files = vim.tbl_map(function(x) return { word = x:sub(#cwd + 2); } end, files)

    context.callback({
        items = files;
    })
end

function Source.documentation(self, context)
  local cwd = vim.loop.cwd()
  local handle = io.open(cwd .. '/' .. context.completed_item.word)

  -- will show the current selected item documentation
  context.callback({ handle:read(), handle:read() })
end

-- function Source.resolve(self, args)
    -- args.completed_item.user_data.compe.completion_item = "Hello"
    -- args.callback(args.completed_item)
-- end

-- function Source.confirm(self, context)
  -- -- to special stuff here like snippets expansion for example
-- end

-- Register your custom source.
compe.register_source('zettel', Source)
