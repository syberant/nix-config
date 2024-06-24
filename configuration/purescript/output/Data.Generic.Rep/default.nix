
let
  module = 
    { "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Data.Symbol" = import ../Data.Symbol;
      "Type.Proxy" = import ../Type.Proxy;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  show = module."Data.Show".show module."Data.Show".showString;
  Inl = value0: 
    { __tag = "Inl";
      __field0 = value0;
    };
  Inr = value0: 
    { __tag = "Inr";
      __field0 = value0;
    };
  Product = value0: value1: 
    { __tag = "Product";
      __field0 = value0;
      __field1 = value1;
    };
  NoArguments = {__tag = "NoArguments";};
  Generic-Dict = x: x;
  Constructor = x: x;
  Argument = x: x;
  to = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.to;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 57:3 - 57:17";
    in
      __pattern0 __patternFail;
  showSum = dictShow: 
    let
      show1 = module."Data.Show".show dictShow;
    in
      dictShow1: 
      let
        show2 = module."Data.Show".show dictShow1;
      in
        
        { show = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Inl"
                  then 
                    let
                      a = v.__field0;
                    in
                      append "(Inl " (append (show1 a) ")")
                  else __fail;
              __pattern1 = __fail: 
                if v.__tag == "Inr"
                  then 
                    let
                      b = v.__field0;
                    in
                      append "(Inr " (append (show2 b) ")")
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 31:1 - 33:42";
            in
              __pattern0 (__pattern1 __patternFail);
        };
  showProduct = dictShow: 
    let
      show1 = module."Data.Show".show dictShow;
    in
      dictShow1: 
      let
        show2 = module."Data.Show".show dictShow1;
      in
        
        { show = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Product"
                  then 
                    let
                      a = v.__field0;
                      b = v.__field1;
                    in
                      append "(Product " (append (show1 a) (append " " (append (show2 b) ")")))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 38:1 - 39:69";
            in
              __pattern0 __patternFail;
        };
  showNoArguments = {show = v: "NoArguments";};
  showConstructor = dictIsSymbol: 
    let
      reflectSymbol = module."Data.Symbol".reflectSymbol dictIsSymbol;
    in
      dictShow: 
      let
        show1 = module."Data.Show".show dictShow;
      in
        
        { show = v: 
            let
              __pattern0 = __fail: 
                let
                  a = v;
                in
                  append "(Constructor @" (append (show (reflectSymbol module."Type.Proxy".Proxy)) (append " " (append (show1 a) ")")));
              __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 45:1 - 46:112";
            in
              __pattern0 __patternFail;
        };
  showArgument = dictShow: 
    let
      show1 = module."Data.Show".show dictShow;
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "(Argument " (append (show1 a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 51:1 - 52:52";
          in
            __pattern0 __patternFail;
      };
  repOf = dictGeneric: v: module."Type.Proxy".Proxy;
  from = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.from;
      __patternFail = builtins.throw "Pattern match failure in .spago/prelude/master/src/Data/Generic/Rep.purs at 58:3 - 58:19";
    in
      __pattern0 __patternFail;
in
  {inherit to from repOf NoArguments Inl Inr Product Constructor Argument showNoArguments showSum showProduct showConstructor showArgument;}