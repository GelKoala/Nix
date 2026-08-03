{ inputs, ... }:
{
  flake.overlays.default = final: prev: {
    zen-browser = inputs.zen-browser.packages.${prev.stdenv.hostPlatform.system}.default;
    dolphin = prev.kdePackages.dolphin;
    unstable = import inputs.nixpkgs-unstable {
      system = prev.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
    qimgv = prev.qimgv.overrideAttrs (oldAttrs: {
      postPatch = (oldAttrs.postPatch or "") + ''
        substituteInPlace qimgv/main.cpp \
          --replace 'QGuiApplication::setDesktopFileName(QCoreApplication::applicationName() + ".desktop");' \
                    'QGuiApplication::setDesktopFileName(QCoreApplication::applicationName());'
      '';
    });
  };
}
