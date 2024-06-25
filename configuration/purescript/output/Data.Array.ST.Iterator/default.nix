
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad.ST" = import ../Control.Monad.ST;
      "Control.Monad.ST.Internal" = import ../Control.Monad.ST.Internal;
      "Control.Monad.ST.Ref" = import ../Control.Monad.ST.Ref;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.Array.ST" = import ../Data.Array.ST;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Semiring" = import ../Data.Semiring;
      "Prelude" = import ../Prelude;
    };
  bind = module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST;
  pure = module."Control.Applicative".pure module."Control.Monad.ST.Internal".applicativeST;
  add = module."Data.Semiring".add module."Data.Semiring".semiringInt;
  map = module."Data.Functor".map module."Control.Monad.ST.Internal".functorST;
  not = module."Data.HeytingAlgebra".not module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  void = module."Data.Functor".void module."Control.Monad.ST.Internal".functorST;
  Iterator = value0: value1: 
    { __tag = "Iterator";
      __field0 = value0;
      __field1 = value1;
    };
  peek = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Iterator"
          then 
            let
              f = v.__field0;
              currentIndex = v.__field1;
            in
              bind (module."Control.Monad.ST.Internal".read currentIndex) (i: pure (f i))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 55:1 - 55:51";
    in
      __pattern0 __patternFail;
  next = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Iterator"
          then 
            let
              f = v.__field0;
              currentIndex = v.__field1;
            in
              bind (module."Control.Monad.ST.Internal".read currentIndex) (i: bind (module."Control.Monad.ST.Internal".modify (v1: add v1 1) currentIndex) (_: pure (f i)))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 48:1 - 48:51";
    in
      __pattern0 __patternFail;
  pushWhile = p: iter: array: bind (module."Control.Monad.ST.Internal".new false) 
    ( break: module."Control.Monad.ST.Internal".while (map not (module."Control.Monad.ST.Internal".read break)) 
      ( bind (peek iter) 
        ( mx: 
          let
            __pattern0 = __fail: 
              if mx.__tag == "Just"
                then 
                  let
                    x = mx.__field0;
                  in
                    if p x then bind (module."Data.Array.ST".push x array) (_: void (next iter)) else __fail
                else __fail;
            __pattern1 = __fail: void (module."Control.Monad.ST.Internal".write true break);
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 71:5 - 76:38";
          in
            __pattern0 (__pattern1 __patternFail)
        )
      )
    );
  pushAll = pushWhile (module."Data.Function".const true);
  iterator = f: map (Iterator f) (module."Control.Monad.ST.Internal".new 0);
  iterate = iter: f: bind (module."Control.Monad.ST.Internal".new false) 
    ( break: module."Control.Monad.ST.Internal".while (map not (module."Control.Monad.ST.Internal".read break)) 
      ( bind (next iter) 
        ( mx: 
          let
            __pattern0 = __fail: 
              if mx.__tag == "Just"
                then 
                  let
                    x = mx.__field0;
                  in
                    f x
                else __fail;
            __pattern1 = __fail: if mx.__tag == "Nothing" then void (module."Control.Monad.ST.Internal".write true break) else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST/Iterator.purs at 42:5 - 44:47";
          in
            __pattern0 (__pattern1 __patternFail)
        )
      )
    );
  exhausted = module."Control.Semigroupoid".compose module."Control.Semigroupoid".semigroupoidFn (map module."Data.Maybe".isNothing) peek;
in
  {inherit iterator iterate next peek exhausted pushWhile pushAll;}