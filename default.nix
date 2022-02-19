let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {
    overlays = [ (import sources.rust-overlay) ];
  };
  
  fortanix = with pkgs; {
    fortanix-sgx-tools = callPackage ./fortanix-sgx-tools.nix { };
    sgxs-tools = callPackage ./sgxs-tools.nix { };
  };
in fortanix
