-- Telescope stuff
local telescope = require("telescope")
local action_state = require("telescope.actions.state") -- runtime plugin
telescope.setup({
	defaults = {
		prompt_prefix = " > ",
		mappings = {
			i = {
				["<c-d>"] = function()
					print(vim.inspect(action_state.get_selected_entry()))
				end, -- Example remap function
			},
		},
	},
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }
    }
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("ui-select")

-- custom funtion example
local mappings = {}

mappings.curr_buf = function()
	local opt = require("telescope.themes").get_dropdown({ height = 10, previewer = false })
	require("telescope.builtin").current_buffer_fuzzy_find(opt)
end

return mappings
