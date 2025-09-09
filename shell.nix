{ pkgs }:

pkgs.mkShell {
    buildInputs = with pkgs; [
        # Rust
        cargo
        rustc

        # C
        clang-tools
        clang
        gcc

        # Go
        go

        # Zig
        zig

        # tools
        ripgrep
        git
    ];
}
