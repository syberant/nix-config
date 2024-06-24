
let
  module = 
    { "Data.Const" = import ../Data.Const;
      "Data.Functor" = import ../Data.Functor;
      "Data.Void" = import ../Data.Void;
      "Prelude" = import ../Prelude;
    };
  Contravariant-Dict = x: x;
  contravariantConst = 
    { cmap = v: v1: 
        let
          __pattern0 = __fail: 
            let
              x = v1;
            in
              x;
          __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Functor/Contravariant.purs at 34:1 - 35:29";
        in
          __pattern0 __patternFail;
    };
  cmap = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.cmap;
      __patternFail = builtins.throw "Pattern match failure in .spago/contravariant/master/src/Data/Functor/Contravariant.purs at 17:3 - 17:45";
    in
      __pattern0 __patternFail;
  cmapFlipped = dictContravariant: 
    let
      cmap1 = cmap dictContravariant;
    in
      x: f: cmap1 f x;
  coerce = dictContravariant: 
    let
      cmap1 = cmap dictContravariant;
    in
      dictFunctor: 
      let
        map = module."Data.Functor".map dictFunctor;
      in
        a: map module."Data.Void".absurd (cmap1 module."Data.Void".absurd a);
  imapC = dictContravariant: 
    let
      cmap1 = cmap dictContravariant;
    in
      v: f: cmap1 f;
in
  {inherit cmap cmapFlipped coerce imapC contravariantConst;}