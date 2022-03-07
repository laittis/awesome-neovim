local g = vim.g

g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.

require("nvim-tree").setup({
    -- disables netrw completely
    disable_netrw = true,
    -- hijack netrw window on startup
    hijack_netrw = true,
    -- open tree when running this setup function and the
    -- current buffer is a directory, is empty or is unnamed.
    open_on_setup = true,
    -- will ignore the buffer, when deciding to open the tree on setup
    ignore_buffer_on_setup = false,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup = { ".git", "node_modules", ".cache" },
    -- closes neovim automatically when the tree is the last **WINDOW** in the view
    auto_close = true,
    --  reload the explorer every time a buffer is written to
    auto_reload_on_write = true,
    -- opens the tree when changing/opening a new tab if the tree was previously opened
    open_on_tab = false,
    -- changes how files within the same directory are sorted. can be name | modification_time
    --    sort_by = "name",
    --  open in place of the unnamed buffer if it's empty.
    hijack_unnamed_buffer_when_opening = false,
    -- hijacks new directory buffers when they are opened (`:e dir`).
    hijack_directories = {
        -- enable the feature. Disable this option if you use vim-dirvish or dirbuf.nvim.
        -- If |hijack_netrw| and |disable_netrw| are `false`, this feature will be disabled.
        enable = true,
        -- opens the tree if the tree was previously closed.
        auto_open = true,
    },
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor = false,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
    update_cwd = true,
    -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
    update_focused_file = {
        -- enables the feature
        enable = true,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd = true,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = {},
    },
    -- configuration options for the system open command (`s` in the tree by default)
    system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd = nil,
        -- the command arguments as a list
        args = {},
    },
    -- git integration with icons and colors
    git = {
        -- enable / disable the feature
        enable = true,
        -- ignore files based on `.gitignore`
        ignore = true,
    },
    -- window / buffer setup
    view = {
        -- hide the path of the current working directory on top of the tree
        hide_root_folder = false,
        --  width of the window, can be either a `%` string or a number representing columns.
        --  Only works with |view.side| `left` or `right`
        width = 39,
        -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
        side = "left",
        -- preserve window proportions when opening a file.
        -- If `false`, the height and width of windows other than nvim-tree will be equalized.
        preserve_window_proportions = true,
        -- print the line number in front of each line.
        number = false,
        -- show the line number relative to the line with the cursor in front of each line.
        -- If the option `view.number` is also `true`, the number on the cursor line will be the line number instead of `0`.
        relativenumber = false,
        -- if true the tree will resize itself after opening a file
        auto_resize = false,
        mappings = {
            -- custom only false will merge the list with the default mappings
            -- if true, it will only use your list to set the mappings
            custom_only = false,
            -- list of mappings to set on the tree manually
            list = {
                {
                    key = { "<CR>", "o", "<2-LeftMouse>" },
                    action = "edit",
                },
                {
                    key = "<C-e>",
                    action = "edit_in_place",
                },
                {
                    key = { "O" },
                    action = "edit_no_picker",
                },
                { key = "<2-RightMouse>", action = "cd" },
                { key = "<C-v>", action = "vsplit" },
                { key = "<C-x>", action = "split" },
                { key = "<C-t>", action = "tabnew" },
                { key = "<", action = "prev_sibling" },
                { key = ">", action = "next_sibling" },
                { key = "P", action = "parent_node" },
                { key = "<BS>", action = "close_node" },
                { key = "<Tab>", action = "preview" },
                { key = "K", action = "first_sibling" },
                { key = "J", action = "last_sibling" },
                { key = "I", action = "toggle_ignored" },
                { key = "H", action = "toggle_dotfiles" },
                { key = "R", action = "refresh" },
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "r", action = "rename" },
                { key = "<C-r>", action = "full_rename" },
                { key = "x", action = "cut" },
                { key = "c", action = "copy" },
                { key = "p", action = "paste" },
                { key = "y", action = "copy_name" },
                { key = "Y", action = "copy_path" },
                { key = "gy", action = "copy_absolute_path" },
                { key = "[c", action = "prev_git_item" },
                { key = "]c", action = "next_git_item" },
                { key = "-", action = "dir_up" },
                { key = "s", action = "system_open" },
                { key = "q", action = "close" },
                { key = "g?", action = "toggle_help" },
                {
                    key = "W",
                    action = "collapse_all",
                },
                {
                    key = "S",
                    action = "search_node",
                },
                {
                    key = "<C-k>",
                    action = "toggle_file_info",
                },
                {
                    key = ".",
                    action = "run_file_command",
                },
            },
        },
        filters = {
            -- show `dotfiles` (files starting with a `.`)
            dotfiles = false,
            -- custom list of string that will not be shown.
            custom = {},
            -- list of directories or files to exclude from filtering
            exclude = {},
        },
        -- hijacks new directory buffers when they are opened.
        update_to_buf_dir = {
            -- enable the feature
            enable = true,
            -- allow to open the tree if it was previously closed
            auto_open = true,
        },
        -- configuration for various actions
        actions = {
            change_dir = {
                -- change the working directory when changing directories in the tree.
                enable = true,
                -- use `:cd` instead of `:lcd` when changing directories. Consider that this might cause issues with the update_cwd options.
                global = false,
            },
            open_file = {
                -- closes the explorer when opening a file. It will also disable preventing a buffer overriding the tree.
                quit_on_open = true,
                -- resizes the tree when opening a file
                resize_window = false,
                -- window picker configuration
                window_picker = {
                    -- Enable the feature. If the feature is not enabled, files will open in window from which you last opened the tree.
                    enable = true,
                    -- A string of chars used as identifiers by the window picker.
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    -- Table of buffer option names mapped to a list of option values that indicates to the picker that the buffer's window should not be selectable.
                    exclude = {
                        filetype = {
                            "notify",
                            "packer",
                            "qf",
                            "diff",
                            "fugitive",
                            "fugitiveblame",
                        },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
        },
    },
})
