return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local tools = {
            "black",
        }

        require("mason-null-ls").setup({
            ensure_installed = tools,
            handlers = {},
        })

        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.cmake_format,
                null_ls.builtins.formatting.mdformat,
                null_ls.builtins.formatting.pyink,
            }
        })
    end
}
