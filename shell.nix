{ pkgs }:

pkgs.mkShell {
    buildInputs = with pkgs; [
        # Rust
        cargo
        rustc

        # C
        clang-tools
        clangd
        gcc

        # Go
        go

        # tools
        ripgrep
        git
    ];
}
