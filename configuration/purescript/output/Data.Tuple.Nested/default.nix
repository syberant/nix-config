
let
  module = 
    { "Data.Tuple" = import ../Data.Tuple;
      "Data.Unit" = import ../Data.Unit;
      "Prelude" = import ../Prelude;
    };
  uncurry9 = f': v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f'1 = f';
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              h = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              i = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              f'1 a b c d e f g h i
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 249:1 - 249:123";
    in
      __pattern0 __patternFail;
  uncurry8 = f': v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f'1 = f';
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              h = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              f'1 a b c d e f g h
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 245:1 - 245:113";
    in
      __pattern0 __patternFail;
  uncurry7 = f': v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f'1 = f';
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              f'1 a b c d e f g
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 241:1 - 241:104";
    in
      __pattern0 __patternFail;
  uncurry6 = f': v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f'1 = f';
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              f'1 a b c d e f
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 237:1 - 237:95";
    in
      __pattern0 __patternFail;
  uncurry5 = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f1 = f;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
            in
              f1 a b c d e
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 233:1 - 233:86";
    in
      __pattern0 __patternFail;
  uncurry4 = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f1 = f;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
            in
              f1 a b c d
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 229:1 - 229:77";
    in
      __pattern0 __patternFail;
  uncurry3 = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple"
          then 
            let
              f1 = f;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
            in
              f1 a b c
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 225:1 - 225:68";
    in
      __pattern0 __patternFail;
  uncurry2 = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple"
          then 
            let
              f1 = f;
              a = v.__field0;
              b = v.__field1.__field0;
            in
              f1 a b
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 221:1 - 221:59";
    in
      __pattern0 __patternFail;
  uncurry10 = f': v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              f'1 = f';
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              h = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              i = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              j = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
            in
              f'1 a b c d e f g h i j
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 253:1 - 253:133";
    in
      __pattern0 __patternFail;
  uncurry1 = f: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              f1 = f;
              a = v.__field0;
            in
              f1 a
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 217:1 - 217:50";
    in
      __pattern0 __patternFail;
  tuple9 = a: b: c: d: e: f: g: h: i: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h (module."Data.Tuple".Tuple i module."Data.Unit".unit))))))));
  tuple8 = a: b: c: d: e: f: g: h: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h module."Data.Unit".unit)))))));
  tuple7 = a: b: c: d: e: f: g: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g module."Data.Unit".unit))))));
  tuple6 = a: b: c: d: e: f: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f module."Data.Unit".unit)))));
  tuple5 = a: b: c: d: e: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e module."Data.Unit".unit))));
  tuple4 = a: b: c: d: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d module."Data.Unit".unit)));
  tuple3 = a: b: c: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c module."Data.Unit".unit));
  tuple2 = a: b: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b module."Data.Unit".unit);
  tuple10 = a: b: c: d: e: f: g: h: i: j: module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h (module."Data.Tuple".Tuple i (module."Data.Tuple".Tuple j module."Data.Unit".unit)))))))));
  tuple1 = a: module."Data.Tuple".Tuple a module."Data.Unit".unit;
  over9 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              h = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              i = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h (module."Data.Tuple".Tuple (o1 i) z))))))))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 209:1 - 209:102";
    in
      __pattern0 __patternFail;
  over8 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              h = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple (o1 h) z)))))))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 205:1 - 205:94";
    in
      __pattern0 __patternFail;
  over7 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple (o1 g) z))))))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 201:1 - 201:88";
    in
      __pattern0 __patternFail;
  over6 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple (o1 f) z)))))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 197:1 - 197:82";
    in
      __pattern0 __patternFail;
  over5 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple (o1 e) z))))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 193:1 - 193:76";
    in
      __pattern0 __patternFail;
  over4 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple (o1 d) z)))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 189:1 - 189:70";
    in
      __pattern0 __patternFail;
  over3 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple (o1 c) z))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 185:1 - 185:64";
    in
      __pattern0 __patternFail;
  over2 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              z = v.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple (o1 b) z)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 181:1 - 181:58";
    in
      __pattern0 __patternFail;
  over10 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple" && v.__field1.__tag == "Tuple" && v.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple" && v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              b = v.__field1.__field0;
              c = v.__field1.__field1.__field0;
              d = v.__field1.__field1.__field1.__field0;
              e = v.__field1.__field1.__field1.__field1.__field0;
              f = v.__field1.__field1.__field1.__field1.__field1.__field0;
              g = v.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              h = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              i = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              j = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field0;
              z = v.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1.__field1;
            in
              module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h (module."Data.Tuple".Tuple i (module."Data.Tuple".Tuple (o1 j) z)))))))))
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 213:1 - 213:109";
    in
      __pattern0 __patternFail;
  over1 = o: v: 
    let
      __pattern0 = __fail: 
        if v.__tag == "Tuple"
          then 
            let
              o1 = o;
              a = v.__field0;
              z = v.__field1;
            in
              module."Data.Tuple".Tuple (o1 a) z
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 177:1 - 177:52";
    in
      __pattern0 __patternFail;
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 169:1 - 169:65";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 165:1 - 165:60";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 161:1 - 161:56";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 157:1 - 157:52";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 153:1 - 153:48";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 149:1 - 149:44";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 145:1 - 145:40";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 141:1 - 141:36";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 173:1 - 173:70";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/tuples/master/src/Data/Tuple/Nested.purs at 137:1 - 137:32";
    in
      __pattern0 __patternFail;
  curry9 = z: f': a: b: c: d: e: f: g: h: i: f' (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h (module."Data.Tuple".Tuple i z)))))))));
  curry8 = z: f': a: b: c: d: e: f: g: h: f' (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h z))))))));
  curry7 = z: f': a: b: c: d: e: f: g: f' (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g z)))))));
  curry6 = z: f': a: b: c: d: e: f: f' (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f z))))));
  curry5 = z: f: a: b: c: d: e: f (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e z)))));
  curry4 = z: f: a: b: c: d: f (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d z))));
  curry3 = z: f: a: b: c: f (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c z)));
  curry2 = z: f: a: b: f (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b z));
  curry10 = z: f': a: b: c: d: e: f: g: h: i: j: f' (module."Data.Tuple".Tuple a (module."Data.Tuple".Tuple b (module."Data.Tuple".Tuple c (module."Data.Tuple".Tuple d (module."Data.Tuple".Tuple e (module."Data.Tuple".Tuple f (module."Data.Tuple".Tuple g (module."Data.Tuple".Tuple h (module."Data.Tuple".Tuple i (module."Data.Tuple".Tuple j z))))))))));
  curry1 = z: f: a: f (module."Data.Tuple".Tuple a z);
in
  {inherit tuple1 tuple2 tuple3 tuple4 tuple5 tuple6 tuple7 tuple8 tuple9 tuple10 get1 get2 get3 get4 get5 get6 get7 get8 get9 get10 over1 over2 over3 over4 over5 over6 over7 over8 over9 over10 uncurry1 uncurry2 uncurry3 uncurry4 uncurry5 uncurry6 uncurry7 uncurry8 uncurry9 uncurry10 curry1 curry2 curry3 curry4 curry5 curry6 curry7 curry8 curry9 curry10;}