
let
  module = 
    { "Data.Const" = import ../Data.Const;
      "Data.Functor.Product" = import ../Data.Functor.Product;
      "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  product9 = a: b: c: d: e: f: g: h: i: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c (module."Data.Functor.Product".product d (module."Data.Functor.Product".product e (module."Data.Functor.Product".product f (module."Data.Functor.Product".product g (module."Data.Functor.Product".product h (module."Data.Functor.Product".product i module."Data.Unit".unit))))))));
  product8 = a: b: c: d: e: f: g: h: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c (module."Data.Functor.Product".product d (module."Data.Functor.Product".product e (module."Data.Functor.Product".product f (module."Data.Functor.Product".product g (module."Data.Functor.Product".product h module."Data.Unit".unit)))))));
  product7 = a: b: c: d: e: f: g: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c (module."Data.Functor.Product".product d (module."Data.Functor.Product".product e (module."Data.Functor.Product".product f (module."Data.Functor.Product".product g module."Data.Unit".unit))))));
  product6 = a: b: c: d: e: f: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c (module."Data.Functor.Product".product d (module."Data.Functor.Product".product e (module."Data.Functor.Product".product f module."Data.Unit".unit)))));
  product5 = a: b: c: d: e: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c (module."Data.Functor.Product".product d (module."Data.Functor.Product".product e module."Data.Unit".unit))));
  product4 = a: b: c: d: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c (module."Data.Functor.Product".product d module."Data.Unit".unit)));
  product3 = a: b: c: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c module."Data.Unit".unit));
  product2 = a: b: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b module."Data.Unit".unit);
  product10 = a: b: c: d: e: f: g: h: i: j: module."Data.Functor.Product".product a (module."Data.Functor.Product".product b (module."Data.Functor.Product".product c (module."Data.Functor.Product".product d (module."Data.Functor.Product".product e (module."Data.Functor.Product".product f (module."Data.Functor.Product".product g (module."Data.Functor.Product".product h (module."Data.Functor.Product".product i (module."Data.Functor.Product".product j module."Data.Unit".unit)))))))));
  product1 = a: module."Data.Functor.Product".product a module."Data.Unit".unit;
  get9 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              i = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              i
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 108:1 - 108:65";
    in
      __pattern0 __patternFail;
  get8 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              h = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              h
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 105:1 - 105:60";
    in
      __pattern0 __patternFail;
  get7 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              g
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 102:1 - 102:56";
    in
      __pattern0 __patternFail;
  get6 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              f
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 99:1 - 99:52";
    in
      __pattern0 __patternFail;
  get5 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              e = v.__field1.__field1.__field1.__field1.__field0;
            in
              e
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 96:1 - 96:48";
    in
      __pattern0 __patternFail;
  get4 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              d = v.__field1.__field1.__field1.__field0;
            in
              d
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 93:1 - 93:44";
    in
      __pattern0 __patternFail;
  get3 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple"
          then 
            let
              c = v.__field1.__field1.__field0;
            in
              c
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 90:1 - 90:40";
    in
      __pattern0 __patternFail;
  get2 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple"
          then 
            let
              b = v.__field1.__field0;
            in
              b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 87:1 - 87:36";
    in
      __pattern0 __patternFail;
  get10 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              j = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              j
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 111:1 - 111:70";
    in
      __pattern0 __patternFail;
  get1 = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              a = v.__field0;
            in
              a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Product/Nested.purs at 84:1 - 84:32";
    in
      __pattern0 __patternFail;
in
  {inherit product1 product2 product3 product4 product5 product6 product7 product8 product9 product10 get1 get2 get3 get4 get5 get6 get7 get8 get9 get10;}