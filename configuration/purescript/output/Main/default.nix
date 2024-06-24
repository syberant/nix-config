
let
  module = 
    { "Data.Foldable" = import ../Data.Foldable;
      "Data.Maybe" = import ../Data.Maybe;
      "Prelude" = import ../Prelude;
    };
  Package = x: x;
  Metadata = x: x;
  License = x: x;
  nixosModule = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          {environment = {systemPackages = [pkgs.hello];};};
      __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 41:1 - 41:37";
    in
      __pattern0 __patternFail;
in
  {inherit License Metadata Package nixosModule;}