{ config, ... }:
{
  flake.modules = {
    nixos.workstation.imports = with config.flake.modules.nixos; [
      core
      hardware
      storage
      environment
      niri
      appearance
      containers
      hermes
      opencode
      gaming
    ];

    homeManager.workstation.imports = with config.flake.modules.homeManager; [
      core
      environment
      niri
      daily-apps
      defaults
      tools
      containers
      study
      media
    ];
  };
}
