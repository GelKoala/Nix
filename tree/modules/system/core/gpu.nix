{ pkgs, ... }:

{
  # Enable early KMS (Kernel Mode Setting) for the AMD GPU
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Allow overclocking, voltage and fan control features in LACT
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];

  # Hardware graphics acceleration (OpenGL / Vulkan)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd # OpenCL support for AMD
    ];
  };

  # Force RADV as the default Vulkan driver (better gaming performance and Proton/ACO compatibility)
  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
  };

  # System packages for GPU monitoring, overclocking and control
  environment.systemPackages = with pkgs; [
    amdgpu_top   # CLI tool to monitor AMD GPU status (usage, VRAM, temps)
    radeontop    # CLI tool to monitor GPU utilization
    lact         # Linux AMDGPU Controller (GUI tool for overclocking/fan profiles)
    clinfo       # Tool to display OpenCL platform and device information
  ];

  # Enable the LACT daemon systemd service
  systemd.packages = [ pkgs.lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
