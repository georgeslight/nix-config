{
  config,
  pkgs,
  inputs,
  ...
}:

{
  system.stateVersion = "25.05";

  wsl = {
    enable = true;
    defaultUser = "ligero";
    # Creates Windows Start Menu shortcuts for GUI applications installed in WSL.
    startMenuLaunchers = true;

    # Changes the default mount point for Windows drives from /mnt/c, /mnt/d, etc. to just /c, /d, etc.
    wslConf.automount.root = "/mnt";

    # Prevents WSL from automatically updating /etc/hosts file with Windows host information.
    wslConf.network.generateHosts = false;
  };

  # System packages for WSL
  environment.systemPackages = with pkgs; [
    curl
    wget
    git
    htop
    neofetch
    file
    unzip
  ];

  # User configuration
  users.users.ligero = {
    isNormalUser = true;
    description = "ligero";
    extraGroups = [
      "wheel"
      "docker"
    ]; # sudo + docker permissions
    shell = pkgs.zsh;
  };

  home-manager.useGlobalPkgs = true; # Makes Home Manager use the system-wide Nix packages (from environment.systemPackages) instead of managing its own separate package set.
  home-manager.useUserPackages = true; # Installs Home Manager packages to the user's profile (~/.nix-profile) instead of the system-wide Nix store.
  home-manager.users.ligero = {
    imports = [ ../home-manager/wsl-home.nix ]; # Home Manager config for WSL
    home.stateVersion = "25.05";
  };

  # Pass special args to home-manager
  home-manager.extraSpecialArgs = {
    inherit inputs;
    pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
  };

  programs.zsh.enable = true;
  time.timeZone = "Europe/Berlin";
}
