local M = {}

M.options = {
	notAllowedWords = {}
}

function M.setup(opts)
	if not (opts == nil) then
		M.options = opts
	end
end

return M
