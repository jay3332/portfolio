#import "../../../root.typ": *

#show: book-section.with(name: "Introduction to Linear Maps")

== Linear Maps

#definition(ref: <linear-map>)[Linear Map][
  Let $V$ and $W$ be vector spaces over the same field $F$.
  A *linear map* (or *linear transformation*) from $V$ to $W$ is a function $T: V -> W$ 
  such that the following properties hold:
  
  + *Additivity.* $forall bf(u), bf(v) in V, T(bf(u) + bf(v)) = T(bf(u)) + T(bf(v))$.
  + *Homogeneity.* $forall bf(v) in V, forall c in F, T(c bf(v)) = c T(bf(v))$.

  These two properties are known as the *linearity conditions* or *linear map axioms*.
]

#terminology[Domain and Codomain][
  Let $T: V -> W$ be a linear map. The *domain* of $T$ is $V$, and the *codomain* of $T$ is $W$.
]

#terminology[Preimage and Image of a Vector under a Linear Map][
  Let $T: V -> W$ be a linear map such that $T(bf(v)) = bf(w)$ for some $bf(v) in V$ and $bf(w) in W$.
  - $bf(v)$ is called the *preimage* of $bf(w)$ under $T$.
  - $bf(w)$ is called the *image* of $bf(v)$ under $T$.
  In which case, we say that $T$ _maps_ $bf(v)$ to $bf(w)$.
]

#notation(oneline: true)[
  The shorthand notation $bf(v) |-> T(bf(v))$ is often used to denote the action of a linear map $T$ on a vector $bf(v)$. For example, if $T(bf(v)) = bf(w)$, we would write $bf(v) |-> bf(w)$ to indicate that $T$ maps $bf(v)$ to $bf(w)$.
]

#example[Differentiation is a linear map][
  Let $PP_n (RR)$ denote the set of polynomials with real coefficients of degree at most $n$. 
  Define a function $T: PP_n (RR) -> PP_(n-1) (RR)$ by $f |-> f'$, where $f'$ is the derivative of $f$. 
  Show that $T$ is a linear map.

  #proof[
    To show that $T$ is a linear map, we need to verify the two linearity conditions: additivity and homogeneity.

    1. *Additivity.* Let $f, g in PP_n (RR)$. We need to show that $T(f + g) = T(f) + T(g)$.
       We have:
       $
         T(f + g) = (f + g)' = f' + g' = T(f) + T(g).
       $
       Thus, additivity holds.

    2. *Homogeneity.* Let $f in PP_n (RR)$ and let $c in RR$. We need to show that $T(c f) = c T(f)$.
       We have:
       $
         T(c f) = (c f)' = c f' = c T(f).
       $
       Thus, homogeneity holds.

    Since both linearity conditions are satisfied, we conclude that $T$ is a linear map. #proof-qed
  ]
]

#notation[Set of Linear Maps][
  The set of all linear maps from $V$ to $W$ may be denoted by $cal(L)(V, W)$ or $cal(L)_(V->W)$.
  Additionally, the set of all linear maps from $V$ to itself may be denoted by $cal(L)(V)$ or $cal(L)_V$.
]

#theorem(ref: <linear-map-2>)[Alternative Characterization of Linearity][
  Let $V$ and $W$ be vector spaces over the same field $F$, and let $T: V -> W$ be a function. 
  Then $T$ is a linear map if and only if:
  $ forall bf(u), bf(v) in V, forall a, b in F, T(a bf(u) + b bf(v)) = a T(bf(u)) + b T(bf(v)). $
]

#corollary[General Linearity][
  Let $V$ and $W$ be vector spaces over the same field $F$, and let $T: V -> W$ be a function. 
  Then $T$ is a linear map if and only if for all $c_1, c_2, ..., c_k in F$ and all $bf(v)_1, bf(v)_2, ..., bf(v)_k in V$:
  $
    T(sum_(i=1)^k c_i bf(v)_i) = sum_(i=1)^k c_i T(bf(v)_i).
  $
]

#theorem(ref: <zero-vector-preservation>)[Zero Vector Preservation of Linear Maps][
  Let $V$ and $W$ be vector spaces over the same field $F$, and let $T: V -> W$ be a linear map. 
  Then $T$ preserves the zero vector, i.e. $T(bf(0)_V) = bf(0)_W$.
]

#proof(card-prefix-ref(<zero-vector-preservation>))[
  Assume $T: V -> W$ over $F$ is a linear map that satisfies the linearity conditions in 
  #card-prefix-ref(<linear-map>). Then by #card-prefix-ref(<zero-scalar-times-vector>),
  $T(bf(0)_V) = T(0_F bf(v))$ for any $bf(v) in V$. By homogeneity, $T(0_F bf(v)) = 0_F T(bf(v))$. 
  Since $T(bf(v)) in W$, by #card-prefix-ref(<zero-scalar-times-vector>) again, $0_F T(bf(v)) = bf(0)_W$. Thus, by transitivity of equality, $T(bf(0)_V) = bf(0)_W$. #proof-qed
]

We can apply multiple linear maps in succession by _composing_ them, and the result is still a linear map. 
This allows us to build more complex linear maps from simpler ones, and to analyze the structure of linear
maps in terms of their compositions.

#theorem(ref: <composition-of-linear-maps>)[Composition of Linear Maps][
  Define the linear maps $U: V -> W$ and $T: W -> X$. Then the function composition of $T$ and $U$, 
  denoted $T compose U$, is a linear map from $V$ to $X$, where $T compose U$ is defined by:
  $
    (T compose U)(bf(v)) = T(U(bf(v))).
  $
]

#notation(oneline: true)[
  The composition $T compose U$ of two linear maps may be denoted by juxtaposition, i.e. $T U$.
  This should not be confused with the product of two functions. Furthermore, the repeated
  composition of a linear map $n$ times may be denoted $T^n$, and should not be confused with the 
  $n$#th power of a function:
  $ T U = T compose U, #h(2em) T^n = underbrace(T compose T compose ... compose T, n "times"). $
]

#proof(card-prefix-ref(<composition-of-linear-maps>))[
  Let $U: V -> W$ and $T: W -> X$ be linear maps. We need to show that $T compose U: V -> X$ is a linear map, i.e. it satisfies the linearity conditions.

  1. *Additivity.* Let $bf(u), bf(v) in V$. We need to show that $(T compose U)(bf(u) + bf(v)) = (T compose U)(bf(u)) + (T compose U)(bf(v))$.
     We have:
     $
       (T compose U)(bf(u) + bf(v)) = T(U(bf(u) + bf(v))) = T(U(bf(u)) + U(bf(v)))
       &= T(U(bf(u))) + T(U(bf(v))) \ &= (T compose U)(bf(u)) + (T compose U)(bf(v)).
     $
     Thus, additivity holds.

  2. *Homogeneity.* Let $bf(v) in V$ and let $c in F$. We need to show that $(T compose U)(c bf(v)) = c (T compose U)(bf(v))$.
     We have:
     $
       (T compose U)(c bf(v)) = T(U(c bf(v))) = T(c U(bf(v))) = c T(U(bf(v))) = c (T compose U)(bf(v)).
     $
     Thus, homogeneity holds.

  Since both linearity conditions are satisfied, we conclude that $T compose U$ is a linear map. #proof-qed
]

The simplest linear maps are the _identity_ and _zero_ linear maps. The identity linear map
on a vector space $V$ maps every vector to itself:

#definition[Identity Linear Map][
  Let $V$ be a vector space. The *identity map* or *identity transformation* on $V$, denoted $id_V$, 
  is the linear map from $V$ to itself defined by:
  $
    id_V (bf(v)) = bf(v) "for all" bf(v) in V.
  $
  That is, $id_V: V -> V$ is the linear map defined by $bf(v) |-> bf(v)$.
]

#corollary(oneline: true)[For any linear map $T: V -> W$, $id_W compose T = T compose id_V = T$.]

#definition[Zero Linear Map][
  Let $V$ and $W$ be vector spaces over the same field $F$. The *zero map* or *zero transformation* 
  from $V$ to $W$, denoted $0_(V->W)$, is the linear map defined by:
  $
    0_(V->W) (bf(v)) = bf(0)_W "for all" bf(v) in V.
  $
  That is, $0_(V->W): V -> W$ is the linear map defined by $bf(v) |-> bf(0)_W$.
]

#theorem(ref: <linearity-of-basis-transformation>)[Linearity of the Basis Transformation][
  Let $V$ be an $n$-dimensional vector space over a field $F$, and suppose $cal(B)$
  is a basis for $V$. Then the *basis transformation* $[dot]_cal(B): V -> F^n$ defined by
  $bf(v) |-> [bf(v)]_cal(B)$ is a linear map.
]

#proof(card-prefix-ref(<linearity-of-basis-transformation>))[
  Let $V$ be an $n$-dimensional vector space over a field $F$, and suppose 
  $cal(B) = {bf(b)_1, dots, bf(b)_n}$ is an ordered basis for $V$. 
  Let $bf(u), bf(v) in V$ and let $c in F$, and suppose $[bf(u)]_cal(B) = (alpha_1, dots, alpha_n)$ 
  and $[bf(v)]_cal(B) = (beta_1, dots, beta_n)$.
  Then we can write:
  $
    bf(u) = sum_(i=1)^n alpha_i bf(b)_i, #h(2em) bf(v) = sum_(i=1)^n beta_i bf(b)_i.
  $
  
  We need to show that the basis transformation $[dot]_cal(B): V -> F^n$ defined by
  $bf(v) |-> [bf(v)]_cal(B)$ satisfies linearity conditions.

  1. *Additivity.* We have:
    $
      [bf(u) + bf(v)]_cal(B) &= [sum_(i=1)^n alpha_i bf(b)_i + sum_(i=1)^n beta_i bf(b)_i]_cal(B) #h(2em) && "by substitution" \
      &= [sum_(i=1)^n (alpha_i + beta_i) bf(b)_i]_cal(B) #h(2em) && "by distributivity" \
      &= (alpha_1 + beta_1, dots, alpha_n + beta_n) #h(2em) && "by definition of basis coordinates" \
      &= (alpha_1, dots, alpha_n) + (beta_1, dots, beta_n) #h(2em) && "by vector addition in" F^n \
      &= [bf(u)]_cal(B) + [bf(v)]_cal(B) && "by substitution".
    $
  2. *Homogeneity.* We have:
    $
      [c bf(u)]_cal(B) &= [c sum_(i=1)^n alpha_i bf(b)_i]_cal(B) #h(2em) && "by substitution" \
      &= [sum_(i=1)^n (c alpha_i) bf(b)_i]_cal(B) #h(2em) && "by distributivity" \
      &= (c alpha_1, dots, c alpha_n) #h(2em) && "by definition of basis coordinates" \
      &= c (alpha_1, dots, alpha_n) #h(2em) && "by scalar multiplication in" F^n \
      &= c [bf(u)]_cal(B) && "by substitution".
    $

  Since both linearity conditions are satisfied, $[dot]_cal(B)$ is a linear map. #proof-qed
]

#theorem[Sets of Linear Maps are Vector Spaces][
  Let $V$ and $W$ be vector spaces over the same field $F$. 
  Then the set of all linear maps from $V$ to $W$, denoted $cal(L)(V, W)$, is a vector space over $F$ under
  the following operations:

  - *Pointwise addition.* For $T, S in cal(L)(V, W)$, define $(T + S)(bf(v)) = T(bf(v)) + S(bf(v))$ for all $bf(v) in V$.
  - *Scalar multiplication.* For $T in cal(L)(V, W)$ and $c in F$, define $(c T)(bf(v)) = c T(bf(v))$ for all $bf(v) in V$.

  Furthermore, $dim(cal(L)(V, W)) = dim(V) dim(W)$.
]

== Kernel, Nullity, and Injectivity

#definition(ref: <kernel>)[Kernel of a Linear Map][
  Let $T: V -> W$ be a linear map. The *kernel* or *null space* of $T$, denoted $ker(T)$, is the set of all vectors in $V$ that are mapped to the zero vector in $W$. Formally:
  $
    ker(T) = {bf(v) in V suchthat T(bf(v)) = bf(0)_W}.
  $
]

#theorem(ref: <kernel-is-a-subspace>)[Kernel is a Subspace of the Domain][
  Let $T: V -> W$ be a linear map. Then $ker(T)$ is a subspace of $V$.
]

#proof(card-title-ref(<kernel-is-a-subspace>))[
  Let $T: V -> W$ be a linear map. Checking the #card-title-ref(<subspace-criteria>):

  + *Existence of vector additive identity.* Since $T(bf(0)_V) = bf(0)_W$ by #card-prefix-ref(<zero-vector-preservation>), $bf(0)_V in ker(T)$.
  + *Closure under vector addition.* Let $bf(u), bf(v) in ker(T)$. Then $T(bf(u)) = T(bf(v)) = bf(0)_W$. By additivity, $T(bf(u) + bf(v)) = T(bf(u)) + T(bf(v)) = bf(0)_W + bf(0)_W = bf(0)_W$, so $bf(u) + bf(v) in ker(T)$.
  + *Closure under scalar multiplication.* Let $bf(v) in ker(T)$ and let $c in F$. Then $T(bf(v)) = bf(0)_W$. By homogeneity, $T(c bf(v)) = c T(bf(v)) = c bf(0)_W = bf(0)_W$, so $c bf(v) in ker(T)$. #proof-qed
]

#definition(ref: <nullity>)[Nullity of a Linear Map][
  Let $T: V -> W$ be a linear map. The *nullity* of $T$ is the dimension of the kernel of $T$: 
  $ nullity(T) = dim(ker(T)). $
]

#theorem(ref: <nullity-theorem>)[Nullity Theorem][
  Let $T: V -> W$ be a linear map. Then $T$ is injective if and only if $nullity(T) = 0$;
  that is, $T$ is injective if and only if $ker(T) = {bf(0)_V}$.
]

== Image, Rank, and Surjectivity

#definition(ref: <image>)[Image of a Linear Map][
  Let $T: V -> W$ be a linear map. The *image* or *range* of $T$, denoted $im(T)$, is the set of all vectors in $W$ that are the image of some vector in $V$ under $T$. Formally:
  $
    im(T) = {bf(w) in W suchthat exists bf(v) in V "s.t." T(bf(v)) = bf(w)}.
  $
]

#theorem(ref: <image-is-a-subspace>)[Image is a Subspace of the Codomain][
  Let $T: V -> W$ be a linear map. Then $im(T)$ is a subspace of $W$.
]

#proof(card-title-ref(<image-is-a-subspace>))[
  Let $T: V -> W$ be a linear map. Checking the #card-title-ref(<subspace-criteria>):

  + *Existence of vector additive identity.* Since $T(bf(0)_V) = bf(0)_W$ by #card-prefix-ref(<zero-vector-preservation>), $bf(0)_W in im(T)$.
  + *Closure under vector addition.* Let $bf(w)_1, bf(w)_2 in im(T)$. Then there exist $bf(v)_1, bf(v)_2 in V$ such that $T(bf(v)_1) = bf(w)_1$ and $T(bf(v)_2) = bf(w)_2$. By additivity, $T(bf(v)_1 + bf(v)_2) = T(bf(v)_1) + T(bf(v)_2) = bf(w)_1 + bf(w)_2$. Since $bf(v)_1 + bf(v)_2 in V$, it is the preimage of $bf(w)_1 + bf(w)_2$, so $bf(w)_1 + bf(w)_2 in im(T)$.
  + *Closure under scalar multiplication.* Let $bf(w) in im(T)$ and let $c in F$. Then there exists $bf(v) in V$ such that $T(bf(v)) = bf(w)$. By homogeneity, $T(c bf(v)) = c T(bf(v)) = c bf(w)$, so $c bf(w) in im(T)$. #proof-qed
]

#notation(oneline: true)[
  Let $f: U -> V$ be a function. Then for any subset $S subset.eq U$, 
  $f(S)$ (called the image of $S$ under $f$) denotes the set of all images of elements in $S$ under $f$:
  $
    f(S) = {f(s) in V suchthat s in S} subset.eq im(f).
  $
]

#definition(ref: <rank>)[Rank of a Linear Map][
  Let $T: V -> W$ be a linear map. The *rank* of $T$ is the dimension of the image of $T$: 
  $ rank(T) = dim(im(T)). $
]

#theorem(ref: <rank-nullity-theorem>)[Rank-Nullity Theorem][
  Let $T: V -> W$ be a linear map. 
  If $V$ is finite-dimensional, then $W$ is also finite-dimensional, 
  and the following equation holds:
  $
    rank(T) + nullity(T) = dim(V).
  $
]

#terminology(oneline: true)[
  A transformation $T$ is *bijective* (sometimes also called a *one-to-one correspondence*) if $T$ is both injective and surjective.
]

== Exercises

#exercise(oneline: true, ref: <ex-linear-map-2>)[
  Prove the _#card-title-ref(<linear-map-2>)_.
]

#exercise(oneline: true)[
  Show that the transformation $T: RR^2 -> RR$ defined by $T(x, y) = x y$ is not linear. 
]

#exercise[
  Let $T: F^oo -> F^oo$ be the transformation defined by:
  $
    T(a_1, a_2, a_3, dots) = (0, a_1, a_2, a_3, dots) "for all" a_1, a_2, a_3, dots in F.
  $
  Determine, with proof, whether $T$ is a linear map.
]

#exercise(oneline: true)[
  Suppose $T$ is a linear map. Show that if the set ${bf(v)_1, bf(v)_2, ..., bf(v)_k}$ is linearly 
  independent, then the set ${T(bf(v)_1), T(bf(v)_2), ..., T(bf(v)_k)}$ is also linearly independent.
]

#exercise(oneline: true)[
  Let $V$ and $W$ be finite-dimensional vector spaces such that $dim(V) > dim(W)$. 
  Show that there does not exist an injective linear map $T in cal(L)(V, W)$.
]

#exercise(oneline: true)[
  Let $T, S in cal(L)(V, W)$ be linear maps. Show that:
  $
    ker(T) inter ker(S) subset.eq ker(T + S).
  $
]

#exercise(oneline: true)[
  For linear maps $T: U -> V$ and $S: V -> W$, both with finite rank, show that:
  $
    rank(S compose T) <= min(rank(S), rank(T)).
  $
]

#exercise(oneline: true)[
  Suppose $V$ is a finite-dimensional vector space. Show that there exists a
  linear map $T: V -> V$ such that $ker(T) = im(T)$ if and only if $dim(V)$ is even.
]

#exercise(oneline: true, ref: <ex-idempotent-map>)[
  A linear map $T$ is called *idempotent* iff $T^2 = T$.
  Suppose that $T: V -> V$ is a linear map, where $V$ is finite-dimensional. 
  Show that if $T$ is idempotent, then $V = ker(T) plus.o im(T)$.
]

#exercise(oneline: true)[
  #set enum(numbering: "a.", indent: 1.33em)
  Suppose $V$ is a finite-dimensional vector space, and $T in cal(L)(V)$. Show that:
  + $ker(T) subset.eq ker(T^2) subset.eq ker(T^3) subset.eq dots.c$
  + If for some $k$, $ker(T^k) = ker(T^(k + 1))$, then $ker(T^k) = ker(T^m)$ for all $m >= k$
]

/*The Dimension of the Map Space: Let $V$ and $W$ be finite-dimensional vector spaces. We can view the set of all linear maps $\mathcal{L}(V, W)$ as a vector space under pointwise addition and scalar multiplication.Fix a non-zero vector $v_0 \in V$, and define a evaluation map $\Phi: \mathcal{L}(V, W) \to W$ by:$$\Phi(T) = T(v_0)$$Prove that $\Phi$ is a linear map.Determine $\dim \operatorname{null} \Phi$ and $\dim \operatorname{range} \Phi$ in terms of $\dim V$ and $\dim W$. Use this to rigorously compute the total dimension $\dim \mathcal{L}(V, W)$.*/

#exercise[
  #set enum(numbering: "a.")
  Let $V$ and $W$ be finite-dimensional vector spaces. The set of all linear maps from $V$ to $W$,
  $cal(L)(V, W)$, is itself a vector space under pointwise addition and scalar multiplication.  
  
  Fix some vector $bf(v)_0 in V$ to define the following function $Phi: cal(L)(V, W) -> W$:
  $
    Phi(T) = T(bf(v)_0).
  $
  + Show that $Phi$ is a linear map.
  + Find $nullity(Phi)$ and $rank(Phi)$ in terms of $dim(V)$ and $dim(W)$.
  + Find $dim(cal(L)(V, W))$ in terms of $dim(V)$ and $dim(W)$.
]
