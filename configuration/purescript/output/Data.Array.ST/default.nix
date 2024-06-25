
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad.ST" = import ../Control.Monad.ST;
      "Control.Monad.ST.Internal" = import ../Control.Monad.ST.Internal;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Ord" = import ../Data.Ord;
      "Data.Ordering" = import ../Data.Ordering;
      "Data.Ring" = import ../Data.Ring;
      "Prelude" = import ../Prelude;
      "Prim.TypeError" = import ../Prim.TypeError;
    };
  foreign = import ./foreign.nix;
  unsafeFreeze = foreign.unsafeFreeze;
  unsafeThaw = foreign.unsafeThaw;
  new = foreign.new;
  thaw = foreign.thaw;
  shiftImpl = foreign.shiftImpl;
  sortByImpl = foreign.sortByImpl;
  freeze = foreign.freeze;
  peekImpl = foreign.peekImpl;
  poke = foreign.poke;
  popImpl = foreign.popImpl;
  pushAll = foreign.pushAll;
  unshiftAll = foreign.unshiftAll;
  toAssocArray = foreign.toAssocArray;
  bind = module."Control.Bind".bind module."Control.Monad.ST.Internal".bindST;
  negate = module."Data.Ring".negate module."Data.Ring".ringInt;
  pure = module."Control.Applicative".pure module."Control.Monad.ST.Internal".applicativeST;
  withArray = f: xs: bind (thaw xs) (result: bind (f result) (_: unsafeFreeze result));
  unshift = a: unshiftAll [a];
  sortBy = comp: sortByImpl comp 
    ( v: 
      let
        __pattern0 = __fail: if v.__tag == "GT" then 1 else __fail;
        __pattern1 = __fail: if v.__tag == "EQ" then 0 else __fail;
        __pattern2 = __fail: if v.__tag == "LT" then negate 1 else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST.purs at 113:31 - 116:11";
      in
        __pattern0 (__pattern1 (__pattern2 __patternFail))
    );
  sortWith = dictOrd: 
    let
      comparing = module."Data.Ord".comparing dictOrd;
    in
      f: sortBy (comparing f);
  sort = dictOrd: sortBy (module."Data.Ord".compare dictOrd);
  shift = shiftImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  run = st: module."Control.Monad.ST.Internal".run (bind st unsafeFreeze);
  push = a: pushAll [a];
  pop = popImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  peek = peekImpl module."Data.Maybe".Just module."Data.Maybe".Nothing;
  modify = i: f: xs: bind (peek i xs) 
    ( entry: 
      let
        __pattern0 = __fail: 
          if entry.__tag == "Just"
            then 
              let
                x = entry.__field0;
              in
                poke i (f x) xs
            else __fail;
        __pattern1 = __fail: if entry.__tag == "Nothing" then pure false else __fail;
        __patternFail = builtins.throw "Pattern match failure in .spago/arrays/master/src/Data/Array/ST.purs at 198:3 - 200:26";
      in
        __pattern0 (__pattern1 __patternFail)
    );
  empty = _: new;
in
  {inherit run withArray new empty peek poke modify pop push pushAll shift unshift unshiftAll sort sortBy sortWith freeze thaw unsafeFreeze unsafeThaw toAssocArray;}