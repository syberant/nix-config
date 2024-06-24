
let
  module = 
    { "Data.Monoid.Additive" = import ../Data.Monoid.Additive;
      "Data.Monoid.Conj" = import ../Data.Monoid.Conj;
      "Data.Monoid.Disj" = import ../Data.Monoid.Disj;
      "Data.Monoid.Dual" = import ../Data.Monoid.Dual;
      "Data.Monoid.Endo" = import ../Data.Monoid.Endo;
      "Data.Monoid.Multiplicative" = import ../Data.Monoid.Multiplicative;
      "Data.Semigroup.First" = import ../Data.Semigroup.First;
      "Data.Semigroup.Last" = import ../Data.Semigroup.Last;
      "Safe.Coerce" = import ../Safe.Coerce;
    };
  coerce = module."Safe.Coerce".coerce module."Prim".undefined;
  Newtype-Dict = x: x;
  wrap = _: coerce;
  wrap1 = wrap module."Prim".undefined;
  unwrap = _: coerce;
  unwrap1 = unwrap module."Prim".undefined;
  underF2 = _: _: _: _: v: coerce;
  underF = _: _: _: _: v: coerce;
  under2 = _: _: v: coerce;
  under = _: _: v: coerce;
  un = _: v: unwrap1;
  traverse = _: _: v: coerce;
  overF2 = _: _: _: _: v: coerce;
  overF = _: _: _: _: v: coerce;
  over2 = _: _: v: coerce;
  over = _: _: v: coerce;
  newtypeMultiplicative = {"Coercible0" = _: module."Prim".undefined;};
  newtypeLast = {"Coercible0" = _: module."Prim".undefined;};
  newtypeFirst = {"Coercible0" = _: module."Prim".undefined;};
  newtypeEndo = {"Coercible0" = _: module."Prim".undefined;};
  newtypeDual = {"Coercible0" = _: module."Prim".undefined;};
  newtypeDisj = {"Coercible0" = _: module."Prim".undefined;};
  newtypeConj = {"Coercible0" = _: module."Prim".undefined;};
  newtypeAdditive = {"Coercible0" = _: module."Prim".undefined;};
  collect = _: _: v: coerce;
  alaF = _: _: _: _: v: coerce;
  ala = _: _: _: v: f: coerce (f wrap1);
in
  {inherit wrap unwrap un ala alaF over overF under underF over2 overF2 under2 underF2 traverse collect newtypeAdditive newtypeMultiplicative newtypeConj newtypeDisj newtypeDual newtypeEndo newtypeFirst newtypeLast;}