{ ... }:
{
  #--------INPUTS--------#
  input = {
    keyboard = {
      xkb.layout = "br";
      numlock = _: {};
      repeat-delay = 600;
      repeat-rate = 25;
      track-layout = "global";
    };
    mouse = {
      accel-speed = 0.0;
      accel-profile = "flat";
    };
    tablet = {
      map-to-output = "DP-1";
    };
  };
  #--------OUTPUTS--------#
  outputs = {
    "DP-1" = { mode = "2560x1080@74.991"; };

  };
}
