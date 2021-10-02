require'nvim-treesitter.configs'.setup {
    ensure_installed = "all";
    
    --highlight = {
    --    enable = true,
    --    custom_captures = {
    --        -- ["<capture_group>"] = "<hightlight group>",
    --        ["keyword"] = "TSString",
    --    },
    --};

    --incremental_selection = {
    --    enable = true,
        -- keymaps = {
        --     init_selection="gnn",
        --     node_incremental = "grn",
        --     scope_incremental = "grc",
        --     node_decremental = "grm",
        -- },
    --},

    --indent = {
    --    enable = true,
    --}
}

vim.api.nvim_exec([[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
]], true)
