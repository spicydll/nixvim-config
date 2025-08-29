{ pkgs, helpers, ... }:
let 
    severityPrefix = "vim.diagnostic.severity.";
    mkSeverity = severity: "[${severityPrefix}${severity}]";
in
{
    config = {
        plugins = {
            luasnip.enable = true;
            lsp = {
                enable = true;
                servers = {
                    nil_ls.enable = true;
                    lua_ls.enable = true;
                    pylsp.enable = true;               
                    clangd.enable = true;
                };
            };
            cmp = {
                enable = true;
                autoEnableSources = true;
                settings = {
                    sources = [
                        { name = "nvim_lsp"; }
                        { name = "buffer"; }
                        { name = "path"; }
                        { name = "nvim_lua"; }
                    ];
                    mapping = {
                        "<CR>" = "cmp.mapping.confirm({ select = true })";
                        "<down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                        "<up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                    }; 
                };
            };
        };

        keymaps = [
            {
                key = "gd";
                mode = [ "n" ];
                action = "<Cmd>lua vim.lsp.buf.definition()<CR>";
                options = {
                    desc = "[g]oto [d]efinition";
                    remap = false;
                };
            }
            {
                key = "gD";
                mode = [ "n" ];
                action = "<Cmd>lua vim.lsp.buf.declaration()<CR>";
                options = {
                    desc = "[g]oto [D]eclaration";
                    remap = false;
                };
            }
            {
                key = "gi";
                mode = [ "n" ];
                action = "<Cmd>lua vim.lsp.buf.implementation()<CR>";
                options = {
                    desc = "[g]oto [i]mplementation";
                    remap = false;
                };
            }
            {
                key = "<C-h>";
                mode = [ "i" ];
                action = "<Cmd>lua vim.lsp.buf.signature_help()<CR>";
                options = {
                    desc = "Signature Help";
                    remap = false;
                };
            }
        ];

        diagnostic.settings = {
            virtual_text = true;
            signs = {
                active = true;
                text = {
                    "${mkSeverity "ERROR"}" = "E";
                    "${mkSeverity "WARN"}" = "W";
                    "${mkSeverity "HINT"}" = "H";
                    "${mkSeverity "INFO"}" = "I";
                };
            };
        };
    };
}
