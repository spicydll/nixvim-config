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
                ensureInstalled = [
                    "nix"
                    "lua"
                    "vimdoc"
                    "python"
                    "c"
                    "markdown"
                    "markdown_inline"
                    "bash"
                ];
                grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
                    nix
                    lua
                    vimdoc
                    python
                    c
                    markdown
                    markdown-inline
                    bash
                ];
                nixGrammars = true;
                nixvimInjections = true;
            };
        };
        globals.mapleader = " ";
        opts = {
            guicursor = "";

            number = true;
            relativeNumber = true;

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
    };
}
