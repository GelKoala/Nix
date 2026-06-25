{ ... }:
{
  prefer-no-csd = true;
  layer-rules = [ {
    matches = [ { namespace = "^noctalia-backdrop"; } ];
    place-within-backdrop = true;
  } ];
  window-rules = [ {
    geometry-corner-radius = {
      top-left = 0.0;
      top-right = 0.0;
      bottom-left = 0.0;
      bottom-right = 0.0;
    };
    clip-to-geometry = true;
    draw-border-with-background = false;
  }
  {
    matches = [ { app-id = "^kitty$"; } ];
    open-floating = true;
    default-floating-position = { x = 16; y = 16; relative-to = "top-right"; };
    default-column-width = { fixed = 720; };
    default-window-height = { fixed = 480; };
  }
  {
    matches = [ { app-id = "^dev\\.zed\\.Zed$"; } ];
    opacity = 0.95;
  }
  {
    matches = [ { app-id = "^vesktop$"; } ];
    open-fullscreen = false;
    default-column-width = { proportion = 0.5; };
  }
  {
    # Janelas sem foco: vidro fosco. A opacidade deixa a janela translúcida
    # e o blur borra o que aparece atrás dela. A ativa fica 100% visível.
    matches = [ { is-active = false; } ];
    opacity = 0.9;
    background-effect = {
      blur = true;
      noise = 0.02;
    };
  }
  ];
}
