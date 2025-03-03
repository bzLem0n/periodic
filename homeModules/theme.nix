{ inputs, ... }: {
  stylix = {
    enable = true;
    image = ../media/wallpaper.png;
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

      monospace.package = pkgs.fira-code-nerdfont;
      monospace.name = "Fira Code Nerd Font Mono";
    };
    targets.kde.useWallpaper = false;
  };
}
