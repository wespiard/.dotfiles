local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

local ft = require('Comment.ft')

-- Set VHDL comment (by default, line comment was wrong)
ft.set('vhdl', {'--%s', '/*%s*/'})

comment.setup{}
