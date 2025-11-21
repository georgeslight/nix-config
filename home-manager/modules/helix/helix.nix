{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./config.nix
    ./languages.nix
  ];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    # package = pkgs-unstable.helix;
  };
  
  home.packages = [
    # Go
    pkgs.gopls # Language Server
    pkgs.delve # Debugger
    pkgs.gotools # Go development tools (Formatter)
    pkgs.golangci-lint # Linter (for CLI)
    # Go Templ
    pkgs.templ

    # Nix
    pkgs.nil
    pkgs.alejandra
    pkgs.nixfmt-rfc-style

    # Bash
    pkgs.bash-language-server
    # CSS ESLint HTML JSON MD
    pkgs.vscode-langservers-extracted
    # JS TS
    pkgs.typescript-language-server
    # TailwindCSS
    pkgs.tailwindcss-language-server
    # MD
    pkgs.marksman
    # Hypr
    pkgs.hyprls
    # TOML
    pkgs.taplo
    # YAML
    pkgs.yaml-language-server
    # Docker
    pkgs.docker-compose-language-service
    pkgs.dockerfile-language-server-nodejs
  ];
}
