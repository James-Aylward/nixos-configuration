{
  description = "James Aylward's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # The ... @ inputs will collapse all inputs into a var
  # We can still reference directly if we want, just specify inside { }
  outputs = { nixpkgs, stylix, home-manager, ... }@inputs: {

    # Flakes can have many different types of outupt
    # Here we are concerned with nixosConfigurations
    # This is what is used for building systems

    # renixsafe
    nixosConfigurations.renixsafe = nixpkgs.lib.nixosSystem {
      # Special args will be accessible by all submodules
      # 'inherit' is a shorthand for 'inputs = inputs;'
      # aka passing it through with the same name
      specialArgs = { inherit inputs; };
      modules = [
        stylix.nixosModules.stylix
        ./hosts/renix-server/configuration.nix
        home-manager.nixosModules.default
      ];
    };

  };
}
