{ pkgs, vars, ... }: {
  
  nixpkgs = {
    hostPlatform = "${vars.system}";
    config.allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
  ];
}
