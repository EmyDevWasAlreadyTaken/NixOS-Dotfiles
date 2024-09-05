{
  description = "My first flake!";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #hyprland.url = "git+https://github.com/hyprw/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      laptop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; # hyprland stuff?
        modules = [ ./configuration.nix
		    ./hardware-configuration.nix
		    ];

      };
      desktop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; # hyprland stuff?
        modules = [ ./configuration-desktop.nix
		    ./hardware-configuration-desktop1.nix
		    ];

      };
    };
    homeConfigurations = {
      laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-desktop.nix ];
      };
    };
   
  };
}
