{ config, pkgs, ... }:

{
  programs.helix = {
    languages = {
      # Go
      language = [
        {
          name = "go";
          language-id = "go";
          scope = "source.go";
          injection-regex = "go";
          file-types = [ "go" ];
          roots = [
            "go.work"
            "go.mod"
          ];
          auto-format = true;
          comment-token = "//";
          block-comment-tokens = {
            start = "/*";
            end = "*/";
          };
          indent = {
            tab-width = 4;
            unit = "\t";
          };
          language-servers = [ "gopls" ];
          formatter.command = "goimports";  # The LSP formatter (gofmt) does not fix imports, goimports should be used instead
        }
      ];
    };
  };
}
