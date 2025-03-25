vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }

local function opt(descr)
	return { noremap = true, silent = true, desc = descr }
end

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>k", ":Bdelete!<CR>", opt("Close Buffer")) -- close buffer
vim.keymap.set("n", "<leader>K", ":%bd|e#|bd#<cr>|'\"", opt("Close All Buffers"))
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opt("Create new Buffer")) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", opt("Split vertically")) -- split window vertically
vim.keymap.set("n", "<leader>wh", "<C-w>s", opt("Split horizontally")) -- split window horizontally
vim.keymap.set("n", "<leader>wk", ":close<CR>", opt("Close Current Split Window")) -- close current split window
vim.keymap.set("n", "<leader>ws", "<C-w>=", opt("Split Windows Equal Size")) -- make split windows equal width & height

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opt("Split - Move Up"))
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opt("Split - Move Down"))
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opt("Split - Move Left"))
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opt("Split - Move Right"))

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opt("Tab - Open New")) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opt("Tab - Close Current")) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opt("Tab - Go Next ")) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opt("Tab - Go Prev")) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opt("Toggle Line Wrapping"))

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", opt("Replace word under cursor"))

-- Explicitly yank to system clipboard (highlighted and entire row)
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
-- vim.keymap.set("n", "<leader>ss", ":mksession! .session.vim<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>sl", ":source .session.vim<CR>", { noremap = true, silent = false })
