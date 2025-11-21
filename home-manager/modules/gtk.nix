{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      # gtk-theme = "Tokyonight-Dark";
      gtk-theme = "adw-gtk3-dark";
    };
  };

  gtk = {
    enable = true;
    font = {
      # package = pkgs.nerd-fonts.jetbrains-mono;
      name = "Noto Sans";
      size = 10;
    };
    theme = {
      # package = pkgs.tokyonight-gtk-theme;
      # name = "Tokyonight-Dark";
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
    cursorTheme = {
      package = pkgs.catppuccin-cursors;
      name = "Catppuccin-Mocha-Dark-Cursors";
      size = 24;
    };
    iconTheme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-cursor-blink = true;
      gtk-cursor-blink-time = 1000;
      gtk-decoration-layout = ":minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-primary-button-warps-slider = true;
      gtk-sound-theme-name = "freedesktop";
      gtk-xft-dpi = 98304;
    };
    
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-cursor-blink = true;
      gtk-cursor-blink-time = 1000;
      gtk-decoration-layout = ":minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-primary-button-warps-slider = true;
      gtk-sound-theme-name = "freedesktop";
      gtk-xft-dpi = 98304;
      gtk-menu-images = true;
      gtk-modules = "colorreload-gtk-module:window-decorations-gtk-module";
      gtk-toolbar-style = 3;
    };
  };
  # home.sessionVariables.GTK_THEME = "Tokyonight-Dark";
  home.sessionVariables.GTK_THEME = "adw-gtk3-dark";
}
