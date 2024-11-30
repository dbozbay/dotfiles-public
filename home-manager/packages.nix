{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Utils
    kitty
    fzf
    eza
    fd
    ripgrep
    lazygit
    ghq
    yazi

    # GUIs
    arc-browser
    discord-ptb
  ];
}

