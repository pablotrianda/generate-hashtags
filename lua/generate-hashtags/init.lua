local Process = require("generate-hashtags.process")
local Config = require("generate-hashtags.config")

local M = {}

M.generate = function()
	-- Get the text from the current buffer
	local current_buffer = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(current_buffer, 0, -1, false)

	-- Generate Hashtags
	local hashtags = Process.getHastags(lines)

	-- Set on the botom file
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { hashtags })
end

M.setup = function(opts)
	Config.setup(opts)
	vim.api.nvim_create_user_command("GenerateHashtags", M.generate, {})
end

return M
