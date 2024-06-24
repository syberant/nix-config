
let
  module = 
    { "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Prelude" = import ../Prelude;
    };
  GenericSemigroup-Dict = x: x;
  genericSemigroupNoConstructors = {genericAppend' = a: v: a;};
  genericSemigroupNoArguments = {genericAppend' = a: v: a;};
  genericSemigroupArgument = dictSemigroup: 
    let
      append = module."Data.Semigroup".append dictSemigroup;
    in
      
      { genericAppend' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a1 = v;
                a2 = v1;
              in
                append a1 a2;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Generic.purs at 26:1 - 27:71";
          in
            __pattern0 __patternFail;
      };
  genericAppend' = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.genericAppend';
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Generic.purs at 11:3 - 11:32";
    in
      __pattern0 __patternFail;
  genericSemigroupConstructor = dictGenericSemigroup: 
    let
      genericAppend'1 = genericAppend' dictGenericSemigroup;
    in
      
      { genericAppend' = v: v1: 
          let
            __pattern0 = __fail: 
              let
                a1 = v;
                a2 = v1;
              in
                genericAppend'1 a1 a2;
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Generic.purs at 23:1 - 24:88";
          in
            __pattern0 __patternFail;
      };
  genericSemigroupProduct = dictGenericSemigroup: 
    let
      genericAppend'1 = genericAppend' dictGenericSemigroup;
    in
      dictGenericSemigroup1: 
      let
        genericAppend'2 = genericAppend' dictGenericSemigroup1;
      in
        
        { genericAppend' = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product" && v1.__tag == "Product"
                  then 
                    let
                      a1 = v.__field0;
                      b1 = v.__field1;
                      a2 = v1.__field0;
                      b2 = v1.__field1;
                    in
                      module."Data.Generic.Rep".Product (genericAppend'1 a1 a2) (genericAppend'2 b1 b2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Semigroup/Generic.purs at 19:1 - 21:58";
            in
              __pattern0 __patternFail;
        };
  genericAppend = dictGeneric: 
    let
      to = module."Data.Generic.Rep".to dictGeneric;
      from = module."Data.Generic.Rep".from dictGeneric;
    in
      dictGenericSemigroup: 
      let
        genericAppend'1 = genericAppend' dictGenericSemigroup;
      in
        x: y: to (genericAppend'1 (from x) (from y));
in
  {inherit genericAppend' genericAppend genericSemigroupNoConstructors genericSemigroupNoArguments genericSemigroupProduct genericSemigroupConstructor genericSemigroupArgument;}