{
    description = "spicydll's neovim config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        nixvim.url = "github:nix-community/nixvim/nixos-25.05";
        flake-utils.url = "github:numtide/flake-utils";
    };
    outputs = inputs@{ self, nixpkgs, nixvim, flake-utils, ... }:

    inputs.flake-utils.lib.eachDefaultSystem (system: 
    let
        nixvimLib = nixvim.lib.${system};
        module = { imports = [ ./config ]; };
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        nixvim' = inputs.nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule { inherit module pkgs; };
    in {
        checks = {
            default = nixvimLib.check.mkTestDerivationFromNvim {
                inherit nvim;
                name = "spicydll's nixvim config";
            };
        };
        packages = {
            default = nvim;
        };
        devShells.default = import ./shell.nix { inherit pkgs; };
    });
}
