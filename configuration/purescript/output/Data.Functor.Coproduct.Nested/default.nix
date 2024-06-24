
let
  module = 
    { "Data.Const" = import ../Data.Const;
      "Data.Either" = import ../Data.Either;
      "Data.Functor.Coproduct" = import ../Data.Functor.Coproduct;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Void" = import ../Data.Void;
      "Prelude" = import ../Prelude;
    };
  unwrap = module."Data.Newtype".unwrap module."Prim".undefined;
  in9 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v))))))));
  in8 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v)))))));
  in7 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v))))));
  in6 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v)))));
  in5 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v))));
  in4 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v)));
  in3 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v));
  in2 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v);
  in10 = v: module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".right (module."Data.Functor.Coproduct".left v)))))))));
  in1 = module."Data.Functor.Coproduct".left;
  coproduct9 = a: b: c: d: e: f: g: h: i: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  
                                  let
                                    __pattern0 = __fail: 
                                      if _3.__tag == "Left"
                                        then 
                                          let
                                            r = _3.__field0;
                                          in
                                            d r
                                        else __fail;
                                    __pattern1 = __fail: 
                                      if _3.__tag == "Right"
                                        then 
                                          let
                                            _4 = _3.__field0;
                                          in
                                            
                                            let
                                              __pattern0 = __fail: 
                                                if _4.__tag == "Left"
                                                  then 
                                                    let
                                                      r = _4.__field0;
                                                    in
                                                      e r
                                                  else __fail;
                                              __pattern1 = __fail: 
                                                if _4.__tag == "Right"
                                                  then 
                                                    let
                                                      _5 = _4.__field0;
                                                    in
                                                      
                                                      let
                                                        __pattern0 = __fail: 
                                                          if _5.__tag == "Left"
                                                            then 
                                                              let
                                                                r = _5.__field0;
                                                              in
                                                                f r
                                                            else __fail;
                                                        __pattern1 = __fail: 
                                                          if _5.__tag == "Right"
                                                            then 
                                                              let
                                                                _6 = _5.__field0;
                                                              in
                                                                
                                                                let
                                                                  __pattern0 = __fail: 
                                                                    if _6.__tag == "Left"
                                                                      then 
                                                                        let
                                                                          r = _6.__field0;
                                                                        in
                                                                          g r
                                                                      else __fail;
                                                                  __pattern1 = __fail: 
                                                                    if _6.__tag == "Right"
                                                                      then 
                                                                        let
                                                                          _7 = _6.__field0;
                                                                        in
                                                                          
                                                                          let
                                                                            __pattern0 = __fail: 
                                                                              if _7.__tag == "Left"
                                                                                then 
                                                                                  let
                                                                                    r = _7.__field0;
                                                                                  in
                                                                                    h r
                                                                                else __fail;
                                                                            __pattern1 = __fail: 
                                                                              if _7.__tag == "Right"
                                                                                then 
                                                                                  let
                                                                                    _8 = _7.__field0;
                                                                                  in
                                                                                    
                                                                                    let
                                                                                      __pattern0 = __fail: 
                                                                                        if _8.__tag == "Left"
                                                                                          then 
                                                                                            let
                                                                                              r = _8.__field0;
                                                                                            in
                                                                                              i r
                                                                                          else __fail;
                                                                                      __pattern1 = __fail: 
                                                                                        if _8.__tag == "Right"
                                                                                          then 
                                                                                            let
                                                                                              _9 = _8.__field0;
                                                                                            in
                                                                                              module."Data.Void".absurd (unwrap _9)
                                                                                          else __fail;
                                                                                      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 248:41 - 250:61";
                                                                                    in
                                                                                      __pattern0 (__pattern1 __patternFail)
                                                                                else __fail;
                                                                            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 246:39 - 250:61";
                                                                          in
                                                                            __pattern0 (__pattern1 __patternFail)
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 244:37 - 250:61";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 242:35 - 250:61";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 240:33 - 250:61";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 238:31 - 250:61";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 236:29 - 250:61";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 234:27 - 250:61";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 232:34 - 250:61";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct8 = a: b: c: d: e: f: g: h: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  
                                  let
                                    __pattern0 = __fail: 
                                      if _3.__tag == "Left"
                                        then 
                                          let
                                            r = _3.__field0;
                                          in
                                            d r
                                        else __fail;
                                    __pattern1 = __fail: 
                                      if _3.__tag == "Right"
                                        then 
                                          let
                                            _4 = _3.__field0;
                                          in
                                            
                                            let
                                              __pattern0 = __fail: 
                                                if _4.__tag == "Left"
                                                  then 
                                                    let
                                                      r = _4.__field0;
                                                    in
                                                      e r
                                                  else __fail;
                                              __pattern1 = __fail: 
                                                if _4.__tag == "Right"
                                                  then 
                                                    let
                                                      _5 = _4.__field0;
                                                    in
                                                      
                                                      let
                                                        __pattern0 = __fail: 
                                                          if _5.__tag == "Left"
                                                            then 
                                                              let
                                                                r = _5.__field0;
                                                              in
                                                                f r
                                                            else __fail;
                                                        __pattern1 = __fail: 
                                                          if _5.__tag == "Right"
                                                            then 
                                                              let
                                                                _6 = _5.__field0;
                                                              in
                                                                
                                                                let
                                                                  __pattern0 = __fail: 
                                                                    if _6.__tag == "Left"
                                                                      then 
                                                                        let
                                                                          r = _6.__field0;
                                                                        in
                                                                          g r
                                                                      else __fail;
                                                                  __pattern1 = __fail: 
                                                                    if _6.__tag == "Right"
                                                                      then 
                                                                        let
                                                                          _7 = _6.__field0;
                                                                        in
                                                                          
                                                                          let
                                                                            __pattern0 = __fail: 
                                                                              if _7.__tag == "Left"
                                                                                then 
                                                                                  let
                                                                                    r = _7.__field0;
                                                                                  in
                                                                                    h r
                                                                                else __fail;
                                                                            __pattern1 = __fail: 
                                                                              if _7.__tag == "Right"
                                                                                then 
                                                                                  let
                                                                                    _8 = _7.__field0;
                                                                                  in
                                                                                    module."Data.Void".absurd (unwrap _8)
                                                                                else __fail;
                                                                            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 227:39 - 229:59";
                                                                          in
                                                                            __pattern0 (__pattern1 __patternFail)
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 225:37 - 229:59";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 223:35 - 229:59";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 221:33 - 229:59";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 219:31 - 229:59";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 217:29 - 229:59";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 215:27 - 229:59";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 213:32 - 229:59";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct7 = a: b: c: d: e: f: g: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  
                                  let
                                    __pattern0 = __fail: 
                                      if _3.__tag == "Left"
                                        then 
                                          let
                                            r = _3.__field0;
                                          in
                                            d r
                                        else __fail;
                                    __pattern1 = __fail: 
                                      if _3.__tag == "Right"
                                        then 
                                          let
                                            _4 = _3.__field0;
                                          in
                                            
                                            let
                                              __pattern0 = __fail: 
                                                if _4.__tag == "Left"
                                                  then 
                                                    let
                                                      r = _4.__field0;
                                                    in
                                                      e r
                                                  else __fail;
                                              __pattern1 = __fail: 
                                                if _4.__tag == "Right"
                                                  then 
                                                    let
                                                      _5 = _4.__field0;
                                                    in
                                                      
                                                      let
                                                        __pattern0 = __fail: 
                                                          if _5.__tag == "Left"
                                                            then 
                                                              let
                                                                r = _5.__field0;
                                                              in
                                                                f r
                                                            else __fail;
                                                        __pattern1 = __fail: 
                                                          if _5.__tag == "Right"
                                                            then 
                                                              let
                                                                _6 = _5.__field0;
                                                              in
                                                                
                                                                let
                                                                  __pattern0 = __fail: 
                                                                    if _6.__tag == "Left"
                                                                      then 
                                                                        let
                                                                          r = _6.__field0;
                                                                        in
                                                                          g r
                                                                      else __fail;
                                                                  __pattern1 = __fail: 
                                                                    if _6.__tag == "Right"
                                                                      then 
                                                                        let
                                                                          _7 = _6.__field0;
                                                                        in
                                                                          module."Data.Void".absurd (unwrap _7)
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 208:37 - 210:57";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 206:35 - 210:57";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 204:33 - 210:57";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 202:31 - 210:57";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 200:29 - 210:57";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 198:27 - 210:57";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 196:30 - 210:57";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct6 = a: b: c: d: e: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  
                                  let
                                    __pattern0 = __fail: 
                                      if _3.__tag == "Left"
                                        then 
                                          let
                                            r = _3.__field0;
                                          in
                                            d r
                                        else __fail;
                                    __pattern1 = __fail: 
                                      if _3.__tag == "Right"
                                        then 
                                          let
                                            _4 = _3.__field0;
                                          in
                                            
                                            let
                                              __pattern0 = __fail: 
                                                if _4.__tag == "Left"
                                                  then 
                                                    let
                                                      r = _4.__field0;
                                                    in
                                                      e r
                                                  else __fail;
                                              __pattern1 = __fail: 
                                                if _4.__tag == "Right"
                                                  then 
                                                    let
                                                      _5 = _4.__field0;
                                                    in
                                                      
                                                      let
                                                        __pattern0 = __fail: 
                                                          if _5.__tag == "Left"
                                                            then 
                                                              let
                                                                r = _5.__field0;
                                                              in
                                                                f r
                                                            else __fail;
                                                        __pattern1 = __fail: 
                                                          if _5.__tag == "Right"
                                                            then 
                                                              let
                                                                _6 = _5.__field0;
                                                              in
                                                                module."Data.Void".absurd (unwrap _6)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 191:35 - 193:55";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 189:33 - 193:55";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 187:31 - 193:55";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 185:29 - 193:55";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 183:27 - 193:55";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 181:28 - 193:55";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct5 = a: b: c: d: e: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  
                                  let
                                    __pattern0 = __fail: 
                                      if _3.__tag == "Left"
                                        then 
                                          let
                                            r = _3.__field0;
                                          in
                                            d r
                                        else __fail;
                                    __pattern1 = __fail: 
                                      if _3.__tag == "Right"
                                        then 
                                          let
                                            _4 = _3.__field0;
                                          in
                                            
                                            let
                                              __pattern0 = __fail: 
                                                if _4.__tag == "Left"
                                                  then 
                                                    let
                                                      r = _4.__field0;
                                                    in
                                                      e r
                                                  else __fail;
                                              __pattern1 = __fail: 
                                                if _4.__tag == "Right"
                                                  then 
                                                    let
                                                      _5 = _4.__field0;
                                                    in
                                                      module."Data.Void".absurd (unwrap _5)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 176:33 - 178:53";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 174:31 - 178:53";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 172:29 - 178:53";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 170:27 - 178:53";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 168:26 - 178:53";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct4 = a: b: c: d: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  
                                  let
                                    __pattern0 = __fail: 
                                      if _3.__tag == "Left"
                                        then 
                                          let
                                            r = _3.__field0;
                                          in
                                            d r
                                        else __fail;
                                    __pattern1 = __fail: 
                                      if _3.__tag == "Right"
                                        then 
                                          let
                                            _4 = _3.__field0;
                                          in
                                            module."Data.Void".absurd (unwrap _4)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 163:31 - 165:51";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 161:29 - 165:51";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 159:27 - 165:51";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 157:24 - 165:51";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct3 = a: b: c: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  module."Data.Void".absurd (unwrap _3)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 152:29 - 154:49";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 150:27 - 154:49";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 148:22 - 154:49";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct2 = a: b: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        module."Data.Void".absurd (unwrap _2)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 143:27 - 145:47";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 141:20 - 145:47";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct10 = a: b: c: d: e: f: g: h: i: j: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              a r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              
              let
                __pattern0 = __fail: 
                  if _1.__tag == "Left"
                    then 
                      let
                        r = _1.__field0;
                      in
                        b r
                    else __fail;
                __pattern1 = __fail: 
                  if _1.__tag == "Right"
                    then 
                      let
                        _2 = _1.__field0;
                      in
                        
                        let
                          __pattern0 = __fail: 
                            if _2.__tag == "Left"
                              then 
                                let
                                  r = _2.__field0;
                                in
                                  c r
                              else __fail;
                          __pattern1 = __fail: 
                            if _2.__tag == "Right"
                              then 
                                let
                                  _3 = _2.__field0;
                                in
                                  
                                  let
                                    __pattern0 = __fail: 
                                      if _3.__tag == "Left"
                                        then 
                                          let
                                            r = _3.__field0;
                                          in
                                            d r
                                        else __fail;
                                    __pattern1 = __fail: 
                                      if _3.__tag == "Right"
                                        then 
                                          let
                                            _4 = _3.__field0;
                                          in
                                            
                                            let
                                              __pattern0 = __fail: 
                                                if _4.__tag == "Left"
                                                  then 
                                                    let
                                                      r = _4.__field0;
                                                    in
                                                      e r
                                                  else __fail;
                                              __pattern1 = __fail: 
                                                if _4.__tag == "Right"
                                                  then 
                                                    let
                                                      _5 = _4.__field0;
                                                    in
                                                      
                                                      let
                                                        __pattern0 = __fail: 
                                                          if _5.__tag == "Left"
                                                            then 
                                                              let
                                                                r = _5.__field0;
                                                              in
                                                                f r
                                                            else __fail;
                                                        __pattern1 = __fail: 
                                                          if _5.__tag == "Right"
                                                            then 
                                                              let
                                                                _6 = _5.__field0;
                                                              in
                                                                
                                                                let
                                                                  __pattern0 = __fail: 
                                                                    if _6.__tag == "Left"
                                                                      then 
                                                                        let
                                                                          r = _6.__field0;
                                                                        in
                                                                          g r
                                                                      else __fail;
                                                                  __pattern1 = __fail: 
                                                                    if _6.__tag == "Right"
                                                                      then 
                                                                        let
                                                                          _7 = _6.__field0;
                                                                        in
                                                                          
                                                                          let
                                                                            __pattern0 = __fail: 
                                                                              if _7.__tag == "Left"
                                                                                then 
                                                                                  let
                                                                                    r = _7.__field0;
                                                                                  in
                                                                                    h r
                                                                                else __fail;
                                                                            __pattern1 = __fail: 
                                                                              if _7.__tag == "Right"
                                                                                then 
                                                                                  let
                                                                                    _8 = _7.__field0;
                                                                                  in
                                                                                    
                                                                                    let
                                                                                      __pattern0 = __fail: 
                                                                                        if _8.__tag == "Left"
                                                                                          then 
                                                                                            let
                                                                                              r = _8.__field0;
                                                                                            in
                                                                                              i r
                                                                                          else __fail;
                                                                                      __pattern1 = __fail: 
                                                                                        if _8.__tag == "Right"
                                                                                          then 
                                                                                            let
                                                                                              _9 = _8.__field0;
                                                                                            in
                                                                                              
                                                                                              let
                                                                                                __pattern0 = __fail: 
                                                                                                  if _9.__tag == "Left"
                                                                                                    then 
                                                                                                      let
                                                                                                        r = _9.__field0;
                                                                                                      in
                                                                                                        j r
                                                                                                    else __fail;
                                                                                                __pattern1 = __fail: 
                                                                                                  if _9.__tag == "Right"
                                                                                                    then 
                                                                                                      let
                                                                                                        _10 = _9.__field0;
                                                                                                      in
                                                                                                        module."Data.Void".absurd (unwrap _10)
                                                                                                    else __fail;
                                                                                                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 271:43 - 273:65";
                                                                                              in
                                                                                                __pattern0 (__pattern1 __patternFail)
                                                                                          else __fail;
                                                                                      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 269:41 - 273:65";
                                                                                    in
                                                                                      __pattern0 (__pattern1 __patternFail)
                                                                                else __fail;
                                                                            __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 267:39 - 273:65";
                                                                          in
                                                                            __pattern0 (__pattern1 __patternFail)
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 265:37 - 273:65";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 263:35 - 273:65";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 261:33 - 273:65";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 259:31 - 273:65";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 257:29 - 273:65";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 255:27 - 273:65";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 253:37 - 273:65";
    in
      __pattern0 (__pattern1 __patternFail);
  coproduct1 = y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              r
          else __fail;
      __pattern1 = __fail: 
        if y.__tag == "Right"
          then 
            let
              _1 = y.__field0;
            in
              module."Data.Void".absurd (unwrap _1)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 136:16 - 138:45";
    in
      __pattern0 (__pattern1 __patternFail);
  at9 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 126:13 - 128:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at8 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 121:13 - 123:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at7 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0.__field0.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 116:13 - 118:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at6 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 111:13 - 113:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at5 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 106:13 - 108:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at4 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 101:13 - 103:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at3 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 96:13 - 98:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at2 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 91:13 - 93:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at10 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Right" && y.__field0.__tag == "Right" && y.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Right" && y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__tag == "Left"
          then 
            let
              r = y.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 131:14 - 133:9";
    in
      __pattern0 (__pattern1 __patternFail);
  at1 = b: f: y: 
    let
      __pattern0 = __fail: 
        if y.__tag == "Left"
          then 
            let
              r = y.__field0;
            in
              f r
          else __fail;
      __pattern1 = __fail: b;
      __patternFail = builtins.throw "Pattern match failure in .spago/functors/master/src/Data/Functor/Coproduct/Nested.purs at 86:13 - 88:9";
    in
      __pattern0 (__pattern1 __patternFail);
in
  {inherit in1 in2 in3 in4 in5 in6 in7 in8 in9 in10 at1 at2 at3 at4 at5 at6 at7 at8 at9 at10 coproduct1 coproduct2 coproduct3 coproduct4 coproduct5 coproduct6 coproduct7 coproduct8 coproduct9 coproduct10;}