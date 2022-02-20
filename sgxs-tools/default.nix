{ lib
, clang_11
, llvmPackages_11
, rustPlatform
, fetchCrate
, openssl
, pkg-config
, protobuf
, rust-bin
}:

rustPlatform.buildRustPackage rec {
  pname = "sgxs-tools";
  version = "0.8.5";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-zKzZOpdO3H1/4tKSdHLbyhY0iAuLoscEfgFDHsQbK3w=";
  };

  cargoSha256 = "sha256-8PxIL/ZaJIocDlYD2fTZ6M2QYkssUq1LqlEHlOUO+U8=";

  nativeBuildInputs = [
    pkg-config
    clang_11
    llvmPackages_11.libclang.lib
    protobuf
    rust-bin.nightly."2021-11-04".default
  ];

  buildInputs = [
    openssl.dev
  ];

  meta = with lib; {
    description = "Utilities for working with the SGX stream format.";
    homepage = "https://github.com/fortanix/rust-sgx";
    license = with licenses; [ mpl20 ];
    maintainers = with maintainers; [ sbellem ];
  };
}
