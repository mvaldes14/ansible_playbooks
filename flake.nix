{
  description = "Tools for Ansible";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { nixpkgs, self }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      molecule-docker = pkgs.stdenv.mkDerivation
        rec {
          pname = "molecule-plugins[docker]";
          version = "23.5.3";
          src = pkgs.fetchFromGitHub {
            owner = "ansible-community";
            repo = "molecule-plugins";
            rev = "v${version}";
            sha256 = "sha256-v0yj2RztsRoWIUw8FYLuMMZihY3R9eJrA8ikQpEpwJ0=";
          };
          buildInputs = [ pkgs.python3 ];
        };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs;
          [
            ansible
            ansible-lint
            molecule
            molecule-docker
            python311Packages.kubernetes
            python311Packages.pip
          ];
      };
    };
}

