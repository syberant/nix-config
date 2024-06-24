
let
  module = 
    { "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Monoid" = import ../Data.Monoid;
    };
  GenericMonoid-Dict = x: x;
  genericMonoidNoArguments = {genericMempty' = module."Data.Generic.Rep".NoArguments;};
  genericMonoidArgument = dictMonoid: {genericMempty' = module."Data.Monoid".mempty dictMonoid;};
  genericMempty' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericMempty';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Monoid/Generic.purs at 11:3 - 11:22";
    in
      __pattern0 __patternFail;
  genericMonoidConstructor = dictGenericMonoid: {genericMempty' = genericMempty' dictGenericMonoid;};
  genericMonoidProduct = dictGenericMonoid: 
    let
      genericMempty'1 = genericMempty' dictGenericMonoid;
    in
      dictGenericMonoid1: {genericMempty' = module."Data.Generic.Rep".Product genericMempty'1 (genericMempty' dictGenericMonoid1);};
  genericMempty = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
    in
      dictGenericMonoid: to (genericMempty' dictGenericMonoid);
in
  {inherit genericMempty' genericMempty genericMonoidNoArguments genericMonoidProduct genericMonoidConstructor genericMonoidArgument;}