{
    description = "spicydll's neovim config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        nixvim.url = "github:nix-community/nixvim/nixos-25.05";
        flake-utils.url = "github:numtide/flake-utils";
    };
    outputs = inputs@{ ... }:

    inputs.flake-utils.lib.eachDefaultSystem (system: 
    let
        module = { imports = [ ./config ]; };
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        nixvim' = inputs.nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule { inherit module pkgs; };
    in rec {
        packages = {
            inherit nvim;
            default = nvim;
        };
        devShells.default = pkgs.mkShell {
            inherit packages;
            buildInputs = [ packages.nvim ];
        };
        overlays = final: prev: {
            inherit (packages) nvim;
        };
    });
}
