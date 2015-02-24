--data Draw = Bye String | SimpleMatch String String | CompositeMatch Draw Draw

--vectNilLeftNeutral : (xs : Vect n a) -> [] ++ xs = xs
--vectNilLeftNeutral [] = refl
--vectNilLeftNeutral (x :: xs) =
--  vectConsCong _ _ _ (vectNilLeftNeutral xs)

--half: Vect n String -> Vect n String
--half {n} xs = rewrite sym (vectNilRightNeutral _) in take n (xs)

--foo: Vect n String -> Vect n String
--foo {n} xs = let xs' : Vect (n + 0) String
--                     = rewrite (plusZeroRightNeutral n) in xs in
--                 take n xs'

takeBetter : (m : Fin n) -> Vect n a -> Vect (cast m) a
takeBetter FZ     xs        = []
takeBetter (FS k) (x :: xs) = x :: takeBetter k xs

pointless: Vect n String -> Vect n String
pointless {n} xs = takeBetter (cast n) xs
