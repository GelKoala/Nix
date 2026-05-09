{ ... }: {
  flake.overlays.default = final: prev: {
    zen-browser = inputs.zen-browser.packages.${prev.system}.default;
  };
}
