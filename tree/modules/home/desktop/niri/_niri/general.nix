{ config, lib, pkgs, ... }:
''
  xwayland-satellite {
      path "${lib.getExe pkgs.xwayland-satellite}"
  }
  spawn-at-startup "${lib.getExe config.programs.noctalia.package}"
  // spawn-at-startup "${lib.getExe pkgs.vesktop}"
  // spawn-at-startup "${lib.getExe pkgs.swaybg}" "-i" "/storage/Media/sky.jpg" "-m" "fill"

  // Kernel de blur GLOBAL: vale pra todo blur do compositor.
  // passes/offset = forca do blur (so existem aqui, nao da pra variar por janela).
  // noise/saturation aqui sao os PADROES; window-rules podem sobrescrever.
  blur {
      on
      offset 3
      noise 0.05
      saturation 1.0
  }
''
