{ pkgs, ... }: {

  imports = [
    ./packages.nix
    ./modules/default.nix
    ../homebrew/homebrew.nix
  ];
   
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 30";
  };
  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;
  
  time.timeZone = "Europe/London";

  system.stateVersion = 5;

}
