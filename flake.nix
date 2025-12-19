{
  description = "fh — personal Home Manager dev scaffolder";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  {
    # export the HM module so users can import it via inputs.<your-repo>.homeManagerModules.fh
    homeManagerModules.fh = import ./modules/fh.nix;
  };
}
