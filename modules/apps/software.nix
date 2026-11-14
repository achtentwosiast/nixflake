{ inputs, pkgs, settings, ... }: let
    # Bring in the unstable channel
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
  # This line says what packages your user should have
  # installed, they aren't shared with root or other users
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [
    # Use the prefix 'unstable.' for unstable packages
    firefox
    vesktop
    fuzzel
    alacritty
    steam
    strawberry
    lutris
    nicotine-plus
    blueman
    pwvucontrol
    awww
  ];
  # Check https://search.nixos.org/packages to see which packages are available
}
