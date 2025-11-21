{
  config,
  pkgs,
  pkgs-unstage,
  inputs,
  ...
}:

{
  imports = [
    ./app/helix/helix.nix
    ./app/yazi.nix
  ];

  home.username = "ligero";
  home.homeDirectory = "/home/ligero";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    lazygit
    lazydocker
    fzf
    bat
    eza
    zoxide
    fd
    ripgrep
    k9s
    ncspot
    qemu
    kubectl
    lsof
    tmux
    glow
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };

  programs.home-manager.enable = true;
}
