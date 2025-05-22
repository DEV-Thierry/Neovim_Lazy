return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod", lazy = true },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        vim.g.dbs = {
            dev = "sqlserver://CapriDev:@Capri@@191.232.245.55/Capri_GestaoAssociacao?encrypt=true&trustServerCertificate=true",
        }

        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
    end,
}
