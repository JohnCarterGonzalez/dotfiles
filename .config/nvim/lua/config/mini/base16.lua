require("mini.base16").setup({
	palette = {
    -- Gruvbox Hard Dark
    base00 = "#1d2021",
    base01 = "#3c3836",
    base02 = "#504945",
    base03 = "#fff9e8",
    base04 = "#bdae93",
    base05 = "#d5c4a1",
    base06 = "#ebdbb2",
    base07 = "#fbf1c7",
    base08 = "#fb4934",
    base09 = "#fe8019",
    base0A = "#fabd2f",
    base0B = "#b8bb26",
    base0C = "#8ec07c",
    base0D = "#83a598",
    base0E = "#d3869b",
    base0F = "#d65d0e",

    -- Everforest (pale green, and neutral forest colors)
		-- base00 = "#2b3339",
		-- base01 = "#323c41", -- GutterColors
		-- base02 = "#503946", --TabColors
		-- base03 = "#fff9e8", -- CommentColors
		-- base04 = "#d3c6aa",
		-- base05 = "#d3c6aa",
		-- base06 = "#e9e8d2",
		-- base07 = "#fff9e8",
		-- base08 = "#7fbbb3",
		-- base09 = "#d699b6",
		-- base0A = "#83c092",
		-- base0B = "#dbbc7f",
		-- base0C = "#e69875",
		-- base0D = "#a7c080",
		-- base0E = "#e67e80",
		-- base0F = "#d699b6",
	},
	use_cterm = true,
})
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- This is a comment
