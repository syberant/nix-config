
let
  module = 
    { "Data.Either" = import ../Data.Either;
      "Data.Void" = import ../Data.Void;
    };
  in9 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v))))))));
  in8 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v)))))));
  in7 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v))))));
  in6 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v)))));
  in5 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v))));
  in4 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v)));
  in3 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v));
  in2 = v: module."Data.Either".Right (module."Data.Either".Left v);
  in10 = v: module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Right (module."Data.Either".Left v)))))))));
  in1 = module."Data.Either".Left;
  either9 = a: b: c: d: e: f: g: h: i: y: 
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
                                                                                              module."Data.Void".absurd _9
                                                                                          else __fail;
                                                                                      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 253:29 - 255:40";
                                                                                    in
                                                                                      __pattern0 (__pattern1 __patternFail)
                                                                                else __fail;
                                                                            __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 251:27 - 255:40";
                                                                          in
                                                                            __pattern0 (__pattern1 __patternFail)
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 249:25 - 255:40";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 247:23 - 255:40";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 245:21 - 255:40";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 243:19 - 255:40";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 241:17 - 255:40";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 239:15 - 255:40";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 237:31 - 255:40";
    in
      __pattern0 (__pattern1 __patternFail);
  either8 = a: b: c: d: e: f: g: h: y: 
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
                                                                                    module."Data.Void".absurd _8
                                                                                else __fail;
                                                                            __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 232:27 - 234:38";
                                                                          in
                                                                            __pattern0 (__pattern1 __patternFail)
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 230:25 - 234:38";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 228:23 - 234:38";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 226:21 - 234:38";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 224:19 - 234:38";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 222:17 - 234:38";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 220:15 - 234:38";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 218:29 - 234:38";
    in
      __pattern0 (__pattern1 __patternFail);
  either7 = a: b: c: d: e: f: g: y: 
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
                                                                          module."Data.Void".absurd _7
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 213:25 - 215:36";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 211:23 - 215:36";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 209:21 - 215:36";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 207:19 - 215:36";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 205:17 - 215:36";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 203:15 - 215:36";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 201:27 - 215:36";
    in
      __pattern0 (__pattern1 __patternFail);
  either6 = a: b: c: d: e: f: y: 
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
                                                                module."Data.Void".absurd _6
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 196:23 - 198:34";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 194:21 - 198:34";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 192:19 - 198:34";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 190:17 - 198:34";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 188:15 - 198:34";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 186:25 - 198:34";
    in
      __pattern0 (__pattern1 __patternFail);
  either5 = a: b: c: d: e: y: 
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
                                                      module."Data.Void".absurd _5
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 181:21 - 183:32";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 179:19 - 183:32";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 177:17 - 183:32";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 175:15 - 183:32";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 173:23 - 183:32";
    in
      __pattern0 (__pattern1 __patternFail);
  either4 = a: b: c: d: y: 
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
                                            module."Data.Void".absurd _4
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 168:19 - 170:30";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 166:17 - 170:30";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 164:15 - 170:30";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 162:21 - 170:30";
    in
      __pattern0 (__pattern1 __patternFail);
  either3 = a: b: c: y: 
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
                                  module."Data.Void".absurd _3
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 157:17 - 159:28";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 155:15 - 159:28";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 153:19 - 159:28";
    in
      __pattern0 (__pattern1 __patternFail);
  either2 = a: b: y: 
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
                        module."Data.Void".absurd _2
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 148:15 - 150:26";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 146:17 - 150:26";
    in
      __pattern0 (__pattern1 __patternFail);
  either10 = a: b: c: d: e: f: g: h: i: j: y: 
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
                                                                                                        module."Data.Void".absurd _10
                                                                                                    else __fail;
                                                                                                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 276:31 - 278:44";
                                                                                              in
                                                                                                __pattern0 (__pattern1 __patternFail)
                                                                                          else __fail;
                                                                                      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 274:29 - 278:44";
                                                                                    in
                                                                                      __pattern0 (__pattern1 __patternFail)
                                                                                else __fail;
                                                                            __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 272:27 - 278:44";
                                                                          in
                                                                            __pattern0 (__pattern1 __patternFail)
                                                                      else __fail;
                                                                  __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 270:25 - 278:44";
                                                                in
                                                                  __pattern0 (__pattern1 __patternFail)
                                                            else __fail;
                                                        __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 268:23 - 278:44";
                                                      in
                                                        __pattern0 (__pattern1 __patternFail)
                                                  else __fail;
                                              __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 266:21 - 278:44";
                                            in
                                              __pattern0 (__pattern1 __patternFail)
                                        else __fail;
                                    __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 264:19 - 278:44";
                                  in
                                    __pattern0 (__pattern1 __patternFail)
                              else __fail;
                          __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 262:17 - 278:44";
                        in
                          __pattern0 (__pattern1 __patternFail)
                    else __fail;
                __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 260:15 - 278:44";
              in
                __pattern0 (__pattern1 __patternFail)
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 258:34 - 278:44";
    in
      __pattern0 (__pattern1 __patternFail);
  either1 = y: 
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
              module."Data.Void".absurd _1
          else __fail;
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 141:13 - 143:24";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 131:13 - 133:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 126:13 - 128:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 121:13 - 123:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 116:13 - 118:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 111:13 - 113:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 106:13 - 108:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 101:13 - 103:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 96:13 - 98:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 136:14 - 138:9";
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
      __patternFail = builtins.throw "Pattern match failure in .spago/either/master/src/Data/Either/Nested.purs at 91:13 - 93:9";
    in
      __pattern0 (__pattern1 __patternFail);
in
  {inherit in1 in2 in3 in4 in5 in6 in7 in8 in9 in10 at1 at2 at3 at4 at5 at6 at7 at8 at9 at10 either1 either2 either3 either4 either5 either6 either7 either8 either9 either10;}