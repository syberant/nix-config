
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Data.Functor" = import ../Data.Functor;
      "Data.Traversable.Accum" = import ../Data.Traversable.Accum;
      "Prelude" = import ../Prelude;
    };
  StateR = x: x;
  StateL = x: x;
  stateR = v: 
    let
      __pattern0 = __fail: 
        let
          k = v;
        in
          k;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 31:1 - 31:51";
    in
      __pattern0 __patternFail;
  stateL = v: 
    let
      __pattern0 = __fail: 
        let
          k = v;
        in
          k;
      __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 13:1 - 13:51";
    in
      __pattern0 __patternFail;
  functorStateR = 
    { map = f: k: s: 
        let
          v = stateR k s;
        in
          
          let
            __pattern0 = __fail: 
              let
                s1 = v.accum;
                a = v.value;
              in
                
                { accum = s1;
                  value = f a;
                };
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 35:26 - 36:57";
          in
            __pattern0 __patternFail;
    };
  functorStateL = 
    { map = f: k: s: 
        let
          v = stateL k s;
        in
          
          let
            __pattern0 = __fail: 
              let
                s1 = v.accum;
                a = v.value;
              in
                
                { accum = s1;
                  value = f a;
                };
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 17:26 - 18:57";
          in
            __pattern0 __patternFail;
    };
  applyStateR = 
    { apply = f: x: s: 
        let
          v = stateR x s;
        in
          
          let
            __pattern0 = __fail: 
              let
                s1 = v.accum;
                x' = v.value;
              in
                
                let
                  v1 = stateR f s1;
                in
                  
                  let
                    __pattern0 = __fail: 
                      let
                        s2 = v1.accum;
                        f' = v1.value;
                      in
                        
                        { accum = s2;
                          value = f' x';
                        };
                    __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 40:33 - 41:62";
                  in
                    __pattern0 __patternFail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 39:28 - 41:62";
          in
            __pattern0 __patternFail;
      "Functor0" = _: functorStateR;
    };
  applyStateL = 
    { apply = f: x: s: 
        let
          v = stateL f s;
        in
          
          let
            __pattern0 = __fail: 
              let
                s1 = v.accum;
                f' = v.value;
              in
                
                let
                  v1 = stateL x s1;
                in
                  
                  let
                    __pattern0 = __fail: 
                      let
                        s2 = v1.accum;
                        x' = v1.value;
                      in
                        
                        { accum = s2;
                          value = f' x';
                        };
                    __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 22:33 - 23:62";
                  in
                    __pattern0 __patternFail;
            __patternFail = builtins.throw "Pattern match failure in .spago/foldable-traversable/master/src/Data/Traversable/Accum/Internal.purs at 21:28 - 23:62";
          in
            __pattern0 __patternFail;
      "Functor0" = _: functorStateL;
    };
  applicativeStateR = 
    { pure = a: s: 
        { accum = s;
          value = a;
        };
      "Apply0" = _: applyStateR;
    };
  applicativeStateL = 
    { pure = a: s: 
        { accum = s;
          value = a;
        };
      "Apply0" = _: applyStateL;
    };
in
  {inherit StateL stateL StateR stateR functorStateL applyStateL applicativeStateL functorStateR applyStateR applicativeStateR;}