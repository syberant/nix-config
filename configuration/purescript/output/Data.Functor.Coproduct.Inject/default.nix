
let
  module = 
    { "Control.Category" = import ../Control.Category;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Either" = import ../Data.Either;
      "Data.Function" = import ../Data.Function;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
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
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Inject.purs at 12:3 - 12:38";
    in
      __pattern0 __patternFail;
  injectReflexive = 
    { inj = module."Control.Category".identity module."Control.Category".categoryFn;
      prj = module."Data.Maybe".Just;
    };
  injectLeft = 
    { inj = compose module."Data.Functor.Coproduct".Coproduct module."Data.Either".Left;
      prj = module."Data.Functor.Coproduct".coproduct module."Data.Maybe".Just (module."Data.Function".const module."Data.Maybe".Nothing);
    };
  inj = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.inj;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Inject.purs at 11:3 - 11:30";
    in
      __pattern0 __patternFail;
  injectRight = dictInject: 
    { inj = compose module."Data.Functor.Coproduct".Coproduct (compose module."Data.Either".Right (inj dictInject));
      prj = module."Data.Functor.Coproduct".coproduct (module."Data.Function".const module."Data.Maybe".Nothing) (prj dictInject);
    };
in
  {inherit inj prj injectReflexive injectLeft injectRight;}