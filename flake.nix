{
  description = "Home Manager configuration of ligero";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix/master"; # helix editor, master branch
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/release-25.05";
    };
    hyprdynamicmonitors.url = "github:fiffeek/hyprdynamicmonitors";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixos-wsl,
      hyprdynamicmonitors,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # Home Manager
      homeConfigurations."ligero" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs pkgs-unstable system;
        };
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          inputs.hyprdynamicmonitors.homeManagerModules.default
          ./home-manager/home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

      # NixOS-WSL
      nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
        };
        modules = [
          nixos-wsl.nixosModules.wsl
          home-manager.nixosModules.home-manager
          ./hosts/wsl.nix
        ];
      };
    };
}
