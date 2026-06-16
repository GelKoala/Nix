{ ... }:
{
  input = {
    keyboard = {
      xkb.layout = "br";
      numlock = true;
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

  outputs."DP-1".mode = {
    width = 2560;
    height = 1080;
    refresh = 74.991;
  };
}
