
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Maybe" = import ../Data.Maybe;
      "Prelude" = import ../Prelude;
    };
  compose = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn;
  Inject-Dict = x: x;
  prj = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.prj;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Inject.purs at 10:3 - 10:22";
    in
      __pattern0 __patternFail;
  injectReflexive = 
    { inj = module."Control.Category".identity module."Control.Category".categoryFn;
      prj = module."Data.Maybe".Just;
    };
  injectLeft = 
    { inj = module."Data.Either".Left;
      prj = module."Data.Either".either module."Data.Maybe".Just (module."Data.Function".const module."Data.Maybe".Nothing);
    };
  inj = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.inj;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Inject.purs at 9:3 - 9:16";
    in
      __pattern0 __patternFail;
  injectRight = dictInject: 
    { inj = compose module."Data.Either".Right (inj dictInject);
      prj = module."Data.Either".either (module."Data.Function".const module."Data.Maybe".Nothing) (prj dictInject);
    };
in
  {inherit inj prj injectReflexive injectLeft injectRight;}