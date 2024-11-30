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

    # GUIs
    arc-browser
    discord-ptb
  ];
}

