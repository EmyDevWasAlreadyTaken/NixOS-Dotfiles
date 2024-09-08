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
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
      hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland"; # IMPORTANT
    };
  };

  outputs = { self, nixpkgs, home-manager,  nixos-hardware, ... } @ inputs:
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
                    nixos-hardware.nixosModules.microsoft-surface-pro-intel
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
        extraSpecialArgs = { inherit inputs; }; 
        modules = [ ./home.nix ];
      };
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-desktop.nix ];
      };
    };
   
  };
}
