
let
  module = {"NixTypes" = import ../NixTypes;};
  nixosModule = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          {environment = {systemPackages = [pkgs.hello];};};
      __patternFail = builtins.throw "Pattern match failure in src/Main.purs at 10:1 - 10:37";
    in
      __pattern0 __patternFail;
in
  {inherit nixosModule;}