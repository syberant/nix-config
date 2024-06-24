
let
  module = 
    { "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Profunctor" = import ../Data.Profunctor;
      "Prelude" = import ../Prelude;
    };
  Closed-Dict = x: x;
  closedFunction = 
    { closed = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
      "Profunctor0" = _: module."Data.Profunctor".profunctorFn;
    };
  closed = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.closed;
      __patternFail = builtins.throw "Pattern match failure in .spago/profunctor/master/src/Data/Profunctor/Closed.purs at 9:3 - 9:55";
    in
      __pattern0 __patternFail;
in
  {inherit closed closedFunction;}