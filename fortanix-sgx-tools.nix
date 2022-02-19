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
  pname = "fortanix-sgx-tools";
  version = "0.5.0";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-npG6s9HQuBtMRTB7f3aD1hCV9lEr5JriGsYWArg3yfA=";
  };

  cargoSha256 = "sha256-t+ASUOQZpG+O/plldyA8EcCslcRHvwPZZzyIgP2vr8g=";

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
    description = "Tools for building and running enclaves for the Fortanix SGX ABI.";
    longDescription = ''
      This contains `ftxsgx-runner` to run generic `x86_64-fortanix-unknown-sgx`
      enclaves, as well as `ftxsgx-elf2sgxs`, which is used in the build process
      for the `x86_64-fortanix-unknown-sgx` target.
    '';
    homepage = "https://github.com/fortanix/rust-sgx";
    license = with licenses; [ mpl20 ];
    maintainers = with maintainers; [ sbellem ];
  };
}
