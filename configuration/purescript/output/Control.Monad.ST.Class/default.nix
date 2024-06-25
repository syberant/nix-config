
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Monad.ST" = import ../Control.Monad.ST;
      "Prelude" = import ../Prelude;
    };
  MonadST-Dict = x: x;
  monadSTST = {liftST = module."Control.Category".identity module."Control.Category".categoryFn;};
  liftST = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.liftST;
      __patternFail = builtins.throw "Pattern match failure in .spago/st/master/src/Control/Monad/ST/Class.purs at 11:3 - 11:22";
    in
      __pattern0 __patternFail;
in
  {inherit liftST monadSTST;}