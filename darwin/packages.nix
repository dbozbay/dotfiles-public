{ pkgs, ... }: {
  
  environment.systemPackages = with pkgs; [
    nh
    nvd
  ];
}
