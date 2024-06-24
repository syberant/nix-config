
let
  module = {"Data.Show" = import ../Data.Show;};
  Void = x: x;
  absurd = a: 
    let
      spin = v: 
        let
          __pattern0 = __fail: 
            let
              b = v;
            in
              spin b;
          __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Void.purs at 39:3 - 39:25";
        in
          __pattern0 __patternFail;
    in
      spin a;
  showVoid = {show = absurd;};
in
  {inherit absurd showVoid;}