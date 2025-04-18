{
  description = "Simple python uv flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          python313
          uv
          # gnumake
          # mininet
          # thrift
          # p4c
          # p4-utils
        ];
      };
    };
}
 