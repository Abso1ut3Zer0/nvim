local dark_bg = "#171417"
local medium_bg = "#21232d"

-- Set the background color to be darker 
vim.api.nvim_set_hl(0, "Normal", { bg = dark_bg })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = dark_bg })
vim.api.nvim_set_hl(0, "CursorLine", { bg = medium_bg })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = medium_bg })
vim.api.nvim_set_hl(0, "SignColumn", { bg = dark_bg })

-- Telescope background colors
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = medium_bg })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = medium_bg })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = medium_bg })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = medium_bg })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = medium_bg })

-- Telescope CursorLine color
vim.api.nvim_set_hl(0, "TelescopeCursorLine", { bg = lighter_bg })

-- Identifier colors
vim.cmd('highlight Identifier ctermfg=214 guifg=#f2a1c0')
vim.cmd('highlight Function ctermfg=75 guifg=#c792ea')
vim.cmd('highlight Statement ctermfg=208 guifg=#e6d4a3')
vim.cmd('highlight Constant ctermfg=167 guifg=#8ac6f2 cterm=bold gui=bold')
vim.cmd('highlight Type ctermfg=66 guifg=#b4f9b1')

-- Highlight entire line containing TODO
vim.cmd('highlight TodoLine ctermfg=44 guifg=#00ffff ctermbg=none guibg=none cterm=bold gui=bold')
vim.cmd('call matchadd("TodoLine", "^.*\\\\(TODO\\\\|ToDo\\\\|Todo\\\\).*\\$")')

-- Highlight entire line containing a Bug comment
vim.cmd('highlight BugLine ctermfg=196 guifg=#ff0000 ctermbg=none guibg=none cterm=bold gui=bold')
vim.cmd('call matchadd("BugLine", "^.*\\\\(BUG\\\\|Bug\\\\).*\\$")')

-- Highlight entire line containing Note
vim.cmd('highlight NoteLine ctermfg=255 guifg=#ffffff ctermbg=none guibg=none cterm=bold gui=bold')
vim.cmd('call matchadd("NoteLine", "^.*\\\\(NOTE\\\\|Note\\\\).*\\$")')

