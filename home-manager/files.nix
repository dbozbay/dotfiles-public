{ ... }: 
  let 
    home = builtins.getEnv "HOME";
    xdg_configHome = "${home}/.config";
  in
  {
     home.file = {
     "${xdg_configHome}/kitty/kitty.conf".source = ./files/kitty.conf;
     "${xdg_configHome}/ghostty/config".source = ./files/ghostty;
     };
  }
