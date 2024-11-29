{ pkgs, ... }: {

  imports = [
    ./packages.nix
    ./modules/bundle.nix
    ../homebrew/homebrew.nix
  ];
   
   # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
   
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Used for backwards compatibility, please read the changelog before changing: `darwin-rebuild changelog`
  system.stateVersion = 5;

  time.timeZone = "Europe/London";

}
