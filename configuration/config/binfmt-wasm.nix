{ pkgs, ... }:

{
  # Run WASM binaries natively!
  boot.binfmt.registrations.WebAssembly = {
    # TODO: Write nice wrapper script preserving arguments.
    # What capabilities should be given to WASM guest?
    # How should those capabilities be configured?
    # - Environment variables?
    # - Store capabilities we should give in an xattr?
    interpreter = "${pkgs.wasmtime}/bin/wasmtime";
    wrapInterpreterInShell = false;

    # Recognition based on file extension is way too fragile, recognise magic bytes instead.
    recognitionType = "magic";
    magicOrExtension = "\\x00asm";

    # Set to true if you want to be able to run a WASM setuid binary and you also trust your WASM runtime
    matchCredentials = false;
  };
}
