# nix-fortanix
Nix derivations for fortanix tools

## Installation
Using `nix-env`:

```shell
nix-env -iA fortanix -f https://github.com/initc3/nix-fortanix/tarball/main \
    --substituters https://initc3.cachix.org \
    --trusted-public-keys initc3.cachix.org-1:tt+5+CggCBEur43PcFgrkNxdlOFBnoB01aLe6y6yMcA=
```

Using [`niv`](https://github.com/nmattia/niv#install):


```shell
niv add initc3/nix-fortanix --name fortanix
```

Install [`cachix`](https://docs.cachix.org/installation)

```shell
nix-env -iA cachix -f https://cachix.org/api/v1/install
```

```nix
# d.nix
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
  fortanix = import sources.fortanix;
in with pkgs;
mkShell {
  buildInputs = [
    fortanix.fortanix-sgx-tools
    fortanix.sgxs-tools
    which
    unixtools.whereis
  ];
}
```

```shell
nix-shell --pure d.nix
```

```shell
[nix-shell:~/...]$ whereis sgx-detect
sgx-detect: /nix/store/x1rbxndd8chzvsnf3zp36jlmr0g5wgd4-sgxs-tools-0.8.5/bin/sgx-detect

[nix-shell:~/...]$ which sgx-detect
/nix/store/x1rbxndd8chzvsnf3zp36jlmr0g5wgd4-sgxs-tools-0.8.5/bin/sgx-detect
```

### Using with nix flakes

**`fortanix-sgx-tools`**:

```shell
 nix shell github:initc3/nix-fortanix?dir=fortanix-sgx-tools
 ```

 **`sgxs-tools`**

```shell
 nix shell github:initc3/nix-fortanix?dir=sgxs-tools
 ```

 **NOTE**: for now the `?dir=` query parameter must be passed.

 **TODO**: Improve user experience. Would be simpler to just run:

```shell
 nix shell github:initc3/fortanix-sgx-tools
 nix shell github:initc3/sgxs-tools
 ```
