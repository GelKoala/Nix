{ lib }:
{
  enableAll = names:
    lib.genAttrs names (_: {
      enable = true;
    });
}
