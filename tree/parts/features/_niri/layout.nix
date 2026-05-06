{ ... }:
{
  layout = {
    #-------Border--------#
    border.width = 1;
    gaps = 1;
    focus-ring.width = 1;
    #-------Column Widths--------#
    default-column-width = { proportion = 0.5; };
    preset-column-widths = [
      { proportion = 0.33; }
      { proportion = 0.5; }
      { proportion = 0.66; }
    ];
    #-------Colors--------#
    focus-ring = {
      active-color = "#ffffff";
      inactive-color = "#919191";
      urgent-color = "#ffb4ab";
    };
    border = {
      active-color = "#ffffff";
      inactive-color = "#919191";
      urgent-color = "#ffb4ab";
    };
    shadow.color = "#00000070";
    tab-indicator = {
      active-color = "#ffffff";
      inactive-color = "#919191";
      urgent-color = "#ffb4ab";
    };
    insert-hint.color = "#ffffff80";
  };
}
