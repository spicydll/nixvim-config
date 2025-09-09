{ pkgs, ... }:
{
    imports = [ ./lsp ];
    config = {
        colorschemes.gruvbox = {
            enable = true;
        };
        luaLoader.enable = true;
        plugins = {
            treesitter = {
                enable = true;
                settings = {
                    ensure_installed = [
                        "nix"
                        "lua"
                        "vimdoc"
                        "python"
                        "c"
                        "markdown"
                        "markdown_inline"
                        "bash"
                        "zig"
                    ];
                    highlight = {
                        enable = true;
                        additional_vim_regex_highlighting = false;
                    };
                };
                grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
                    nix
                    lua
                    vimdoc
                    python
                    c
                    markdown
                    markdown-inline
                    bash
                    zig
                ];
                nixGrammars = true;
                nixvimInjections = true;
            };
        };
        globals.mapleader = " ";
        opts = {
            guicursor = "";

            number = true;
            relativenumber = true;

            tabstop = 4;
            softtabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            
            smartindent = true;
            wrap = false;

            swapfile = false;
            backup = false;
            undofile = true;

            hlsearch = false;
            incsearch = true;

            termguicolors = true;

            scrolloff = 8;
            signcolumn = "yes";
            
            updatetime = 50;

            colorcolumn = "80";
        };
        keymaps = [
            {
                key = "<leader>pv";
                mode = [ "n" ];
                action = "<Cmd>Ex<CR>";
                options = {
                    desc = "[p]roject [v]iew";
                };
            } 
            {
                key = "<leader>y";
                mode = [ "n" "v" ];
                action = "\"+y";
                options = {
                    desc = "[y]ank to clipboard";
                };
            } 
            {
                key = "<leader>p";
                mode = [ "n" "v" ];
                action = "\"+p";
                options = {
                    desc = "[p]aste from clipboard";
                };
            } 
            {
                key = "<leader>P";
                mode = [ "n" "v" ];
                action = "\"+P";
                options = {
                    desc = "[P]aste from clipboard";
                };
            } 
        ];
    };
}
