
let
  module = 
    { "Control.Alt" = import ../Control.Alt;
      "Control.Alternative" = import ../Control.Alternative;
      "Control.Applicative" = import ../Control.Applicative;
      "Control.Apply" = import ../Control.Apply;
      "Control.Bind" = import ../Control.Bind;
      "Control.Extend" = import ../Control.Extend;
      "Control.Monad" = import ../Control.Monad;
      "Control.MonadZero" = import ../Control.MonadZero;
      "Control.Plus" = import ../Control.Plus;
      "Data.Bounded" = import ../Data.Bounded;
      "Data.Eq" = import ../Data.Eq;
      "Data.Functor" = import ../Data.Functor;
      "Data.Functor.Invariant" = import ../Data.Functor.Invariant;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Newtype" = import ../Data.Newtype;
      "Data.Ord" = import ../Data.Ord;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Data.Show" = import ../Data.Show;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  First = x: x;
  showFirst = dictShow: 
    let
      show = module."Data.Show".show (module."Data.Maybe".showMaybe dictShow);
    in
      
      { show = v: 
          let
            __pattern0 = __fail: 
              let
                a = v;
              in
                append "First (" (append (show a) ")");
            __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe/First.purs at 49:1 - 50:46";
          in
            __pattern0 __patternFail;
      };
  semigroupFirst = 
    { append = v: v1: 
        let
          __pattern0 = __fail: 
            if v.__tag == "Just"
              then 
                let
                  first = v;
                in
                  first
              else __fail;
          __pattern1 = __fail: 
            let
              second = v1;
            in
              second;
          __patternFail = builtins.throw "Pattern match failure in .spago/maybe/master/src/Data/Maybe/First.purs at 52:1 - 54:27";
        in
          __pattern0 (__pattern1 __patternFail);
    };
  ordFirst = dictOrd: module."Data.Maybe".ordMaybe dictOrd;
  ord1First = module."Data.Maybe".ord1Maybe;
  newtypeFirst = {"Coercible0" = _: module."Prim".undefined;};
  monoidFirst = 
    { mempty = module."Data.Maybe".Nothing;
      "Semigroup0" = _: semigroupFirst;
    };
  monadFirst = module."Data.Maybe".monadMaybe;
  invariantFirst = module."Data.Maybe".invariantMaybe;
  functorFirst = module."Data.Maybe".functorMaybe;
  extendFirst = module."Data.Maybe".extendMaybe;
  eqFirst = dictEq: module."Data.Maybe".eqMaybe dictEq;
  eq1First = module."Data.Maybe".eq1Maybe;
  boundedFirst = dictBounded: module."Data.Maybe".boundedMaybe dictBounded;
  bindFirst = module."Data.Maybe".bindMaybe;
  applyFirst = module."Data.Maybe".applyMaybe;
  applicativeFirst = module."Data.Maybe".applicativeMaybe;
  altFirst = 
    { alt = module."Data.Semigroup".append semigroupFirst;
      "Functor0" = _: functorFirst;
    };
  plusFirst = 
    { empty = module."Data.Monoid".mempty monoidFirst;
      "Alt0" = _: altFirst;
    };
  alternativeFirst = 
    { "Applicative0" = _: applicativeFirst;
      "Plus1" = _: plusFirst;
    };
  monadZeroFirst = 
    { "Monad0" = _: monadFirst;
      "Alternative1" = _: alternativeFirst;
      "MonadZeroIsDeprecated2" = _: module."Prim".undefined;
    };
in
  {inherit First newtypeFirst eqFirst eq1First ordFirst ord1First boundedFirst functorFirst invariantFirst applyFirst applicativeFirst bindFirst monadFirst extendFirst showFirst semigroupFirst monoidFirst altFirst plusFirst alternativeFirst monadZeroFirst;}