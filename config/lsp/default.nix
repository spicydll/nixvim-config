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
                    nil-ls.enable = true;
                    lua-ls.enable = true;
                    pylsp.enable = true;               
                    clangd.enable = true;
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
