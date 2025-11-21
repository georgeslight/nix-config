{ config, pkgs, ... }:

let
  tokyonightRofiTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/w8ste/Tokyonight-rofi-theme/main/tokyonight.rasi";
    hash = "sha256-79y6CjVObWaD3/kkrQyJOTER1WtW5C7EmbkURmGXn2g=";
  };
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "./themes/tokyonight.rasi";

    extraConfig = {
      modi = [
        "drun"
        "window"
        "run"
        "emoji:rofimoji"
      ];
      icon-theme = "Papirus-Dark";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      sidebar-mode = false;
      display-drun = "󱓞 ";
      display-run = " ";
      display-window = " ";
      display-recursivebrowser = " ";

      # adding vim keybindings
      kb-row-up = "Up,Control+k";
      kb-row-left = "Left,Control+h";
      kb-row-right = "Right,Control+l";
      kb-row-down = "Down,Control+j";

      kb-accept-entry = "Control+z,Control+y,Return,KP_Enter";

      # fixing up
      kb-remove-to-eol = "";
      kb-move-char-back = "Control+b";
      kb-remove-char-back = "BackSpace";
      kb-move-char-forward = "Control+f";
      kb-mode-complete = "Control+o";
    };
  };

  # places theme file into ./themes directory
  xdg.configFile."rofi/themes/tokyonight.rasi".source = tokyonightRofiTheme;

  home.packages = [ pkgs.rofimoji ];
}
