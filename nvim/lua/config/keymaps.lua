local map = LazyVim.safe_keymap_set

map("n", "<C-p>", ":!~/pushdbbrowser.sh<cr><cr>")

map("n", "<leader>sn", ":Telescope live_grep search_dirs=~/.nb/home/<cr>")

map("n", "<leader>nb", ":!nb ")
map("n", "<leader>nn", ":e /home/oleenger/.nb/home/")
