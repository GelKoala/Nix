{ ... }:
{
  flake.modules.homeManager.study =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        obsidian
        unstable.zed-editor
        siyuan
        speedcrunch
        xournalpp
        unstable.anki
      ];
    };
}
