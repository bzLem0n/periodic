{ inputs, config, pkgs, lib, ... }: {
  imports = [ inputs.self.nixosModules.sound ];

  environment.plasma6.excludePackages = with pkgs; [
    pkgs.khelpcenter
    pkgs.elisa
    pkgs.gwenview
  ];

  environment.sessionVariables = { MOZ_USE_XINPUT2 = "1"; };

  environment.systemPackages = with pkgs; [
    #    calibre
    deluge
    miru
    neovide
    popcorntime
    tidal-hifi

    ark
    discover
    filelight
    kate
    kcalc
    kcharselect
    kcolorchooser
    konversation
    krdc
    krename
    krita
    lxqt.lximage-qt
    okular
    plasma-applet-caffeine-plus
    vlc
    xscreensaver

    libreoffice-qt
    hunspell
    hunspellDicts.en_CA
    hunspellDicts.en_CA-large

    ntfs3g

    ffmpegthumbnailer
    ffmpegthumbs
    libdbusmenu-gtk2
    libdbusmenu-gtk3
  ];

  nixpkgs.config.permittedInsecurePackages = [ "imagemagick-6.9.12-68" ];

  fonts.packages = with pkgs; [
    liberation_ttf
    (nerdfonts.override {
      fonts = [ "FiraCode" "JetBrainsMono" "LiberationMono" "OpenDyslexic" ];
    })
  ];

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable32Bit = true;
      enable = true;
    };
  };

  programs = {
    adb.enable = true;
    kdeconnect.enable = true;
    virt-manager.enable = true;

    firefox = {
      enable = true;
      languagePacks = [ "en-CA" ];
    };
  };

  services = {
    flatpak.enable = true;
    printing.enable = true;

    xserver.enable = true;
    libinput.enable = true;
    desktopManager.plasma6.enable = true;

    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmax11";
      autoLogin = {
        enable = true;
        user = "kcrook";
      };
    };
  };

  xdg = {
    menus.enable = true;
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };
}
