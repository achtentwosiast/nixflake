{ pkgs, config, ... }: {
  imports = [
    # Import any modules or take them out
    ../../modules/desktop/niri.nix
    ../../modules/apps/software.nix
    ../../modules/commands/software.nix
    ../../modules/commands/shell.nix
  ];
  # One line to change the kernel, comment out to use LTS
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.blacklistedKernelModules = [ "nouveau" ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    hardware.nvidia = {
   open = false;
   videoAcceleration = true;
   modesetting.enable = true;
  };
      boot.kernelParams = [
        "nvidia_drm"
        "nvidia_modeset"
        "nvidia_uvm"
        "nvidia-drm.fbdev=1"
        "nvidia"
      ];
    services.xserver.videoDrivers = [ "nvidia" ];
}
