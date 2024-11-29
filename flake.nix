{
  description = "Danny Bozbay's Nix Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }: 
    let 
      #TODO: Change these!
      user = "dbozbay";
      host = "db-mbp";
      system = "x86_64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      darwinConfigurations."${host}" = nix-darwin.lib.darwinSystem rec {
	specialArgs = {
	  inherit inputs;
	  vars = { inherit user host system; };
	};

        modules = [ 
          ./darwin/darwin.nix
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.extraSpecialArgs = specialArgs;
            home-manager.users."${user}" = import ./home-manager/home.nix;
	  }
        ];
      };
    };
}
