# darwin.nix

{ pkgs, ... }: 

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages =
    [ pkgs.neovim
      pkgs.arc-browser
      pkgs.kitty
    ];

    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # services.karabiner-elements.enable = true;
    # nix.package = pkgs.nix;

    # JetBrains Mono for life
    fonts.packages = [
      (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Create /etc/zshrc/ that loads the nix-darwin environment
    programs.zsh.enable = true;

    # Aliases for ALL shells
    # environment.shellAliases = 
    #   v = "nvim";
    # };
  
    # Enable touch ID for Sudo commands
    security.pam.enableSudoTouchIdAuth = true;

    # System default settings
    system.defaults = {
      dock = {
        autohide = true;
	autohide-delay = 0.0;
	autohide-time-modifier = 0.2;
	tilesize = 48;
	launchanim = false;
	static-only = false;
	showhidden = true;
	show-recents = false;
	show-process-indicators = true;
	orientation = "bottom";
	mru-spaces = false;
	persistent-apps = [
	  "/System/Applications/Safari.app"
	  "${pkgs.arc-browser}/Applications/Arc.app"
	  "${pkgs.kitty}/Applications/kitty.app"
        ];
      };
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
	AppleInterfaceStyle = "Dark";
	KeyRepeat = 2;
      };
      finder.FXPreferredViewStyle = "clmv";
      loginwindow.GuestEnabled = false;
    };

    # Set Git commit hash for darwin-version.
    # system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 5;

    # The platform the configuration will be used on.
    # TODO: Change to "aarch64-darwin" for Apple Silacon
    nixpkgs.hostPlatform = "x86_64-darwin";
    
    # TODO: Change username 
    users.users.dbozbay = {
        name = "dbozbay";
        home = "/Users/dbozbay";
    };
}
