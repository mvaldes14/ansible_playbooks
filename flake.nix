{
  description = "Tools for Ansible";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { nixpkgs, self }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          ansible
          ansible-lint
          molecule
          python311Packages.kubernetes
          python311Packages.pip
        ];
      };
    };
}

