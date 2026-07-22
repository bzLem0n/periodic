{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor = {
        bufferline = "multiple";
        cursorline = true;
        line-number = "relative";
        rulers = [ 120 ];
        true-color = true;
        completion-replace = true;
        trim-trailing-whitespace = true;
        end-of-line-diagnostics = "hint";
        color-modes = true;
        soft-wrap.enable = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        indent-guides = {
          character = "╎";
          render = true;
        };
        lsp = {
          auto-signature-help = false;
          display-messages = true;
        };
        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
            "spacer"
            "separator"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          center = [ ];
          right = [
            "diagnostics"
            "workspace-diagnostics"
            "position"
            "total-line-numbers"
            "position-percentage"
            "file-encoding"
            "file-line-ending"
            "file-type"
            "register"
            "selections"
          ];
        };
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rs;
      }
    ];
  };
}
