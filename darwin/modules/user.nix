{ pkgs, vars, ... }: {

  programs.zsh.enable = true;

  users.users.${vars.user} = {
    name = "${vars.user}";
    home = "/Users/${vars.user}";
    createHome = true;
    shell = pkgs.zsh;
  };
}

