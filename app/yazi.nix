{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

let
  tokyonightRepo = pkgs.fetchFromGitHub {
    owner = "mingo99";
    repo = "tokyonight.yazi";
    rev = "main";
    hash = "sha256-aTB4hh/aRb06wzD9C4rD9tahZo9kjkHwR25e8XcZixo=";
  };
in
{
  programs.yazi = {
    enable = true;
    package = pkgs-unstable.yazi;

    settings = {
      theme = {
        flavor.dark = "tokyonight";
      };
    };
    # This will copy the entire repo to yazi/flavors/tokyonight.yazi
    flavors.tokyonight = tokyonightRepo;

    # Set hx ad the default editor
    settings.opener = {
      edit = [
        { run = "hx \"$@\""; desc = "hx"; block = true; for = "unix"; }
        { run = "$EDITOR \"$@\""; desc = "$EDITOR"; block = true; for = "unix"; }
      ];
    };
  };
}
