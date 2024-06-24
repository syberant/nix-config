
let
  module = 
    { "Data.Bounded" = import ../Data.Bounded;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
    };
  GenericTop-Dict = x: x;
  GenericBottom-Dict = x: x;
  genericTopNoArguments = {genericTop' = module."Data.Generic.Rep".NoArguments;};
  genericTopArgument = dictBounded: {genericTop' = module."Data.Bounded".top dictBounded;};
  genericTop' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericTop';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded/Generic.purs at 33:3 - 33:19";
    in
      __pattern0 __patternFail;
  genericTopConstructor = dictGenericTop: {genericTop' = genericTop' dictGenericTop;};
  genericTopProduct = dictGenericTop: 
    let
      genericTop'1 = genericTop' dictGenericTop;
    in
      dictGenericTop1: {genericTop' = module."Data.Generic.Rep".Product genericTop'1 (genericTop' dictGenericTop1);};
  genericTopSum = dictGenericTop: {genericTop' = module."Data.Generic.Rep".Inr (genericTop' dictGenericTop);};
  genericTop = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
    in
      dictGenericTop: to (genericTop' dictGenericTop);
  genericBottomNoArguments = {genericBottom' = module."Data.Generic.Rep".NoArguments;};
  genericBottomArgument = dictBounded: {genericBottom' = module."Data.Bounded".bottom dictBounded;};
  genericBottom' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericBottom';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Bounded/Generic.purs at 15:3 - 15:22";
    in
      __pattern0 __patternFail;
  genericBottomConstructor = dictGenericBottom: {genericBottom' = genericBottom' dictGenericBottom;};
  genericBottomProduct = dictGenericBottom: 
    let
      genericBottom'1 = genericBottom' dictGenericBottom;
    in
      dictGenericBottom1: {genericBottom' = module."Data.Generic.Rep".Product genericBottom'1 (genericBottom' dictGenericBottom1);};
  genericBottomSum = dictGenericBottom: {genericBottom' = module."Data.Generic.Rep".Inl (genericBottom' dictGenericBottom);};
  genericBottom = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
    in
      dictGenericBottom: to (genericBottom' dictGenericBottom);
in
  {inherit genericBottom' genericBottom genericTop' genericTop genericBottomNoArguments genericBottomArgument genericBottomSum genericBottomProduct genericBottomConstructor genericTopNoArguments genericTopArgument genericTopSum genericTopProduct genericTopConstructor;}