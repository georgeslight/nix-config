{ config, pkfs, ... }:

{
  programs.helix = {
    settings = {
      theme = "tokyonight";

      keys.normal = {
        # Lazygit
        "C-g" = [
          ":new"
          ":insert-output lazygit"
          ":buffer-close!"
          ":redraw"
          ":rla"
        ];
        # Yazi
        "C-y" = [
          ":sh rm -f /tmp/unique-file"
          ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
          '':insert-output echo "\x1b[?1049h\x1b[?2004h" > /dev/tty''
          ":open %sh{cat /tmp/unique-file}"
          ":redraw"
          ":set mouse false"
          ":set mouse true"
        ];

      };

      editor = {
        lsp.display-inlay-hints = true;
        line-number = "relative";
        cursorline = true;
        mouse = false;
        color-modes = true;
      };

      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      editor.inline-diagnostics = {
        cursor-line = "hint";
      };

      keys.insert = {
        j.k = "normal_mode";
      };

      keys.normal.space = {
        o = "file_picker_in_current_buffer_directory";
      };
    };
  };
}
