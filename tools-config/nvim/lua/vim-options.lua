vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.wo.relativenumber = true

-- Pane navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Save file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })

-- Buffer navigation
vim.keymap.set("n", "<A-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<A-h>", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bb", ":b#<CR>", { desc = "Previous active buffer" })

--vim.api.nvim_create_autocmd({ "BufEnter" }, {
--pattern = {"*"},
--callback = function(e)
--print(string.format('event fired: %s', vim.inspect(e)))

--print("Event BufEnter *")
--end,
--})

-- Autocmd to set docker-compose file type
-- When starting nvim with a docker compose file open (thanks to autosession) the autocmd is called without
-- a file name, so the pattern doesn't recognize the file and the handler is not called.
-- We can simply close the buffer and reopen it to fix the issue
-- We could also listen to the BufEnter event as it called way more often
-- But I guess we don't modify docker compose that often so it should not be a real problem
vim.api.nvim_create_autocmd({
    --"BufEnter",
    "BufRead",
}, {
    pattern = { "compose.yaml", "compose.yml", "docker-compose.yaml", "docker-compose.yml" },
    callback = function(e)
        vim.bo.filetype = "yaml.docker-compose"
        print("Enter Handler with event : " .. e.event .. " file " .. e.file)
    end,
})
