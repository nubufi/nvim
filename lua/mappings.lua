require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Save file
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- Open file menu
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>fs', ':Telescope live_grep<CR>', opts)

map('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<leader>k', '<cmd>Lspsage hover_doc<CR>', opts)

-- Toggle NvimTree
map('n', '<leader>s', ':NvimTreeToggle<CR>', opts)

-- Tab navigation
map('n', '<M-t>', ':tabnew<CR>', opts)
map('n', '<M-Right>', ':tabnext<CR>', opts)
map('n', '<M-Left>', ':tabprevious<CR>', opts)
map('n', '<M-d>', ':tabclose<CR>', opts)

-- Split windows
map('n','<leader>vs',':vsplit<CR>',opts)
map('n','<leader>hs',':split<CR>',opts)

-- Duplicate line
map('n', '<C-c>', ':t.<CR>', opts)
map('i', '<C-c>', '<Esc>:t.<CR>', opts)

-- Move line
map('n', '<M-Up>', ':m .-2<CR>==', opts)
map('i', '<M-Up>', '<Esc>:m .-2<CR>==ga', opts)

map('n', '<M-Down>', ':m .+1<CR>==', opts)
map('i', '<M-Down>', '<Esc>:m .+1<CR>==gi', opts)

map('n', '<leader>gg', ':LazyGit<CR>', opts)

-- ####### Hover #######
map("n", "K", require("hover").hover, {desc = "hover.nvim"})
map("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
map("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
map("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})
