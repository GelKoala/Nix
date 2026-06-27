{ ... }:
''
  prefer-no-csd

  layer-rule {
      match namespace="^noctalia-backdrop"
      place-within-backdrop true
  }

  // Padrao geral de TODA janela: cantos, opacidade leve e blur do que estiver
  // atras. A forca do blur vem do bloco global `blur {}` em general.nix.
  window-rule {
      geometry-corner-radius 2
      clip-to-geometry true
      draw-border-with-background false
  }

  window-rule {
      match is-active=false
      opacity 0.97
      background-effect {
          blur true
      }
  }
  window-rule {
      match app-id="^kitty$"
      open-floating true
      default-floating-position x=16 y=16 relative-to="top-right"
      default-column-width { fixed 720; }
      default-window-height { fixed 480; }
      // Terminal: ve o WALLPAPER atravessando os apps atras (xray), com
      // opacidade/grao/saturacao proprios. Mantenha opacity < 1 pra "ver atraves".
      opacity 0.9
      background-effect {
          xray true
      }
  }

  window-rule {
      match app-id="^dev\\.zed\\.Zed$"
      opacity 0.97
  }

  window-rule {
      match app-id="^vesktop$"
      open-fullscreen false
      default-column-width { proportion 0.5; }
  }
''
