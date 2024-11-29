{ pkgs, vars, ... }: {

  programs.zsh.enable = true;

  users.users.${vars.username} = {
    name = "${vars.username}";
    home = "/Users/${vars.username}";
    createHome = true;
    shell = pkgs.zsh;
  };
}

