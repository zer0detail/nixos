{
  description = "Zero's NixOS Flake";
  nixConfig = {
    experimental-features = [ "nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org/"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    # official NixOS Package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix/23.05";
  };
  outputs = { self, nixpkgs, home-manager, ...}@inputs: {
    nixosConfigurations = {
      "zerix" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./configuration.nix

          ## Make home-manager a module of nixos
          ## so that home-manager config will be auto deployed with
          ## nixos-rebuild switch
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.zero = import ./home.nix;
            # optionally, use home-manager.extraSpecialArgs to pass args to home.nix
          }
        ];
      };
    };
  };
}
