{ config, ... }:
let 
  configDir = "${config.home.homeDirectory}/.config";
in {
  home.sessionVariables = {
     XDG_CONFIG_HOME = "${configDir}";
  };

  home.file = {
    "${configDir}/kitty/kitty.conf".source = ./files/kitty.conf;
    "${configDir}/ghostty/config".source = ./files/ghostty;
    "${configDir}/aerospace/aerospace.toml".source = ./files/aerospace.toml;
  };
}
