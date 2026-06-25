{ ... }:
{
  layout = {
    border.width = 0;
    gaps = 0;
    focus-ring.width = 0;
    default-column-width = { proportion = 0.5; };
    preset-column-widths = [
      { proportion = 0.33; }
      { proportion = 0.5; }
      { proportion = 0.66; }
    ];
    preset-window-heights = [
      { proportion = 0.5; }
      { proportion = 1.0; }
    ];

    focus-ring = {
      active.color = "#ffffff";
      inactive.color = "#919191";
      urgent.color = "#ffb4ab";
    };
    border = {
      active.color = "#ffffff";
      inactive.color = "#919191";
      urgent.color = "#ffb4ab";
    };
    shadow.color = "#00000070";
    tab-indicator = {
      active.color = "#ffffff";
      inactive.color = "#919191";
      urgent.color = "#ffb4ab";
    };
    insert-hint.display.color = "#ffffff80";
  };
}
