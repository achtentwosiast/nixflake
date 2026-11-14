{ pkgs, ... }: {
  imports = [
    # Import any modules or take them out
    ../../modules/desktop/gnome.nix
    ../../modules/apps/software.nix
    ../../modules/commands/software.nix
    ../../modules/commands/shell.nix
  ];
   hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation (final: {
      name = "brcm-firmware";
      src = ./firmware/brcm;
      installPhase = ''
        mkdir -p $out/lib/firmware/brcm
        cp ${final.src}/* "$out/lib/firmware/brcm"
      '';
    }))
  ];
  # One line to change the kernel, comment out to use LTS
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ ];
  boot.blacklistedKernelModules = [ ];
}
