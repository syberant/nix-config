
let
  module = 
    { "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Data.Functor" = import ../Data.Functor;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  map_ = foreign.map_;
  pure_ = foreign.pure_;
  bind_ = foreign.bind_;
  run = foreign.run;
  while = foreign.while;
  for = foreign.for;
  foreach = foreign.foreach;
  new = foreign.new;
  read = foreign.read;
  modifyImpl = foreign.modifyImpl;
  write = foreign.write;
  modify' = modifyImpl;
  modify = f: modify' 
    ( s: 
      let
        s' = f s;
      in
        
        { state = s';
          value = s';
        }
    );
  functorST = {map = map_;};
  monadST = 
    { "Applicative0" = _: applicativeST;
      "Bind1" = _: bindST;
    };
  bindST = 
    { bind = bind_;
      "Apply0" = _: applyST;
    };
  applyST = 
    { apply = module."Control.Monad".ap monadST;
      "Functor0" = _: functorST;
    };
  applicativeST = 
    { pure = pure_;
      "Apply0" = _: applyST;
    };
in
  {inherit run while for foreach new read modify' modify write functorST applyST applicativeST bindST monadST;}