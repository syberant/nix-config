{ pkgs, ... }:

{
  # Run WASM binaries natively!
  boot.binfmt.registrations.WebAssembly = {
    # TODO: Write nice wrapper script preserving arguments.
    # What capabilities should be given to WASM guest?
    # How should those capabilities be configured?
    # - Environment variables?
    # - Prepend WASM file with capabilities JSON?
    interpreter = "${pkgs.wasmtime}/bin/wasmtime";
    wrapInterpreterInShell = false;

    # Recognition based on file extension is way too fragile, recognise magic bytes instead.
    recognitionType = "magic";
    # Will intentionally break when/if a version 2 of the format comes out.
    # See https://webassembly.github.io/spec/core/binary/modules.html#binary-module
    magicOrExtension = "\\x00asm\\x01\\x00\\x00\\x00";

    # Set to true if you want to be able to run a WASM setuid binary and you also trust your WASM runtime
    matchCredentials = false;
  };
}
