
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Data.Functor" = import ../Data.Functor;
      "Data.Unit" = import ../Data.Unit;
      "Type.Proxy" = import ../Type.Proxy;
    };
  Monad-Dict = x: x;
  whenM = dictMonad: 
    let
      bind = module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined);
      when = module."Control.Applicative".when (dictMonad."Applicative0" module."Prim".undefined);
    in
      mb: m: bind mb (b: when b m);
  unlessM = dictMonad: 
    let
      bind = module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined);
      unless = module."Control.Applicative".unless (dictMonad."Applicative0" module."Prim".undefined);
    in
      mb: m: bind mb (b: unless b m);
  monadProxy = 
    { "Applicative0" = _: module."Control.Applicative".applicativeProxy;
      "Bind1" = _: module."Control.Bind".bindProxy;
    };
  monadFn = 
    { "Applicative0" = _: module."Control.Applicative".applicativeFn;
      "Bind1" = _: module."Control.Bind".bindFn;
    };
  monadArray = 
    { "Applicative0" = _: module."Control.Applicative".applicativeArray;
      "Bind1" = _: module."Control.Bind".bindArray;
    };
  liftM1 = dictMonad: 
    let
      bind = module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined);
      pure = module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined);
    in
      f: a: bind a (a': pure (f a'));
  ap = dictMonad: 
    let
      bind = module."Control.Bind".bind (dictMonad."Bind1" module."Prim".undefined);
      pure = module."Control.Applicative".pure (dictMonad."Applicative0" module."Prim".undefined);
    in
      f: a: bind f (f': bind a (a': pure (f' a')));
in
  
  { inherit liftM1 whenM unlessM ap monadFn monadArray monadProxy;
    inherit (module."Control.Applicative") liftA1 pure unless when;
    inherit (module."Control.Apply") apply;
    inherit (module."Control.Bind") bind ifM join;
    inherit (module."Data.Functor") map void;
  }