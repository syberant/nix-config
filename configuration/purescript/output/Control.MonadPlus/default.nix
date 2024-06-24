
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Data.Functor" = import ../Data.Functor;
    };
  MonadPlus-Dict = x: x;
  monadPlusArray = 
    { "Monad0" = _: module."Control.Monad".monadArray;
      "Alternative1" = _: module."Control.Alternative".alternativeArray;
    };
in
  
  { inherit monadPlusArray;
    inherit (module."Control.Alt") alt;
    inherit (module."Control.Alternative") guard;
    inherit (module."Control.Applicative") liftA1 pure unless when;
    inherit (module."Control.Apply") apply;
    inherit (module."Control.Bind") bind ifM join;
    inherit (module."Control.Monad") ap liftM1;
    inherit (module."Control.MonadZero");
    inherit (module."Control.Plus") empty;
    inherit (module."Data.Functor") map void;
  }