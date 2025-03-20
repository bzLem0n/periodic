{ inputs, config, pkgs, lib, ... }: {
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/o5/wallhaven-o5ky29.png";
      hash = "sha256-M4Q5/Sm5ZVOe324V9pEF9497M0VpcQMPTJHOwW2ZQmg=";
    };
    base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-black.yaml";
    cursor = {
      package = pkgs.kdePackages.breeze;
      name = "Breeze Light";
      size = 32;
    };
    fonts = {
      serif.package = pkgs.liberation_ttf;
      serif.name = "Liberation Serif";

      sansSerif.package = pkgs.liberation_ttf;
      sansSerif.name = "Liberation Sans";

      monospace.package = pkgs.nerd-fonts.fira-code;
      monospace.name = "Fira Code Nerd Font Mono";
    };
    homeManagerIntegration.autoImport = false;
  };
}
