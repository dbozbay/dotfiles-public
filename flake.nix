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

    # nix-homebrew = {
    #   url = "github:zhaofengli-wip/nix-homebrew";
    # };

  };

  outputs = inputs@{ 
    self, 
    nix-darwin, 
    nixpkgs, 
    home-manager, 
    # nix-homebrew, 
    ... 
  }: 
  let 
    username = "dbozbay";
    useremail = "dannybozbay@gmail.com";
    hostname = "db-mbp";
    system = "x86_64-darwin";

    specialArgs = {
      inputs = inputs;
      vars = { inherit username useremail hostname system; };
    };
  in {
    darwinConfigurations = {
      "${hostname}" = nix-darwin.lib.darwinSystem {
          inherit system specialArgs;
          modules = [ 
            ./darwin/darwin.nix
	  
            home-manager.darwinModules.home-manager 
	    {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
	      home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = import ./home-manager/home.nix;
	    }

		#    nix-homebrew.darwinModules.nix-homebrew {
		#      nix-homebrew = {
		#        enable = true;
		#        user = "${username}";
		# autoMigrate = true;
		#      };
		#    }
	        ];
        };
      };
    };
}

