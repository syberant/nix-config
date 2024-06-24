
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Comonad" = import ../Control.Comonad;
      "Control.Extend" = import ../Control.Extend;
      "Control.Lazy" = import ../Control.Lazy;
      "Control.Monad" = import ../Control.Monad;
      "Control.Semigroupoid" = import ../Control.Semigroupoid;
      "Data.BooleanAlgebra" = import ../Data.BooleanAlgebra;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.CommutativeRing" = import ../Data.CommutativeRing;
      "Data.Eq" = import ../Data.Eq;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Generic.Rep" = import ../Data.Generic.Rep;
      "Data.HeytingAlgebra" = import ../Data.HeytingAlgebra;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Semiring" = import ../Data.Semiring;
      "Data.Show" = import ../Data.Show;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  conj = module."Data.HeytingAlgebra".conj module."Data.HeytingAlgebra".heytingAlgebraBoolean;
  Tuple = value0: value1: 
    { __tag = "Tuple";
      __field0 = value0;
      __field1 = value1;
    };
  uncurry = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              f1 = f;
              a = v.__field0;
              b = v.__field1;
            in
              f1 a b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 130:1 - 130:57";
    in
      __pattern0 __patternFail;
  swap = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              a = v.__field0;
              b = v.__field1;
            in
              Tuple b a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 134:1 - 134:43";
    in
      __pattern0 __patternFail;
  snd = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              b = v.__field1;
            in
              b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 122:1 - 122:34";
    in
      __pattern0 __patternFail;
  showTuple = dictShow: 
    let
      show = module."Data.Show".show dictShow;
    in
      dictShow1: 
      let
        show1 = module."Data.Show".show dictShow1;
      in
        
        { show = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      a = v.__field0;
                      b = v.__field1;
                    in
                      append "(Tuple " (append (show a) (append " " (append (show1 b) ")")))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 20:1 - 21:65";
            in
              __pattern0 __patternFail;
        };
  semiringTuple = dictSemiring: 
    let
      add = module."Data.Semiring".add dictSemiring;
      one = module."Data.Semiring".one dictSemiring;
      mul = module."Data.Semiring".mul dictSemiring;
      zero = module."Data.Semiring".zero dictSemiring;
    in
      dictSemiring1: 
      let
        add1 = module."Data.Semiring".add dictSemiring1;
        mul1 = module."Data.Semiring".mul dictSemiring1;
      in
        
        { add = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      x1 = v.__field0;
                      y1 = v.__field1;
                      x2 = v1.__field0;
                      y2 = v1.__field1;
                    in
                      Tuple (add x1 x2) (add1 y1 y2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 56:1 - 60:25";
            in
              __pattern0 __patternFail;
          one = Tuple one (module."Data.Semiring".one dictSemiring1);
          mul = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      x1 = v.__field0;
                      y1 = v.__field1;
                      x2 = v1.__field0;
                      y2 = v1.__field1;
                    in
                      Tuple (mul x1 x2) (mul1 y1 y2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 56:1 - 60:25";
            in
              __pattern0 __patternFail;
          zero = Tuple zero (module."Data.Semiring".zero dictSemiring1);
        };
  semigroupoidTuple = 
    { compose = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple" && v1.__tag == "Tuple"
              then 
                let
                  c = v.__field1;
                  a = v1.__field0;
                in
                  Tuple a c
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 41:1 - 42:46";
        in
          __pattern0 __patternFail;
    };
  semigroupTuple = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
    in
      dictSemigroup1: 
      let
        append2 = module."Data.Semigroup".append dictSemigroup1;
      in
        
        { append = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      a1 = v.__field0;
                      b1 = v.__field1;
                      a2 = v1.__field0;
                      b2 = v1.__field1;
                    in
                      Tuple (append1 a1 a2) (append2 b1 b2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 50:1 - 51:67";
            in
              __pattern0 __patternFail;
        };
  ringTuple = dictRing: 
    let
      sub = module."Data.Ring".sub dictRing;
      semiringTuple1 = semiringTuple (dictRing."Semiring0" module."Prim".undefined);
    in
      dictRing1: 
      let
        sub1 = module."Data.Ring".sub dictRing1;
        semiringTuple2 = semiringTuple1 (dictRing1."Semiring0" module."Prim".undefined);
      in
        
        { sub = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      x1 = v.__field0;
                      y1 = v.__field1;
                      x2 = v1.__field0;
                      y2 = v1.__field1;
                    in
                      Tuple (sub x1 x2) (sub1 y1 y2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 62:1 - 63:66";
            in
              __pattern0 __patternFail;
          "Semiring0" = _: semiringTuple2;
        };
  monoidTuple = dictMonoid: 
    let
      mempty = module."Data.Monoid".mempty dictMonoid;
      semigroupTuple1 = semigroupTuple (dictMonoid."Semigroup0" module."Prim".undefined);
    in
      dictMonoid1: 
      let
        semigroupTuple2 = semigroupTuple1 (dictMonoid1."Semigroup0" module."Prim".undefined);
      in
        
        { mempty = Tuple mempty (module."Data.Monoid".mempty dictMonoid1);
          "Semigroup0" = _: semigroupTuple2;
        };
  heytingAlgebraTuple = dictHeytingAlgebra: 
    let
      tt = module."Data.HeytingAlgebra".tt dictHeytingAlgebra;
      ff = module."Data.HeytingAlgebra".ff dictHeytingAlgebra;
      implies = module."Data.HeytingAlgebra".implies dictHeytingAlgebra;
      conj1 = module."Data.HeytingAlgebra".conj dictHeytingAlgebra;
      disj = module."Data.HeytingAlgebra".disj dictHeytingAlgebra;
      not = module."Data.HeytingAlgebra".not dictHeytingAlgebra;
    in
      dictHeytingAlgebra1: 
      let
        implies1 = module."Data.HeytingAlgebra".implies dictHeytingAlgebra1;
        conj2 = module."Data.HeytingAlgebra".conj dictHeytingAlgebra1;
        disj1 = module."Data.HeytingAlgebra".disj dictHeytingAlgebra1;
        not1 = module."Data.HeytingAlgebra".not dictHeytingAlgebra1;
      in
        
        { tt = Tuple tt (module."Data.HeytingAlgebra".tt dictHeytingAlgebra1);
          ff = Tuple ff (module."Data.HeytingAlgebra".ff dictHeytingAlgebra1);
          implies = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      x1 = v.__field0;
                      y1 = v.__field1;
                      x2 = v1.__field0;
                      y2 = v1.__field1;
                    in
                      Tuple (implies x1 x2) (implies1 y1 y2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
            in
              __pattern0 __patternFail;
          conj = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      x1 = v.__field0;
                      y1 = v.__field1;
                      x2 = v1.__field0;
                      y2 = v1.__field1;
                    in
                      Tuple (conj1 x1 x2) (conj2 y1 y2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
            in
              __pattern0 __patternFail;
          disj = v: v1: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple" && v1.__tag == "Tuple"
                  then 
                    let
                      x1 = v.__field0;
                      y1 = v.__field1;
                      x2 = v1.__field0;
                      y2 = v1.__field1;
                    in
                      Tuple (disj x1 x2) (disj1 y1 y2)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
            in
              __pattern0 __patternFail;
          not = v: 
            let
              __pattern0 = __fail: 
                if v.__tag == "Tuple"
                  then 
                    let
                      x = v.__field0;
                      y = v.__field1;
                    in
                      Tuple (not x) (not1 y)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 67:1 - 73:42";
            in
              __pattern0 __patternFail;
        };
  genericTuple = 
    { to = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Product"
              then 
                let
                  arg = x.__field0;
                  arg1 = x.__field1;
                in
                  Tuple arg arg1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 85:1 - 85:54";
        in
          __pattern0 __patternFail;
      from = x: 
        let
          __pattern0 = __fail: 
            if x.__tag == "Tuple"
              then 
                let
                  arg = x.__field0;
                  arg1 = x.__field1;
                in
                  module."Data.Generic.Rep".Product arg arg1
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 85:1 - 85:54";
        in
          __pattern0 __patternFail;
    };
  functorTuple = 
    { map = f: m: 
        let
          __pattern0 = __fail: 
            if m.__tag == "Tuple"
              then 
                let
                  v = m.__field0;
                  v1 = m.__field1;
                in
                  Tuple v (f v1)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 0:0 - 0:0";
        in
          __pattern0 __patternFail;
    };
  invariantTuple = {imap = module."Data.Functor.Invariant".imapF functorTuple;};
  fst = v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              a = v.__field0;
            in
              a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 118:1 - 118:34";
    in
      __pattern0 __patternFail;
  lazyTuple = dictLazy: 
    let
      defer = module."Control.Lazy".defer dictLazy;
    in
      dictLazy1: 
      let
        defer1 = module."Control.Lazy".defer dictLazy1;
      in
        {defer = f: Tuple (defer (v: fst (f module."Data.Unit".unit))) (defer1 (v: snd (f module."Data.Unit".unit)));};
  extendTuple = 
    { extend = f: v: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Tuple"
              then 
                let
                  f1 = f;
                  t = v;
                  a = v.__field0;
                in
                  Tuple a (f1 t)
              else __fail;
          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 108:1 - 109:41";
        in
          __pattern0 __patternFail;
      "Functor0" = _: functorTuple;
    };
  eqTuple = dictEq: 
    let
      eq = module."Data.Eq".eq dictEq;
    in
      dictEq1: 
      let
        eq1 = module."Data.Eq".eq dictEq1;
      in
        
        { eq = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "Tuple" && y.__tag == "Tuple"
                  then 
                    let
                      l = x.__field0;
                      l1 = x.__field1;
                      r = y.__field0;
                      r1 = y.__field1;
                    in
                      conj (eq l r) (eq1 l1 r1)
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
        };
  ordTuple = dictOrd: 
    let
      compare = module."Data.Ord".compare dictOrd;
      eqTuple1 = eqTuple (dictOrd."Eq0" module."Prim".undefined);
    in
      dictOrd1: 
      let
        compare1 = module."Data.Ord".compare dictOrd1;
        eqTuple2 = eqTuple1 (dictOrd1."Eq0" module."Prim".undefined);
      in
        
        { compare = x: y: 
            let
              __pattern0 = __fail: 
                if x.__tag == "Tuple" && y.__tag == "Tuple"
                  then 
                    let
                      l = x.__field0;
                      l1 = x.__field1;
                      r = y.__field0;
                      r1 = y.__field1;
                    in
                      
                      let
                        v = compare l r;
                      in
                        
                        let
                          __pattern0 = __fail: if v.__tag == "LT" then module."Data.Ordering".LT else __fail;
                          __pattern1 = __fail: if v.__tag == "GT" then module."Data.Ordering".GT else __fail;
                          __pattern2 = __fail: compare1 l1 r1;
                          __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 0:0 - 0:0";
                        in
                          __pattern0 (__pattern1 (__pattern2 __patternFail))
                  else __fail;
              __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 0:0 - 0:0";
            in
              __pattern0 __patternFail;
          "Eq0" = _: eqTuple2;
        };
  eq1Tuple = dictEq: 
    let
      eqTuple1 = eqTuple dictEq;
    in
      {eq1 = dictEq1: module."Data.Eq".eq (eqTuple1 dictEq1);};
  ord1Tuple = dictOrd: 
    let
      ordTuple1 = ordTuple dictOrd;
      eq1Tuple1 = eq1Tuple (dictOrd."Eq0" module."Prim".undefined);
    in
      
      { compare1 = dictOrd1: module."Data.Ord".compare (ordTuple1 dictOrd1);
        "Eq10" = _: eq1Tuple1;
      };
  curry = f: a: b: f (Tuple a b);
  comonadTuple = 
    { extract = snd;
      "Extend0" = _: extendTuple;
    };
  commutativeRingTuple = dictCommutativeRing: 
    let
      ringTuple1 = ringTuple (dictCommutativeRing."Ring0" module."Prim".undefined);
    in
      dictCommutativeRing1: 
      let
        ringTuple2 = ringTuple1 (dictCommutativeRing1."Ring0" module."Prim".undefined);
      in
        {"Ring0" = _: ringTuple2;};
  boundedTuple = dictBounded: 
    let
      top = module."Data.Bounded".top dictBounded;
      bottom = module."Data.Bounded".bottom dictBounded;
      ordTuple1 = ordTuple (dictBounded."Ord0" module."Prim".undefined);
    in
      dictBounded1: 
      let
        ordTuple2 = ordTuple1 (dictBounded1."Ord0" module."Prim".undefined);
      in
        
        { top = Tuple top (module."Data.Bounded".top dictBounded1);
          bottom = Tuple bottom (module."Data.Bounded".bottom dictBounded1);
          "Ord0" = _: ordTuple2;
        };
  booleanAlgebraTuple = dictBooleanAlgebra: 
    let
      heytingAlgebraTuple1 = heytingAlgebraTuple (dictBooleanAlgebra."HeytingAlgebra0" module."Prim".undefined);
    in
      dictBooleanAlgebra1: 
      let
        heytingAlgebraTuple2 = heytingAlgebraTuple1 (dictBooleanAlgebra1."HeytingAlgebra0" module."Prim".undefined);
      in
        {"HeytingAlgebra0" = _: heytingAlgebraTuple2;};
  applyTuple = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
    in
      
      { apply = v: v1: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple" && v1.__tag == "Tuple"
                then 
                  let
                    a1 = v.__field0;
                    f = v.__field1;
                    a2 = v1.__field0;
                    x = v1.__field1;
                  in
                    Tuple (append1 a1 a2) (f x)
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 96:1 - 97:59";
          in
            __pattern0 __patternFail;
        "Functor0" = _: functorTuple;
      };
  bindTuple = dictSemigroup: 
    let
      append1 = module."Data.Semigroup".append dictSemigroup;
      applyTuple1 = applyTuple dictSemigroup;
    in
      
      { bind = v: f: 
          let
            __pattern0 = __fail: 
              if v.__tag == "Tuple"
                then 
                  let
                    a1 = v.__field0;
                    b = v.__field1;
                    f1 = f;
                  in
                    
                    let
                      v1 = f1 b;
                    in
                      
                      let
                        __pattern0 = __fail: 
                          if v1.__tag == "Tuple"
                            then 
                              let
                                a2 = v1.__field0;
                                c = v1.__field1;
                              in
                                Tuple (append1 a1 a2) c
                            else __fail;
                        __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 103:25 - 104:37";
                      in
                        __pattern0 __patternFail
                else __fail;
            __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple.purs at 102:1 - 104:37";
          in
            __pattern0 __patternFail;
        "Apply0" = _: applyTuple1;
      };
  applicativeTuple = dictMonoid: 
    let
      applyTuple1 = applyTuple (dictMonoid."Semigroup0" module."Prim".undefined);
    in
      
      { pure = Tuple (module."Data.Monoid".mempty dictMonoid);
        "Apply0" = _: applyTuple1;
      };
  monadTuple = dictMonoid: 
    let
      applicativeTuple1 = applicativeTuple dictMonoid;
      bindTuple1 = bindTuple (dictMonoid."Semigroup0" module."Prim".undefined);
    in
      
      { "Applicative0" = _: applicativeTuple1;
        "Bind1" = _: bindTuple1;
      };
in
  {inherit Tuple fst snd curry uncurry swap showTuple eqTuple eq1Tuple ordTuple ord1Tuple boundedTuple semigroupoidTuple semigroupTuple monoidTuple semiringTuple ringTuple commutativeRingTuple heytingAlgebraTuple booleanAlgebraTuple functorTuple genericTuple invariantTuple applyTuple applicativeTuple bindTuple monadTuple extendTuple comonadTuple lazyTuple;}