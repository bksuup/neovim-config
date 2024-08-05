return {
    "nvim-treesitter/nvim-treesitter",

    event = {
        "BufReadPre",
        "BufNewFile",
    },

    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "latex",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "bash",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "python",
                "toml",
                "sql",
                "yaml",
                "json",
                "lua",
                "terraform",
                "dockerfile",
                "gitignore",
                "git_config",
                "gitcommit",
                "hcl",
                "html",
                "markdown",
                "markdown_inline",
                "regex",
                "requirements",
                "sql",
                "toml",
                "csv",
                "diff",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}

