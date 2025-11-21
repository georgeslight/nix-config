{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;

    # dunstrc
    settings = {
      global = {
        # Display & Monitor
        monitor = 1; # was 0
        follow = "none";

        # Geometry
        width = "(300, 400)"; # was "300"
        height = "(0, 300)";
        origin = "top-right";
        offset = "(50, 50)"; # was "(10, 50)"
        scale = 0;
        notification_limit = 20;

        # Progress Bar
        progress_bar = true;
        progress_bar_height = 20; # was 10
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 6; # was 0
        progress_bar_corners = "all";

        # Icons
        icon_corner_radius = 0;
        icon_corners = "all";
        enable_recursive_icon_lookup = true;
        icon_theme = "Adwaita";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 50; # was 128

        # Appearance
        indicate_hidden = "yes";
        transparency = 20; # was 0
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 3;
        frame_color = "#7aa2f7"; # was "#aaaaaa"
        gap_size = 0;
        separator_color = "frame";
        highlight = "#7aa2f7";
        sort = "yes";
        corner_radius = 6; # was 0
        corners = "all";

        # Text
        font = "Monospace 12"; # was "Monospace 8"
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";

        # Behavior
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        sticky_history = "yes";
        history_length = 20;
        always_run_script = true;
        ignore_dbusclose = false;

        # Applications
        dmenu = "/usr/bin/dmenu -p dunst:";
        browser = "/usr/bin/xdg-open";
        title = "Dunst";
        class = "Dunst";

        # Wayland/X11
        force_xwayland = false;
        force_xinerama = false;

        # Mouse
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };

      urgency_low = {
        background = "#24283b"; # was "#222222"
        foreground = "#C5C8C6"; # was "#888888"
        timeout = 10;
        default_icon = "dialog-information";
      };

      urgency_normal = {
        background = "#24283b"; # was "#285577"
        foreground = "#C5C8C6"; # was "#ffffff"
        timeout = 10;
        override_pause_level = 30;
        default_icon = "dialog-information";
      };

      urgency_critical = {
        background = "#24283b"; # was "#900000"
        foreground = "#C5C8C6"; # was "#ffffff"
        frame_color = "#9274ca"; # was "#ff0000"
        timeout = 0;
        override_pause_level = 60;
        default_icon = "dialog-warning";
      };

      experimental = {
        per_monitor_dpi = false;
      };
    };
  };
}
